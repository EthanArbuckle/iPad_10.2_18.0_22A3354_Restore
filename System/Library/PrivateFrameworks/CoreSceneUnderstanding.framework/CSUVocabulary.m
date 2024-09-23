@implementation CSUVocabulary

- (CSUVocabulary)initWithName:(id)a3 labelFilePath:(id)a4 internalCount:(unint64_t)a5 visibleCount:(unint64_t)a6 startIndex:(unint64_t)a7
{
  id v13;
  id v14;
  CSUVocabulary *v15;
  CSUVocabulary *v16;
  NSArray *labels;
  CSUVocabulary *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSUVocabulary;
  v15 = -[CSUVocabulary init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_count = a6;
    v16->_internalCount = a5;
    v16->_startIndex = a7;
    labels = v16->_labels;
    v16->_labels = 0;

    objc_storeStrong((id *)&v16->_labelFilePath, a4);
    sub_23A01159C((uint64_t)&v16->_visibleLabels, a6);
    v18 = v16;
  }

  return v16;
}

- (NSArray)labels
{
  uint64_t v2;
  uint64_t v3;
  NSArray *labels;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  NSArray *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *end;
  NSArray *v27;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  labels = self->_labels;
  if (!labels)
  {
    v6 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], a2, (uint64_t)self->_labelFilePath, v2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithContentsOfURL_error_(v6, v8, (uint64_t)v7, 0, v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_labels;
    self->_labels = v10;

    v15 = self->_labels;
    if (!v15)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("Failed to load labels for vocabulary %@ from file at %@"), v13, v14, self->_name, self->_labelFilePath);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithCode_message_(CSUError, v30, 2, (uint64_t)v29, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logInternalError_(CSUError, v33, (uint64_t)v32, v34, v35);

      v27 = 0;
      return v27;
    }
    v41 = 0;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = v15;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v36, (uint64_t)v42, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v37;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v16);
          v40 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * v24);
          if (objc_msgSend_length(v40, v18, v19, v20, v21)
            && (objc_msgSend_hasPrefix_(v40, v18, (uint64_t)CFSTR("CVML_UNKNOWN"), v20, v21) & 1) == 0)
          {
            end = self->_visibleLabels.__end_;
            if (end < self->_visibleLabels.__end_cap_.__value_)
            {
              *end = v40;
              end[1] = v41;
              v25 = end + 2;
            }
            else
            {
              v25 = sub_23A01300C(&self->_visibleLabels.__begin_, &v40, &v41);
            }
            self->_visibleLabels.__end_ = v25;
          }
          ++v41;
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v36, (uint64_t)v42, 16);
      }
      while (v22);
    }

    labels = self->_labels;
  }
  v27 = labels;
  return v27;
}

- (void)_enumerateAllLabelsInVocabularyUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *begin;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  char v25;

  v4 = (void (**)(id, _QWORD, char *))a3;
  v25 = 0;
  objc_msgSend_labels(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_labels(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_count(v14, v15, v16, v17, v18);

    if (v19)
    {
      v20 = 0;
      begin = self->_visibleLabels.__begin_;
      v22 = v19 - 1;
      do
      {
        while (v20 == begin[1])
        {
          v4[2](v4, *begin, &v25);
          begin += 2;
          if (v25)
            v24 = 1;
          else
            v24 = v22 == v20;
          ++v20;
          if (v24)
            goto LABEL_14;
        }
        v4[2](v4, 0, &v25);
        if (v25)
          v23 = 1;
        else
          v23 = v22 == v20;
        ++v20;
      }
      while (!v23);
    }
  }
LABEL_14:

}

- (void)_enumerateVisibleLabelsInVocabularyUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *begin;
  char *end;
  char *v12;
  BOOL v13;
  char v14;

  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  objc_msgSend_labels(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    begin = (char *)self->_visibleLabels.__begin_;
    end = (char *)self->_visibleLabels.__end_;
    if (begin != end)
    {
      v12 = begin + 16;
      do
      {
        v4[2](v4, *((_QWORD *)v12 - 2), &v14);
        if (v14)
          v13 = 1;
        else
          v13 = v12 == end;
        v12 += 16;
      }
      while (!v13);
    }
  }

}

- (void)_enumerateVisibleLabelsAndIndicesInVocabularyUsingBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *end;
  _QWORD *begin;
  BOOL v12;
  char v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend_labels(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    begin = self->_visibleLabels.__begin_;
    end = self->_visibleLabels.__end_;
    if (begin != end)
    {
      do
      {
        (*((void (**)(id, _QWORD, _QWORD, char *))v4 + 2))(v4, *begin, begin[1], &v13);
        begin += 2;
        if (v13)
          v12 = 1;
        else
          v12 = begin == end;
      }
      while (!v12);
    }
  }

}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)internalCount
{
  return self->_internalCount;
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void).cxx_destruct
{
  char *begin;
  char *end;
  void *v5;
  void *v6;

  objc_storeStrong((id *)&self->_name, 0);
  begin = (char *)self->_visibleLabels.__begin_;
  if (begin)
  {
    end = (char *)self->_visibleLabels.__end_;
    v5 = self->_visibleLabels.__begin_;
    if (end != begin)
    {
      do
      {
        v6 = (void *)*((_QWORD *)end - 2);
        end -= 16;

      }
      while (end != begin);
      v5 = self->_visibleLabels.__begin_;
    }
    self->_visibleLabels.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_labelFilePath, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
