@implementation CKXORCReader

- (CKXORCReader)initWithSchema:(id)a3
{
  void *v4;
  void *v5;
  const char *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v4, v6, *MEMORY[0x1E0C99768], CFSTR("%@ is unavailable"), v5);

  return 0;
}

- (CKXORCReader)initWithSchema:(id)a3 helpers:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  CKXORCReader *v14;
  CKXORCReader *v15;
  void *v16;
  void *v18;
  const char *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v13 = a5;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 144, CFSTR("The ORC reader requires a helper object conforming to CKXORCHelpers"));

  }
  v20.receiver = self;
  v20.super_class = (Class)CKXORCReader;
  v14 = -[CKXReaderBase initWithSchema:](&v20, sel_initWithSchema_, v9);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_helpers, a4);
    v16 = v13;
    if (!v13)
      v16 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v15->_options, v16);
    if (!v13)

  }
  return v15;
}

- (BOOL)createReaderIfNecessaryWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  if (!self->_reader.__ptr_.__value_)
  {
    objc_msgSend_storage(self, a2, (uint64_t)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      NSStringFromSelector(sel_setReadableStorage_error_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v5, v7, *MEMORY[0x1E0C99778], CFSTR("Call %@ before writing data"), v6);

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D4BC3558;
    v12[3] = &unk_1E984B660;
    v12[4] = self;
    v8 = v12;
    sub_1D4BC3558((uint64_t)v8, v9, v10);

  }
  return 1;
}

- (void)createRowReaderForStruct:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  CKXORCReader *v6;
  _QWORD *begin;
  _QWORD *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[11];

  v13[10] = *MEMORY[0x1E0C80C00];
  v6 = self;
  if (!v6->_reader.__ptr_.__value_)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v10, (uint64_t)"void CKXReaderCheck(CKXORCReader *__strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v9, v12, (uint64_t)v11, CFSTR("CKXORCReaderWriter.mm"), 135, CFSTR("Reader not present: make sure that -[CKXORCReader setData:error:] has been called"));

  }
  begin = v6->_structToReaderBatchPair.__begin_;
  if (a3 >= ((char *)v6->_structToReaderBatchPair.__end_ - (char *)begin) >> 4 || !begin[2 * a3])
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1D4BC3BA0;
    v13[3] = &unk_1E984B688;
    v13[4] = v6;
    v13[5] = a3;
    v8 = v13;
    sub_1D4BC3BA0((uint64_t)v8);

  }
}

- (BOOL)loadBatchWithRow:(unint64_t)a3 forStruct:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  CKXORCReader *v9;
  const char *v10;
  _QWORD *v11;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = self;
  if (!v9->_reader.__ptr_.__value_)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)"void CKXReaderCheck(CKXORCReader *__strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v13, v16, (uint64_t)v15, CFSTR("CKXORCReaderWriter.mm"), 135, CFSTR("Reader not present: make sure that -[CKXORCReader setData:error:] has been called"));

  }
  objc_msgSend_createRowReaderForStruct_(v9, v10, a4);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D4BC43DC;
  v17[3] = &unk_1E984B6B0;
  v17[4] = v9;
  v17[5] = &v18;
  v17[6] = a3;
  v17[7] = a2;
  v17[8] = a4;
  v11 = v17;
  sub_1D4BC43DC((uint64_t)v11);

  LOBYTE(v11) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return (char)v11;
}

