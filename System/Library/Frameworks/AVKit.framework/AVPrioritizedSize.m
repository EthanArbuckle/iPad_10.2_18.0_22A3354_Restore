@implementation AVPrioritizedSize

- (AVPrioritizedSize)init
{
  AVPrioritizedSize *v2;
  NSMutableArray *v3;
  NSMutableArray *requiredPrioritySizes;
  NSMutableArray *v5;
  NSMutableArray *veryHighPrioritySizes;
  NSMutableArray *v7;
  NSMutableArray *highPrioritySizes;
  NSMutableArray *v9;
  NSMutableArray *mediumPrioritySizes;
  NSMutableArray *v11;
  NSMutableArray *lowPrioritySizes;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVPrioritizedSize;
  v2 = -[AVPrioritizedSize init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requiredPrioritySizes = v2->_requiredPrioritySizes;
    v2->_requiredPrioritySizes = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    veryHighPrioritySizes = v2->_veryHighPrioritySizes;
    v2->_veryHighPrioritySizes = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    highPrioritySizes = v2->_highPrioritySizes;
    v2->_highPrioritySizes = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mediumPrioritySizes = v2->_mediumPrioritySizes;
    v2->_mediumPrioritySizes = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lowPrioritySizes = v2->_lowPrioritySizes;
    v2->_lowPrioritySizes = v11;

    v2->_currentTotalSize = (CGSize)*MEMORY[0x1E0C9D820];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPrioritySizes, 0);
  objc_storeStrong((id *)&self->_mediumPrioritySizes, 0);
  objc_storeStrong((id *)&self->_highPrioritySizes, 0);
  objc_storeStrong((id *)&self->_veryHighPrioritySizes, 0);
  objc_storeStrong((id *)&self->_requiredPrioritySizes, 0);
}

- (void)addSize:(CGSize)a3 withPriority:(unint64_t)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  height = a3.height;
  width = a3.width;
  -[AVPrioritizedSize currentTotalSize](self, "currentTotalSize");
  v9 = width + v8;
  -[AVPrioritizedSize currentTotalSize](self, "currentTotalSize");
  v11 = v10 == 0.0;
  v12 = height;
  if (!v11)
  {
    -[AVPrioritizedSize currentTotalSize](self, "currentTotalSize");
    if (v12 >= height)
      v12 = height;
  }
  -[AVPrioritizedSize setCurrentTotalSize:](self, "setCurrentTotalSize:", v9, v12);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  switch(a4)
  {
    case 0uLL:
      -[AVPrioritizedSize lowPrioritySizes](self, "lowPrioritySizes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1uLL:
      -[AVPrioritizedSize mediumPrioritySizes](self, "mediumPrioritySizes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      -[AVPrioritizedSize highPrioritySizes](self, "highPrioritySizes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      -[AVPrioritizedSize veryHighPrioritySizes](self, "veryHighPrioritySizes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      -[AVPrioritizedSize requiredPrioritySizes](self, "requiredPrioritySizes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v15 = v14;
      objc_msgSend(v14, "addObject:", v16);

      v13 = v16;
      break;
    default:
      break;
  }

}

- (void)setCurrentTotalSize:(CGSize)a3
{
  self->_currentTotalSize = a3;
}

- (NSMutableArray)requiredPrioritySizes
{
  return self->_requiredPrioritySizes;
}

+ (id)sizesResolvingFirstPrioritizedSize:(id)a3 secondPrioritizedSize:(id)a4 inAvailableWidth:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentTotalSize");
  v11 = v10;
  objc_msgSend(v8, "currentTotalSize");
  v13 = v11 + v12;
  if (v13 > a5)
  {
    v14 = v7;
    v15 = 0;
    v16 = v14;
    do
    {
      objc_msgSend(v16, "removeLastSizeOfPriority:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "sizeValue");
        v13 = v13 - v19;
      }
      else if (v16 == v14)
      {
        v16 = v8;

      }
      else
      {
        ++v15;
        v20 = v14;

        v16 = v20;
      }

    }
    while (v13 > a5 && v15 < 5);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v35[0] = v7;
  v35[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "currentTotalSize");
        objc_msgSend(v27, "valueWithSize:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v24);
  }

  v29 = (void *)objc_msgSend(v9, "copy");
  return v29;
}

- (CGSize)currentTotalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentTotalSize.width;
  height = self->_currentTotalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)removeLastSizeOfPriority:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[AVPrioritizedSize lowPrioritySizes](self, "lowPrioritySizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0uLL:
      -[AVPrioritizedSize lowPrioritySizes](self, "lowPrioritySizes");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[AVPrioritizedSize mediumPrioritySizes](self, "mediumPrioritySizes");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[AVPrioritizedSize highPrioritySizes](self, "highPrioritySizes");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[AVPrioritizedSize veryHighPrioritySizes](self, "veryHighPrioritySizes");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      -[AVPrioritizedSize requiredPrioritySizes](self, "requiredPrioritySizes");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;

      v5 = v7;
      break;
    default:
      break;
  }
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 1);
    objc_msgSend(v8, "sizeValue");
    v10 = v9;
    -[AVPrioritizedSize currentTotalSize](self, "currentTotalSize");
    v12 = v11 - v10;
    -[AVPrioritizedSize currentTotalSize](self, "currentTotalSize");
    -[AVPrioritizedSize setCurrentTotalSize:](self, "setCurrentTotalSize:", v12);
  }

  return v8;
}

- (void)setRequiredPrioritySizes:(id)a3
{
  objc_storeStrong((id *)&self->_requiredPrioritySizes, a3);
}

- (NSMutableArray)veryHighPrioritySizes
{
  return self->_veryHighPrioritySizes;
}

- (void)setVeryHighPrioritySizes:(id)a3
{
  objc_storeStrong((id *)&self->_veryHighPrioritySizes, a3);
}

- (NSMutableArray)highPrioritySizes
{
  return self->_highPrioritySizes;
}

- (void)setHighPrioritySizes:(id)a3
{
  objc_storeStrong((id *)&self->_highPrioritySizes, a3);
}

- (NSMutableArray)mediumPrioritySizes
{
  return self->_mediumPrioritySizes;
}

- (void)setMediumPrioritySizes:(id)a3
{
  objc_storeStrong((id *)&self->_mediumPrioritySizes, a3);
}

- (NSMutableArray)lowPrioritySizes
{
  return self->_lowPrioritySizes;
}

- (void)setLowPrioritySizes:(id)a3
{
  objc_storeStrong((id *)&self->_lowPrioritySizes, a3);
}

@end
