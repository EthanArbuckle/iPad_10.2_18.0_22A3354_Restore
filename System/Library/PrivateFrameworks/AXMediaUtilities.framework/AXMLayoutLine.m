@implementation AXMLayoutLine

+ (id)line:(id)a3
{
  id v3;
  AXMLayoutLine *v4;
  uint64_t v5;
  NSMutableArray *sequences;

  v3 = a3;
  v4 = objc_alloc_init(AXMLayoutLine);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  sequences = v4->_sequences;
  v4->_sequences = (NSMutableArray *)v5;

  return v4;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "boundingFrameForItems:", self->_sequences);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)normalizedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "normalizedBoundingFrameForItems:", self->_sequences);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)recognizedTextFeatures
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sequences;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "feature", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recognizedTextFeatures");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)addSequence:(id)a3
{
  -[NSMutableArray addObject:](self->_sequences, "addObject:", a3);
}

- (id)sequences
{
  return self->_sequences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequences, 0);
}

@end