- (unint64_t)offsetInCurrentBatchForRow:(unint64_t)a3 forStruct:(unint64_t)a4
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v17;
  const char *v18;
  _QWORD v19[5];
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_loadBatchWithRow_forStruct_(self, a2, a3);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1D4BC4AB8;
  v19[3] = &unk_1E984B6D8;
  v19[4] = self;
  v20 = &v22;
  v21 = a4;
  v8 = v19;
  v9 = *((_QWORD *)self->_structToReaderBatchPair.__begin_ + 2 * a4);
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 48))(v9);
  *(_QWORD *)(v20[1] + 24) = v10;

  v13 = *(_QWORD *)(*((_QWORD *)self->_structToReaderBatchPair.__begin_ + 2 * a4 + 1) + 16);
  v14 = v23[3];
  v15 = a3 - v14;
  if (a3 < v14 || v15 >= v13)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 279, CFSTR("Incorrect rows loaded: row %llu does not fit in range %llu->llu"), a3, v23[3], v23[3] + v13);

    v15 = a3 - v23[3];
  }
  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)rowsForStructColumn:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  CKXORCReader *v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD v16[12];

  v16[11] = *MEMORY[0x1E0C80C00];
  v7 = self;
  if (!v7->_reader.__ptr_.__value_)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v13, (uint64_t)"void CKXReaderCheck(CKXORCReader *__strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v12, v15, (uint64_t)v14, CFSTR("CKXORCReaderWriter.mm"), 135, CFSTR("Reader not present: make sure that -[CKXORCReader setData:error:] has been called"));

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D4BC4EB4;
  v16[3] = &unk_1E984B700;
  v16[4] = v7;
  v16[5] = a3;
  v16[6] = a2;
  v8 = v16;
  sub_1D4BC4EB4((uint64_t)v8, v9, v10);

  return v7->_rowsForTopLevelContainerStructs.__begin_[a3];
}

- (void)rootColumnForStruct:(unint64_t)a3
{
  const char *v6;
  uint64_t v7;
  const void *v8;
  void *result;
  void *v10;
  const char *v11;

  objc_msgSend_createRowReaderForStruct_(self, a2, a3);
  v8 = (const void *)*((_QWORD *)self->_structToReaderBatchPair.__begin_ + 2 * a3 + 1);
  if (!v8
    || (result = __dynamic_cast(v8, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0)) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 325, CFSTR("Root column not found"));

    return 0;
  }
  return result;
}

- (BOOL)setReadableStorage:(id)a3 error:(id *)a4
{
  CKDSReadableStorage *v7;
  const char *v8;
  char v9;

  v7 = (CKDSReadableStorage *)a3;
  if (self->_storage == v7)
  {
    v9 = 1;
  }
  else
  {
    objc_storeStrong((id *)&self->_storage, a3);
    v9 = objc_msgSend__setInputWithError_(self, v8, (uint64_t)a4);
  }

  return v9;
}

- (BOOL)_setInputWithError:(id *)a3
{
  Reader *value;
  const char *v6;
  __end_ **begin;
  __end_cap_ **i;
  void *v9;
  char ReaderIfNecessaryWithError;
  id v11;
  void *v12;
  id v14;

  value = self->_reader.__ptr_.__value_;
  self->_reader.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Reader *, SEL))(*(_QWORD *)value + 8))(value, a2);
  sub_1D4BCA588(&self->_structToReaderBatchPair.__begin_, (uint64_t)self->_structToReaderBatchPair.__begin_);
  begin = self->_rowsForTopLevelContainerStructs.__begin_;
  for (i = self->_rowsForTopLevelContainerStructs.var0; i != begin; --i)
  {
    v9 = *(i - 1);

  }
  self->_rowsForTopLevelContainerStructs.var0 = begin;
  self->_loadCount = 0;
  v14 = 0;
  ReaderIfNecessaryWithError = objc_msgSend_createReaderIfNecessaryWithError_(self, v6, (uint64_t)&v14);
  v11 = v14;
  v12 = v11;
  if (a3 && (ReaderIfNecessaryWithError & 1) == 0)
    *a3 = objc_retainAutorelease(v11);

  return ReaderIfNecessaryWithError;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)rootStructWithType:(SEL)a3
{
  _QWORD *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  unint64_t *p_var1;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  _QWORD v16[5];
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D4BC5864;
  v16[3] = &unk_1E984B728;
  v16[4] = self;
  v17 = &v18;
  v7 = v16;
  v8 = (*(uint64_t (**)(Reader *))(*(_QWORD *)self->_reader.__ptr_.__value_ + 24))(self->_reader.__ptr_.__value_);
  *(_QWORD *)(v17[1] + 24) = v8;

  if (v19[3])
  {
    objc_msgSend_schema(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sub_1D4BB5E74((_BOOL8)v11, (const char *)a4, v12);

    retstr->var0 = a4;
    p_var1 = &retstr->var1;
    if (v13)
    {
      *(_OWORD *)p_var1 = xmmword_1D4BDD650;
    }
    else
    {
      *p_var1 = 0;
      p_var1[1] = 0;
    }
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
  }
  _Block_object_dispose(&v18, 8);
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  void *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v14;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v15;
  const char *v16;
  unint64_t v17;

  objc_msgSend_schema(self, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = sub_1D4BB5A68((uint64_t)v9, (const char *)a4, v10);

  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_structReferenceColumnForReference_(self, v12, a4);
  if (result
    && (v15 = result,
        result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v14, a5->var2, a5->var0), *((_BYTE *)&result->var0 + v15[1].var2)))
  {
    result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v16, a5->var2, a5->var0);
    v17 = a5->var2 + *(_QWORD *)(v15[4].var0 + 8 * (_QWORD)result);
    retstr->var0 = v11;
    retstr->var1 = 0;
  }
  else
  {
    v17 = -1;
    retstr->var0 = 0;
    retstr->var1 = -1;
  }
  retstr->var2 = v17;
  return result;
}

