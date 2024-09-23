@implementation MTLResourceList

- (void)releaseAllObjectsAndReset
{
  MTLResourceListChunk *p_currentChunk;
  MTLResourceListChunk *nextChunk;
  MTLResourceListChunk *v5;
  unsigned int *hopInfo;
  unint64_t *usedInfo;

  p_currentChunk = &self->_listPriv.currentChunk;
  nextChunk = self->_listPriv.currentChunk.nextChunk;
  if (nextChunk)
  {
    do
    {
      v5 = nextChunk->nextChunk;
      MTLResourceListChunkFreeEntries(nextChunk);
      free(nextChunk);
      nextChunk = v5;
    }
    while (v5);
  }
  MTLResourceListChunkFreeEntries(p_currentChunk);
  self->_listPriv.currentChunk.currentEntry = 0;
  self->_listPriv.currentChunk.nextChunk = 0;
  hopInfo = self->_listPriv.hopInfo;
  if (hopInfo)
    bzero(hopInfo, 4 * self->_listPriv.hashSize);
  usedInfo = self->_listPriv.usedInfo;
  if (usedInfo)
    bzero(usedInfo, (unint64_t)self->_listPriv.hashSize >> 3);
}

- (MTLResourceList)initWithCapacity:(int)a3
{
  MTLResourceList *v4;
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLResourceList;
  v4 = -[MTLResourceList init](&v7, sel_init);
  *(_QWORD *)&v4->_listPriv.hashSize = 0xB00000800;
  v4->_listPriv.hopInfo = v4->_defaultHopInfo;
  v4->_listPriv.hashTable = v4->_defaultHashTable;
  v4->_listPriv.usedInfo = v4->_defaultUsedInfo;
  v4->_listPriv.chunkEntryCapacity = a3;
  v4->_listPriv.currentChunk.currentEntry = 0;
  v4->_listPriv.currentChunk.nextChunk = 0;
  v5 = malloc_type_malloc(8 * a3 + 24, 0xDE147B92uLL);
  *(_DWORD *)v5 = 0;
  v5[1] = v5 + 3;
  v5[2] = 0;
  v4->_listPriv.currentChunk.entries = v5 + 3;
  return v4;
}

- (void)dealloc
{
  MTLResourceList *hashTable;
  MTLResourceList *hopInfo;
  MTLResourceList *usedInfo;
  objc_super v6;

  hashTable = (MTLResourceList *)self->_listPriv.hashTable;
  if (hashTable != (MTLResourceList *)self->_defaultHashTable)
    free(hashTable);
  hopInfo = (MTLResourceList *)self->_listPriv.hopInfo;
  if (hopInfo != (MTLResourceList *)self->_defaultHopInfo)
    free(hopInfo);
  usedInfo = (MTLResourceList *)self->_listPriv.usedInfo;
  if (usedInfo != (MTLResourceList *)self->_defaultUsedInfo)
    free(usedInfo);
  self->_listPriv.usedInfo = 0;
  self->_listPriv.hopInfo = 0;
  -[MTLResourceList releaseAllObjectsAndReset](self, "releaseAllObjectsAndReset");
  free(self->_listPriv.currentChunk.entries - 3);
  v6.receiver = self;
  v6.super_class = (Class)MTLResourceList;
  -[MTLResourceList dealloc](&v6, sel_dealloc);
}

@end
