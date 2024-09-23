@implementation CHCutPoint

- (CHCutPoint)initWithStrokeIndex:(int64_t)a3 pointIndex:(int64_t)a4 isEndOfStroke:(BOOL)a5
{
  CHCutPoint *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHCutPoint;
  result = -[CHCutPoint init](&v9, sel_init);
  result->_strokeIndex = a3;
  result->_pointIndex = a4;
  result->_isEndOfStroke = a5;
  return result;
}

- (BOOL)isStartOfStroke
{
  return self->_pointIndex == 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_compare_(self, a2, (uint64_t)a3, v3, v4, v5) == 0;
}

- (unint64_t)hash
{
  return (4 * self->_pointIndex) | (2 * self->_strokeIndex);
}

- (int64_t)compare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int64_t v50;

  v4 = a3;
  v10 = objc_msgSend_strokeIndex(self, v5, v6, v7, v8, v9);
  if (v10 > objc_msgSend_strokeIndex(v4, v11, v12, v13, v14, v15))
    goto LABEL_2;
  v22 = objc_msgSend_strokeIndex(self, v16, v17, v18, v19, v20);
  if (v22 >= objc_msgSend_strokeIndex(v4, v23, v24, v25, v26, v27))
  {
    v33 = objc_msgSend_pointIndex(self, v28, v29, v30, v31, v32);
    if (v33 > objc_msgSend_pointIndex(v4, v34, v35, v36, v37, v38))
    {
LABEL_2:

      return 1;
    }
    v44 = objc_msgSend_pointIndex(self, v39, v40, v41, v42, v43);
    if (v44 >= objc_msgSend_pointIndex(v4, v45, v46, v47, v48, v49))
      v50 = 0;
    else
      v50 = -1;

    return v50;
  }
  else
  {

    return -1;
  }
}

+ (id)sortedCHCutPointArray:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_1E77F1530, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)strokeIndex
{
  return self->_strokeIndex;
}

- (int64_t)pointIndex
{
  return self->_pointIndex;
}

- (BOOL)isEndOfStroke
{
  return self->_isEndOfStroke;
}

@end