- (BOOL)referenceIsNull:(unint64_t)a3 inStruct:(id *)a4
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v19;
  const char *v20;

  objc_msgSend_schema(self, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = sub_1D4BB5700((uint64_t)v8, (const char *)a3, v9);

  if (v10 == 1)
  {
    v16 = objc_msgSend_structReferenceColumnForReference_(self, v11, a3);
    if (!v16)
      return 1;
  }
  else
  {
    if (v10 != 2)
      goto LABEL_8;
    objc_msgSend_schema(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = sub_1D4BB57C8((uint64_t)v13, (const char *)a3, v14);

    if ((unint64_t)(v15 - 1) >= 2)
    {
      if (!v15 || v15 == 3)
      {
        v16 = objc_msgSend_listColumnForReference_(self, v11, a3);
        if (!v16)
          return 1;
        return *(_BYTE *)(*(_QWORD *)(v16 + 40)
                        + objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, a4->var2, a4->var0)) == 0;
      }
LABEL_8:
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 423, CFSTR("Invalid field type"));

      return 0;
    }
    v16 = objc_msgSend_valueColumnForField_(self, v11, a3);
    if (!v16)
      return 1;
  }
  return *(_BYTE *)(*(_QWORD *)(v16 + 40)
                  + objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, a4->var2, a4->var0)) == 0;
}

