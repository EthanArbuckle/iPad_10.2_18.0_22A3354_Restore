@implementation DSNSURLBatchEnumerator

- (DSNSURLBatchEnumerator)initWithURLs:(id)a3 targets:(id)a4 batchSize:(unint64_t)a5
{
  id v9;
  id v10;
  DSNSURLBatchEnumerator *v11;
  DSNSURLBatchEnumerator *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DSNSURLBatchEnumerator;
  v11 = -[DSNSURLBatchEnumerator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_index = 0;
    v11->_batchSize = a5;
    objc_storeStrong((id *)&v11->_urls, a3);
    objc_storeStrong((id *)&v12->_targetNames, a4);
  }

  return v12;
}

- (id)nextBatch
{
  unint64_t index;
  NSUInteger v4;
  unint64_t v5;
  unint64_t batchSize;
  NSArray *urls;
  void *v8;
  void *v9;
  NSArray *targetNames;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  index = self->_index;
  if (index >= -[NSArray count](self->_urls, "count"))
    return 0;
  v4 = -[NSArray count](self->_urls, "count");
  v5 = self->_index;
  if (v4 - v5 >= self->_batchSize)
    batchSize = self->_batchSize;
  else
    batchSize = v4 - v5;
  urls = self->_urls;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectsAtIndexes:](urls, "objectsAtIndexes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  targetNames = self->_targetNames;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", self->_index, batchSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectsAtIndexes:](targetNames, "objectsAtIndexes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self->_index += batchSize;
  v15[0] = CFSTR("SourceURLs");
  v15[1] = CFSTR("TargetNames");
  v16[0] = v9;
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNames, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
