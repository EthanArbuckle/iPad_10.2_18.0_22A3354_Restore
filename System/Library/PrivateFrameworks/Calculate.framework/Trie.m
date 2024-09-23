@implementation Trie

- (Trie)init
{
  Trie *v2;
  Trie *v3;
  uint64_t v4;
  TrieNode *root;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *objects;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)Trie;
  v2 = -[Trie init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_characterSize = 100;
    v2->_characters = (char *)malloc_type_calloc(0x64uLL, 1uLL, 0x100004077774924uLL);
    v3->_nodeSize = 100;
    v3->_nodes = ($953B5E98BDB001443454E6BAFD1349F5 *)malloc_type_calloc(0x64uLL, 0xCuLL, 0x10000403E1C8BA9uLL);
    v3->_nodeCount = 1;
    +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, v3, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    root = v3->_root;
    v3->_root = (TrieNode *)v4;

    v3->_firstByteCache = (int *)malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
    v3->_autocompress = 0;
    v6 = (void *)MEMORY[0x1E0C99DE8];
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "arrayWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    objects = v3->_objects;
    v3->_objects = (NSMutableArray *)v8;

  }
  return v3;
}

- (void)dealloc
{
  char *characters;
  $953B5E98BDB001443454E6BAFD1349F5 *nodes;
  int *firstByteCache;
  objc_super v6;

  characters = self->_characters;
  if (characters)
    free(characters);
  nodes = self->_nodes;
  if (nodes)
    free(nodes);
  firstByteCache = self->_firstByteCache;
  if (firstByteCache)
    free(firstByteCache);
  v6.receiver = self;
  v6.super_class = (Class)Trie;
  -[Trie dealloc](&v6, sel_dealloc);
}

- (void)writeCharacter:(unsigned __int8)a3
{
  int characterCount;
  int characterSize;
  char *characters;
  int v8;
  int v9;
  size_t v10;

  characterCount = self->_characterCount;
  characterSize = self->_characterSize;
  if (characterCount >= characterSize)
  {
    if (characterSize >= 0)
      v8 = self->_characterSize;
    else
      v8 = characterSize + 1;
    v9 = characterSize + (v8 >> 1);
    if (v9 <= 100)
      v10 = 100;
    else
      v10 = v9;
    self->_characterSize = v10;
    characters = (char *)malloc_type_realloc(self->_characters, v10, 0x100004077774924uLL);
    self->_characters = characters;
    self->_compressed = 0;
    characterCount = self->_characterCount;
  }
  else
  {
    characters = self->_characters;
  }
  self->_characterCount = characterCount + 1;
  characters[characterCount] = a3;
}

- (void)writeNode:(id)a3
{
  unsigned int var3;
  uint64_t v4;
  int nodeCount;
  int nodeSize;
  $953B5E98BDB001443454E6BAFD1349F5 *nodes;
  int v9;
  int v10;
  $953B5E98BDB001443454E6BAFD1349F5 *v11;

  var3 = a3.var3;
  v4 = (uint64_t)a3;
  nodeCount = self->_nodeCount;
  nodeSize = self->_nodeSize;
  if (nodeCount >= nodeSize)
  {
    if (nodeSize >= 0)
      v9 = self->_nodeSize;
    else
      v9 = nodeSize + 1;
    v10 = nodeSize + (v9 >> 1);
    if (v10 <= 100)
      v10 = 100;
    self->_nodeSize = v10;
    nodes = ($953B5E98BDB001443454E6BAFD1349F5 *)malloc_type_realloc(self->_nodes, 12 * v10, 0x10000403E1C8BA9uLL);
    self->_nodes = nodes;
    self->_compressed = 0;
    nodeCount = self->_nodeCount;
  }
  else
  {
    nodes = self->_nodes;
  }
  self->_nodeCount = nodeCount + 1;
  v11 = &nodes[nodeCount];
  *(_QWORD *)v11 = v4;
  v11->var3 = var3;
}

- (void)setRoot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (char)characters
{
  return self->_characters;
}

- (void)setCharacters:(char *)a3
{
  self->_characters = a3;
}

- (int)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(int)a3
{
  self->_characterCount = a3;
}

- (int)characterSize
{
  return self->_characterSize;
}

- (void)setCharacterSize:(int)a3
{
  self->_characterSize = a3;
}

- ($953B5E98BDB001443454E6BAFD1349F5)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id *)a3
{
  self->_nodes = a3;
}

- (int)nodeCount
{
  return self->_nodeCount;
}

- (void)setNodeCount:(int)a3
{
  self->_nodeCount = a3;
}

- (int)nodeSize
{
  return self->_nodeSize;
}

- (void)setNodeSize:(int)a3
{
  self->_nodeSize = a3;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (int)firstByteCache
{
  return self->_firstByteCache;
}

- (void)setFirstByteCache:(int *)a3
{
  self->_firstByteCache = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

- (void)compress
{
  void **v1;
  size_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    if (!*((_BYTE *)result + 9))
    {
      v2 = *((int *)result + 3);
      *((_DWORD *)result + 4) = v2;
      result[5] = malloc_type_realloc(result[5], v2, 0x100004077774924uLL);
      v3 = *((int *)v1 + 5);
      *((_DWORD *)v1 + 6) = v3;
      result = (void **)malloc_type_realloc(v1[6], 12 * v3, 0x10000403E1C8BA9uLL);
      v1[6] = result;
      *((_BYTE *)v1 + 9) = 1;
    }
  }
  return result;
}

+ (void)enumerateCharactersInKey:(uint64_t)a3 range:(uint64_t)a4 usingBlock:(void *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v9 = a2;
  objc_opt_self();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__Trie_enumerateCharactersInKey_range_usingBlock___block_invoke;
  v11[3] = &unk_1E6E9FAF8;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", a3, a4, 2, v11);

}

uint64_t __50__Trie_enumerateCharactersInKey_range_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)objectForKeyedSubscript:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a1)
  {
    -[TrieNode objectForKeyedSubscript:](*(id **)(a1 + 32), a2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
    {
      -[TrieNode object](v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setObject:(void *)a3 forKeyedSubscript:
{
  uint64_t v4;
  id v5;
  id v6;

  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = a2;
    -[TrieNode objectForKey:create:](v4, a3, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TrieNode setObject:]((uint64_t)v6, v5);

  }
}

@end