- ($3CC19D079FD0B010EE84973AA846B91B)referencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  $3CC19D079FD0B010EE84973AA846B91B *result;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t var2;

  objc_msgSend_schema(self, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = sub_1D4BB57C8((uint64_t)v9, (const char *)a4, v10);

  if (v11)
  {
    v15 = -1;
  }
  else
  {
    objc_msgSend_schema(self, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = sub_1D4BB5B04((uint64_t)v16, (const char *)a4, v17);

  }
  if (a5->var1 == 1)
  {
    result = ($3CC19D079FD0B010EE84973AA846B91B *)(id)objc_msgSend_rowsForStructColumn_(self, v13, v15);
    v18 = 1;
    var2 = a4;
  }
  else
  {
    v18 = 0;
    var2 = a5->var2;
  }
  retstr->var0 = v15;
  retstr->var1 = a4;
  retstr->var2 = v18;
  retstr->var3 = var2;
  return result;
}

- (int64_t)lengthForList:(id *)a3
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t var3;
  const void *v16;
  _QWORD *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  const char *v28;

  v4 = (uint64_t)a2;
  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = *(_QWORD *)(v6[10] + 56 * a3->var1 + 16);
  else
    v7 = 0;

  objc_msgSend_schema(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = sub_1D4BB57C8((uint64_t)v10, (const char *)a3->var1, v11);

  var3 = a3->var3;
  if ((unint64_t)(v12 - 1) < 2)
  {
    if (a3->var2 == 1)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, v4, self, CFSTR("CKXORCReaderWriter.mm"), 470, CFSTR("Invalid list"));

    }
    v16 = (const void *)objc_msgSend_valueColumnForField_(self, v13, a3->var1);
    if (!v16)
      return 0;
    v17 = __dynamic_cast(v16, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846450, 0);
    if (!v17)
      return 0;
    return *(_QWORD *)(v17[17] + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v18, var3, v7));
  }
  else
  {
    if (v12)
    {
      if (v12 != 3)
        return v4;
LABEL_14:
      v22 = objc_msgSend_listColumnForReference_(self, v13, a3->var1);
      if (v22)
      {
        v24 = v22;
        v25 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v23, var3, v7);
        return *(_QWORD *)(*(_QWORD *)(v24 + 96) + 8 * v25 + 8) - *(_QWORD *)(*(_QWORD *)(v24 + 96) + 8 * v25);
      }
      return 0;
    }
    if (a3->var2 != 1)
      goto LABEL_14;
    objc_msgSend_rowsForStructColumn_(self, v13, a3->var0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend_count(v19, v20, v21);

  }
  return v4;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructAtIndex:(SEL)a3 inList:(int64_t)a4
{
  __int128 v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  const char *v15;
  unint64_t v16;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  _QWORD *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  _OWORD v31[2];
  _QWORD v32[7];
  _QWORD v33[4];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  if (a5->var0 == -1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a3, a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a3, self, CFSTR("CKXORCReaderWriter.mm"), 486, CFSTR("Invalid struct"));

  }
  v10 = *(_OWORD *)&a5->var2;
  v31[0] = *(_OWORD *)&a5->var0;
  v31[1] = v10;
  if (objc_msgSend_lengthForList_(self, a3, (uint64_t)v31) <= a4)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a3, self, CFSTR("CKXORCReaderWriter.mm"), 489, CFSTR("Index out of range"));

  }
  if (a5->var2 == 1)
  {
    objc_msgSend_rowsForStructColumn_(self, v11, a5->var0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0x7FFFFFFFFFFFFFFFLL;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1D4BCA404;
    v32[3] = &unk_1E984B7E8;
    v32[5] = &v34;
    v32[6] = a4;
    v32[4] = v33;
    objc_msgSend_enumerateRangesUsingBlock_(v13, v14, (uint64_t)v32);
    v16 = v35[3];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v15, *MEMORY[0x1E0C99858], CFSTR("Index %lu out of range"), a4);
      v16 = v35[3];
    }
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    objc_msgSend_schema(self, v11, v12);
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = *(_QWORD *)(v18[10] + 56 * a5->var1 + 16);
    else
      v19 = 0;

    v23 = objc_msgSend_listColumnForReference_(self, v20, a5->var1);
    if (!v23)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v21, v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a3, self, CFSTR("CKXORCReaderWriter.mm"), 499, CFSTR("Unexpected null struct list column in reader"));

    }
    v24 = *(_QWORD *)(*(_QWORD *)(v23 + 96)
                    + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v21, a5->var3, v19));
    result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)__dynamic_cast(*(const void **)(v23 + 120), (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846298, 0);
    v16 = a5->var3 + *(_QWORD *)(result[4].var0 + 8 * (v24 + a4));
  }
  retstr->var0 = a5->var0;
  retstr->var1 = 0;
  retstr->var2 = v16;
  return result;
}

- (unint64_t)valueSizeForField:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_schema(self, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_1D4BB5864((uint64_t)v4, (const char *)a3, v5);

  return v6;
}

- (void)copyData:(void *)a3 forField:(unint64_t)a4 inStruct:(id *)a5
{
  const void *v9;
  _QWORD *v10;
  const char *v11;
  _QWORD *v12;
  unint64_t var2;
  uint64_t v14;
  const char *v15;
  size_t v16;
  const char *v17;
  const void *v18;
  void *v20;
  const char *v21;

  if (a5->var1 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 520, CFSTR("Invalid struct"));

  }
  v9 = (const void *)objc_msgSend_valueColumnForField_(self, a2, a4);
  if (v9)
  {
    v10 = __dynamic_cast(v9, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846298, 0);
    if (v10)
    {
      v12 = v10;
      var2 = a5->var2;
      v14 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v11, var2, a5->var0);
      if (a3)
      {
        if (*(_BYTE *)(v12[5] + v14))
        {
          v16 = objc_msgSend_valueSizeForField_(self, v15, a4);
          v18 = (const void *)(v12[12]
                             + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, var2, a5->var0));
          memcpy(a3, v18, v16);
        }
      }
    }
  }
}

- (void)copyData:(void *)a3 forList:(id *)a4
{
  _QWORD *v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  const char *v21;
  const void *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  const char *v26;
  const void *v27;
  _QWORD *v28;
  const char *v29;
  _QWORD *v30;
  unint64_t var3;
  uint64_t v32;
  const char *v33;
  const void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  __int128 v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  id v54;
  _OWORD v55[2];

  v5 = a3;
  if (a4->var0 != -1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 533, CFSTR("Invalid struct"));

  }
  if (a4->var2 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 534, CFSTR("Invalid list"));

  }
  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = sub_1D4BB57C8((uint64_t)v8, (const char *)a4->var1, v9);

  if ((unint64_t)(v10 - 1) < 2)
  {
    objc_msgSend_schema(self, v11, v12);
    v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = *(_QWORD *)(v24[10] + 56 * a4->var1 + 16);
    else
      v25 = 0;

    v27 = (const void *)objc_msgSend_valueColumnForField_(self, v26, a4->var1);
    if (v27)
    {
      v28 = __dynamic_cast(v27, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846450, 0);
      if (v28)
      {
        v30 = v28;
        var3 = a4->var3;
        v32 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v29, var3, v25);
        if (v5)
        {
          if (*(_BYTE *)(v30[5] + v32))
          {
            v34 = *(const void **)(v30[12] + 8
                                           * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v33, var3, v25));
            v36 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v35, var3, v25);
            memcpy(v5, v34, *(_QWORD *)(v30[17] + 8 * v36));
          }
        }
      }
    }
  }
  else if (v10)
  {
    if (v10 == 3)
    {
      objc_msgSend_schema(self, v11, v12);
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v14 = v13 ? *(_QWORD *)(v13[10] + 56 * a4->var1 + 16) : 0;

      v16 = objc_msgSend_listColumnForReference_(self, v15, a4->var1);
      if (v16)
      {
        v18 = (_QWORD *)v16;
        v19 = a4->var3;
        v20 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, v19, v14);
        if (v5)
        {
          if (*(_BYTE *)(v18[5] + v20))
          {
            v22 = (const void *)v18[15];
            v23 = v22
                ? __dynamic_cast(v22, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846298, 0): 0;
            v38 = *(_OWORD *)&a4->var2;
            v55[0] = *(_OWORD *)&a4->var0;
            v55[1] = v38;
            v39 = objc_msgSend_lengthForList_(self, v21, (uint64_t)v55);
            v41 = *(_QWORD *)(v18[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v40, v19, v14));
            v43 = objc_msgSend_valueSizeForField_(self, v42, a4->var1);
            if (v39 >= 1)
            {
              v46 = v43;
              v47 = 8 * v41;
              do
              {
                if (v46 == 8)
                {
                  *v5 = *(_QWORD *)(v23[12] + v47);
                }
                else
                {
                  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v44, v45);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 578, CFSTR("Array integer size %lu not supported"), v46);

                }
                ++v5;
                v47 += 8;
                --v39;
              }
              while (v39);
            }
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v37, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 540, CFSTR("Invalid list type"));

  }
}

- (void)structColumnForStruct:(unint64_t)a3
{
  void *result;

  result = **(void ***)(objc_msgSend_rootColumnForStruct_(self, a2, a3) + 80);
  if (result)
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
  return result;
}

- (void)structReferenceColumnForReference:(unint64_t)a3
{
  _QWORD *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  unint64_t v13;
  uint64_t v14;
  const void *v15;

  objc_msgSend_schema(self, a2, a3);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = *(_QWORD *)(v5[10] + 56 * a3 + 16);
  else
    v6 = 0;

  v8 = objc_msgSend_structColumnForStruct_(self, v7, v6);
  objc_msgSend_helpers(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_structReferenceIndexForReference_(v11, v12, a3);

  v14 = *(_QWORD *)(v8 + 80);
  if (v13 < (*(_QWORD *)(v8 + 88) - v14) >> 3 && (v15 = *(const void **)(v14 + 8 * v13)) != 0)
    return __dynamic_cast(v15, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846298, 0);
  else
    return 0;
}

- (void)listColumnForReference:(unint64_t)a3
{
  _QWORD *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  unint64_t v13;
  uint64_t v14;
  const void *v15;

  objc_msgSend_schema(self, a2, a3);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = *(_QWORD *)(v5[10] + 56 * a3 + 16);
  else
    v6 = 0;

  v8 = objc_msgSend_structColumnForStruct_(self, v7, v6);
  objc_msgSend_helpers(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_listColumnIndexForReference_(v11, v12, a3);

  v14 = *(_QWORD *)(v8 + 80);
  if (v13 < (*(_QWORD *)(v8 + 88) - v14) >> 3 && (v15 = *(const void **)(v14 + 8 * v13)) != 0)
    return __dynamic_cast(v15, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846280, 0);
  else
    return 0;
}

- (void)valueColumnForField:(unint64_t)a3
{
  _QWORD *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  unint64_t v13;
  uint64_t v14;

  objc_msgSend_schema(self, a2, a3);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = *(_QWORD *)(v5[10] + 56 * a3 + 16);
  else
    v6 = 0;

  v8 = objc_msgSend_structColumnForStruct_(self, v7, v6);
  objc_msgSend_helpers(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_valueColumnIndexForField_(v11, v12, a3);

  v14 = *(_QWORD *)(v8 + 80);
  if (v13 >= (*(_QWORD *)(v8 + 88) - v14) >> 3)
    return 0;
  else
    return *(void **)(v14 + 8 * v13);
}

- (CKDSReadableStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (CKXORCHelpers)helpers
{
  return self->_helpers;
}

- (CKXORCReaderOptions)options
{
  return self->_options;
}

- (unint64_t)loadCount
{
  return self->_loadCount;
}

- (void)setLoadCount:(unint64_t)a3
{
  self->_loadCount = a3;
}

- (void).cxx_destruct
{
  __end_ **begin;
  __end_cap_ **var0;
  __end_ **v5;
  void *v6;
  void *v7;
  Reader *value;

  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  begin = self->_rowsForTopLevelContainerStructs.__begin_;
  if (begin)
  {
    var0 = self->_rowsForTopLevelContainerStructs.var0;
    v5 = self->_rowsForTopLevelContainerStructs.__begin_;
    if (var0 != begin)
    {
      do
      {
        v6 = *--var0;

      }
      while (var0 != begin);
      v5 = self->_rowsForTopLevelContainerStructs.__begin_;
    }
    self->_rowsForTopLevelContainerStructs.var0 = begin;
    operator delete(v5);
  }
  v7 = self->_structToReaderBatchPair.__begin_;
  if (v7)
  {
    sub_1D4BCA588(&self->_structToReaderBatchPair.__begin_, (uint64_t)v7);
    operator delete(self->_structToReaderBatchPair.__begin_);
  }
  value = self->_reader.__ptr_.__value_;
  self->_reader.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Reader *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
