@implementation CKXORCWriter

- (CKXORCWriter)initWithSchema:(id)a3
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

- (CKXORCWriter)initWithSchema:(id)a3 helpers:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  CKXORCWriter *v14;
  CKXORCWriter *v15;
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
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 667, CFSTR("The ORC writer requires a helper object conforming to CKXORCHelpers"));

  }
  v20.receiver = self;
  v20.super_class = (Class)CKXORCWriter;
  v14 = -[CKXWriterBase initWithSchema:](&v20, sel_initWithSchema_, v9);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_helpers, a4);
    v16 = v13;
    if (!v13)
      v16 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v15->_options, v16);
    if (!v13)

    v15->_rootStructToken = -1;
  }

  return v15;
}

- (void)resetColumnNulls:(void *)a3 inRange:(_NSRange)a4
{
  NSUInteger v4;

  v4 = *((_QWORD *)a3 + 1);
  if (v4 >= a4.location + a4.length)
    v4 = a4.location + a4.length;
  memset((void *)(*((_QWORD *)a3 + 5) + a4.location), *((unsigned __int8 *)a3 + 64) ^ 1, v4 - a4.location);
}

- (BOOL)createWriterWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  _QWORD *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend_storage(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    NSStringFromSelector(sel_setWritableStorage_error_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v6, v8, *MEMORY[0x1E0C99778], CFSTR("Call %@ before writing data"), v7);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D4BC6FDC;
  v13[3] = &unk_1E984B688;
  v13[4] = self;
  v13[5] = a2;
  v9 = v13;
  sub_1D4BC6FDC((uint64_t)v9, v10, v11);

  return 1;
}

- (void)updateNumberOfElementsForCurrentBatch
{
  ColumnVectorBatch *value;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  value = self->_currentBatch.__ptr_.__value_;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D4BC765C;
  v4[3] = &unk_1E984B750;
  v4[4] = &v5;
  objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, a2, (uint64_t)value, 0, 1, v4);
  *((_QWORD *)self->_currentBatch.__ptr_.__value_ + 2) = v6[3];
  _Block_object_dispose(&v5, 8);
}

- (BOOL)commitBatchWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[8];
  uint8_t buf[8];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_writeError(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  v8 = (os_log_t *)MEMORY[0x1E0C952C0];
  if (v4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D4AFF000, v9, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Calling commitBatch while writeError is present", buf, 2u);
    }
  }
  if (self->_uncommittedStructs.__tree_.__pair3_.__value_)
  {
    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D4AFF000, v10, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Committing batch while uncommitted structs are still present", buf, 2u);
    }
  }
  objc_msgSend_updateNumberOfElementsForCurrentBatch(self, v5, v6);
  v12 = *((_QWORD *)self->_currentBatch.__ptr_.__value_ + 2);
  if (v12)
  {
    v13 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1D4BC7B3C;
    v31[3] = &unk_1E984B778;
    v31[4] = self;
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v11, (uint64_t)v31);
    v30[0] = v13;
    v30[1] = 3221225472;
    v30[2] = sub_1D4BC7BCC;
    v30[3] = &unk_1E984B660;
    v30[4] = self;
    v14 = v30;
    sub_1D4BC7BCC((uint64_t)v14, v15, v16);

    objc_msgSend_enumerateAllColumnsWithBlock_(self, v17, (uint64_t)&unk_1E984B0A0);
    sub_1D4BCA5FC((_QWORD *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
    self->_uncommittedStructs.__tree_.__begin_node_ = &self->_uncommittedStructs.__tree_.__pair1_;
    self->_uncommittedStructs.__tree_.__pair3_.__value_ = 0;
    self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_ = 0;
    (*(void (**)(ColumnVectorBatch *))(*(_QWORD *)self->_currentBatch.__ptr_.__value_ + 32))(self->_currentBatch.__ptr_.__value_);
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v18, (uint64_t)&unk_1E984B798);
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = sub_1D4BC7E04;
    v29[3] = &unk_1E984B778;
    v29[4] = self;
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v19, (uint64_t)v29);
    v22 = objc_msgSend_startingRowForCurrentBatch(self, v20, v21);
    objc_msgSend_setStartingRowForCurrentBatch_(self, v23, v22 + v12);
    v26 = objc_msgSend_commitCount(self, v24, v25);
    objc_msgSend_setCommitCount_(self, v27, v26 + 1);
  }
  return 1;
}

- (BOOL)commitBatchIfNeededWithError:(id *)a3
{
  ColumnVectorBatch *value;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  unint64_t v14;
  const char *v15;

  if (self->_uncommittedStructs.__tree_.__pair3_.__value_)
    return 1;
  objc_msgSend_updateNumberOfElementsForCurrentBatch(self, a2, (uint64_t)a3);
  value = self->_currentBatch.__ptr_.__value_;
  v7 = *((_QWORD *)value + 1);
  v6 = *((_QWORD *)value + 2);
  objc_msgSend_options(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_batchCommitMarginPercentage(v10, v11, v12);
  v14 = (unint64_t)(v13 * (double)v7);

  if (v6 + v14 < v7)
    return 1;
  else
    return objc_msgSend_commitBatchWithError_(self, v15, (uint64_t)a3);
}

- (BOOL)growCurrentBatchToIncludeBatchOffset:(unint64_t)a3
{
  ColumnVectorBatch *value;
  unint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  const char *v27;
  void *v29;
  const char *v30;
  _QWORD v31[7];
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  value = self->_currentBatch.__ptr_.__value_;
  v7 = *((_QWORD *)value + 1);
  if (v7 > a3)
  {
    v25 = *((_QWORD *)value + 1);
  }
  else
  {
    objc_msgSend_options(self, a2, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_batchSize(v8, v9, v10);

    objc_msgSend_options(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    if (a3 + 1 <= v11)
    {
      v24 = objc_msgSend_batchSize(v14, v15, v16);
    }
    else
    {
      v18 = objc_msgSend_batchResizeIncrement(v14, v15, v16);
      objc_msgSend_options(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_batchResizeIncrement(v21, v22, v23) * ((a3 + 1) / v18 + 1);

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v33 = v7;
      v34 = 2048;
      v35 = v24;
      _os_log_debug_impl(&dword_1D4AFF000, v26, OS_LOG_TYPE_DEBUG, "Growing ORC write batch to size %llu->%llu", buf, 0x16u);
    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1D4BC8150;
    v31[3] = &unk_1E984B7C0;
    v31[5] = v24;
    v31[6] = a2;
    v31[4] = self;
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v27, (uint64_t)v31);
    v25 = *((_QWORD *)self->_currentBatch.__ptr_.__value_ + 1);
  }
  if (v25 <= a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 876, CFSTR("Incorrect rows loaded: batch offset %llu does not fit in range %d->%llu"), a3, 0, v25);

  }
  return v7 <= a3;
}

- (BOOL)growCurrentBatchToIncludeRow:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v8;
  const char *v9;

  if (objc_msgSend_startingRowForCurrentBatch(self, a2, a3) > a3)
    return 0;
  v8 = a3 - objc_msgSend_startingRowForCurrentBatch(self, v5, v6);
  return objc_msgSend_growCurrentBatchToIncludeBatchOffset_(self, v9, v8);
}

- (unint64_t)offsetInCurrentBatchForRow:(unint64_t)a3
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  if (objc_msgSend_startingRowForCurrentBatch(self, a2, a3) > a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_startingRowForCurrentBatch(self, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v15, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 895, CFSTR("Can't access row (%llu) smaller than the current batch starting row (%llu)"), a3, v14);

  }
  objc_msgSend_growCurrentBatchToIncludeRow_(self, v6, a3);
  return a3 - objc_msgSend_startingRowForCurrentBatch(self, v8, v9);
}

- (void)expandColumn:(void *)a3 includingBatchOffset:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;

  if (a3)
  {
    v4 = *((_QWORD *)a3 + 2);
    if (v4 <= a4 + 1)
      v5 = a4 + 1;
    else
      v5 = *((_QWORD *)a3 + 2);
    *((_QWORD *)a3 + 2) = v5;
    if (*((_BYTE *)a3 + 64))
      *(_BYTE *)(*((_QWORD *)a3 + 5) + a4) = 1;
    v6 = __dynamic_cast(a3, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846280, 0);
    v7 = v4 + 1;
    if (v6)
      v8 = v7 > v5;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = v6[12];
      do
        *(_QWORD *)(v9 + 8 * v7++) = *(_QWORD *)(v9 + 8 * v4);
      while (v7 <= v5);
    }
  }
}

- (void)expandColumn:(void *)a3 includingRow:(unint64_t)a4
{
  uint64_t v6;
  const char *v7;

  v6 = objc_msgSend_offsetInCurrentBatchForRow_(self, a2, a4);
  objc_msgSend_expandColumn_includingBatchOffset_(self, v7, (uint64_t)a3, v6);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)appendRowForStruct:(SEL)a3
{
  void *v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  _QWORD *v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  const char *v40;
  ColumnVectorBatch *value;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  const char *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;

  objc_msgSend_writeError(self, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
    return result;
  }
  v11 = objc_msgSend_structColumnForStruct_(self, v10, a4);
  objc_msgSend_options(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_testRowsInterspersedWithNulls(v14, v15, v16);

  if (v17)
  {
    if (!arc4random_uniform(0xAu))
    {
      v20 = *(_QWORD *)(v11 + 16) + arc4random_uniform(3u) + 1;
      if (*(_QWORD *)(v11 + 8) > (unint64_t)(v20 + 1))
        *(_QWORD *)(v11 + 16) = v20;
    }
  }
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  objc_msgSend_schema(self, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (const char *)objc_msgSend_rootStructToken(self, v22, v23);
  if (sub_1D4BB5E74((_BOOL8)v21, v24, v25))
  {
    objc_msgSend_schema(self, v26, v27);
    v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_rootStructToken(self, v29, v30);
    v32 = sub_1D4BB5B9C(v28, v31);

    if (v32 == 1)
    {
      objc_msgSend_schema(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_rootStructToken(self, v36, v37);
      v39 = sub_1D4BB5D08((uint64_t)v35, 0, v38);

      v70[3] = 0;
      if (v39 == a4)
      {
        value = self->_currentBatch.__ptr_.__value_;
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = sub_1D4BC8768;
        v68[3] = &unk_1E984B750;
        v68[4] = &v69;
        objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v40, (uint64_t)value, 0, 1, v68);
      }
      else
      {
        v47 = *(_QWORD *)(objc_msgSend_structColumnForStruct_(self, v40, v39) + 16);
        v49 = *(_QWORD *)(objc_msgSend_structColumnForStruct_(self, v48, a4) + 16);
        v50 = v47 - 1;
        if (!v47)
          v50 = 0;
        if (v49 <= v50)
          v49 = v50;
        v70[3] = v49;
      }
      v51 = objc_msgSend_startingRowForCurrentBatch(self, v42, v43);
      v46 = v70;
      v45 = v70[3] + v51;
      goto LABEL_19;
    }
  }
  else
  {

  }
  v45 = *(_QWORD *)(v11 + 16) + objc_msgSend_startingRowForCurrentBatch(self, v33, v34);
  v46 = v70;
LABEL_19:
  v46[3] = v45;
  objc_msgSend_growCurrentBatchToIncludeRow_(self, v44, v45);
  if ((unint64_t)(*(_QWORD *)(v11 + 16) + 1) > *(_QWORD *)(v11 + 8))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v52, v53);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v67, (uint64_t)a3, self, CFSTR("CKXORCReaderWriter.mm"), 970, CFSTR("Number of elements in batch exceeds capacity"));

  }
  retstr->var0 = a4;
  retstr->var1 = 0;
  retstr->var2 = v70[3];
  objc_msgSend_expandColumn_includingRow_(self, v52, v11);
  v56 = objc_msgSend_rootColumn(self, v54, v55);
  v58 = objc_msgSend_offsetInCurrentBatchForRow_(self, v57, v70[3]);
  objc_msgSend_schema(self, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_helpers(self, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDefaultValuesForStruct_withRootColumn_atOffset_withSchema_orcHelpers_(CKXORCUtilities, v65, a4, v56, v58, v61, v64);

  _Block_object_dispose(&v69, 8);
  return result;
}

- (void)enumerateAllColumnsWithBlock:(id)a3
{
  objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, a2, (uint64_t)self->_currentBatch.__ptr_.__value_, 1, 0, a3);
}

- (void)rootColumn
{
  void *result;

  result = self->_currentBatch.__ptr_.__value_;
  if (result)
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
  return result;
}

- (BOOL)setWritableStorage:(id)a3 error:(id *)a4
{
  CKDSWritableStorage *v5;
  Writer *value;
  OutputStream *v7;
  ColumnVectorBatch *v8;
  NSError *writeError;
  CKDSWritableStorage *storage;

  v5 = (CKDSWritableStorage *)a3;
  value = self->_writer.__ptr_.__value_;
  self->_writer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Writer *))(*(_QWORD *)value + 8))(value);
  v7 = self->_outputStream.__ptr_.__value_;
  self->_outputStream.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(OutputStream *))(*(_QWORD *)v7 + 8))(v7);
  v8 = self->_currentBatch.__ptr_.__value_;
  self->_currentBatch.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(ColumnVectorBatch *))(*(_QWORD *)v8 + 8))(v8);
  sub_1D4BCA5FC((_QWORD *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
  self->_uncommittedStructs.__tree_.__begin_node_ = &self->_uncommittedStructs.__tree_.__pair1_;
  self->_uncommittedStructs.__tree_.__pair3_.__value_ = 0;
  self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_ = 0;
  self->_rootStructToken = 0;
  self->_startingRowForCurrentBatch = 0;
  self->_commitCount = 0;
  writeError = self->_writeError;
  self->_writeError = 0;

  storage = self->_storage;
  self->_storage = v5;

  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginRootStructWithType:(SEL)a3 error:(unint64_t)a4
{
  char WriterWithError;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  const char *v18;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v20;

  v20 = 0;
  WriterWithError = objc_msgSend_createWriterWithError_(self, a3, (uint64_t)&v20);
  v10 = v20;
  v12 = v10;
  if ((WriterWithError & 1) != 0)
  {
    objc_msgSend_setRootStructToken_(self, v11, a4);
    objc_msgSend_schema(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = sub_1D4BB5E74((_BOOL8)v15, (const char *)a4, v16);

    if (v17)
    {
      retstr->var0 = a4;
      *(_OWORD *)&retstr->var1 = xmmword_1D4BDD650;
    }
    else
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0;
      objc_msgSend_appendRowForStruct_(self, v18, a4);
    }
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v10);
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginReferencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  void *v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v19;
  const char *v20;
  __int128 v21;
  unint64_t v22;
  __int128 v23;
  unint64_t var2;

  if (a5->var1 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a3, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a3, self, CFSTR("CKXORCReaderWriter.mm"), 1027, CFSTR("Invalid struct"));

  }
  objc_msgSend_writeError(self, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
  }
  else
  {
    objc_msgSend_schema(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = sub_1D4BB5A68((uint64_t)v13, (const char *)a4, v14);

    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
    objc_msgSend_appendRowForStruct_(self, v16, v15);
    v23 = *(_OWORD *)&retstr->var0;
    var2 = retstr->var2;
    v21 = *(_OWORD *)&a5->var0;
    v22 = a5->var2;
    objc_msgSend_assignStruct_toReference_inStruct_(self, v17, (uint64_t)&v23, a4, &v21);
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)sub_1D4BCA634((uint64_t *)&self->_uncommittedStructs, &retstr->var0, (uint64_t)retstr);
  }
  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)beginReferencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  void *v9;
  $3CC19D079FD0B010EE84973AA846B91B *result;
  const char *v11;
  uint64_t v12;
  unint64_t var2;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;

  objc_msgSend_writeError(self, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *(_OWORD *)&retstr->var0 = xmmword_1D4BDD770;
    var2 = -1;
    retstr->var2 = -1;
  }
  else
  {
    objc_msgSend_schema(self, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = sub_1D4BB57C8((uint64_t)v14, (const char *)a4, v15);

    if (v16)
    {
      v19 = -1;
    }
    else
    {
      objc_msgSend_schema(self, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = sub_1D4BB5B04((uint64_t)v20, (const char *)a4, v21);

    }
    if (a5->var1 == 1)
    {
      retstr->var0 = v19;
      retstr->var1 = a4;
      retstr->var2 = 1;
      retstr->var3 = a4;
      return result;
    }
    var2 = a5->var2;
    retstr->var0 = v19;
    retstr->var1 = a4;
    retstr->var2 = 0;
  }
  retstr->var3 = var2;
  return result;
}

- (void)_appendData:(void *)a3 withValueSize:(unint64_t)a4 length:(unint64_t)a5 toRow:(unint64_t)a6 toList:(unint64_t)a7
{
  char *v11;
  void *v14;
  const char *v15;
  NSObject *v16;
  _QWORD *v17;
  const char *v18;
  const char *v19;
  const void *v20;
  _QWORD *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t __dst;
  uint8_t buf[16];

  v11 = (char *)a3;
  if (a4 != 8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1064, CFSTR("Array integer size %lu not supported"), a4);

  }
  objc_msgSend_writeError(self, a2, (uint64_t)a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_7;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v16 = *MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D4AFF000, v16, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Calling _appendData while writeError is present", buf, 2u);
    if (!a5)
      return;
  }
  else
  {
LABEL_7:
    if (!a5)
      return;
  }
  v17 = (_QWORD *)objc_msgSend_listColumnForReference_(self, v15, a7);
  objc_msgSend_expandColumn_includingRow_(self, v18, (uint64_t)v17, a6);
  v20 = (const void *)v17[15];
  if (v20)
    v21 = __dynamic_cast(v20, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846298, 0);
  else
    v21 = 0;
  v24 = objc_msgSend_offsetInCurrentBatchForRow_(self, v19, a6) + 1;
  v25 = *(_QWORD *)(v17[12] + 8 * v24);
  if (v25 != v21[2])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1086, CFSTR("Can't append to any list row other than the last one"));

  }
  objc_msgSend_growCurrentBatchToIncludeBatchOffset_(self, v22, a5 + v25 - 1);
  v27 = v25;
  v28 = a5;
  do
  {
    objc_msgSend_expandColumn_includingBatchOffset_(self, v26, (uint64_t)v21, v27++);
    --v28;
  }
  while (v28);
  if (v24 <= v17[2])
  {
    v29 = v17[12];
    do
      *(_QWORD *)(v29 + 8 * v24++) += a5;
    while (v24 <= v17[2]);
  }
  v30 = (_QWORD *)(v21[12] + 8 * v25);
  do
  {
    __dst = 0;
    memcpy(&__dst, v11, a4);
    *v30++ = __dst;
    v11 += a4;
    --a5;
  }
  while (a5);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginAppendedListStructInList:(SEL)a3
{
  void *v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v9;
  const char *v10;
  void *v12;
  const char *v13;
  unint64_t v14;

  if (a4->var0 == -1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a3, (uint64_t)a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a3, self, CFSTR("CKXORCReaderWriter.mm"), 1108, CFSTR("Invalid struct"));

  }
  objc_msgSend_writeError(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
    objc_msgSend_appendRowForStruct_(self, v9, a4->var0);
    if (a4->var2 == 1)
    {
      return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)sub_1D4BCA634((uint64_t *)&self->_uncommittedStructs, &retstr->var0, (uint64_t)retstr);
    }
    else
    {
      v14 = retstr->var2 - a4->var3;
      objc_msgSend__appendData_withValueSize_length_toRow_toList_(self, v10, (uint64_t)&v14, 8, 1);
      return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)sub_1D4BCA634((uint64_t *)&self->_uncommittedStructs, &retstr->var0, (uint64_t)retstr);
    }
  }
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

- (void)setData:(void *)a3 withEncoding:(const char *)a4 forField:(unint64_t)a5 inStruct:(id *)a6
{
  void *v12;
  const char *v13;
  const void *v14;
  const char *v15;
  _QWORD *v16;
  unint64_t var2;
  const char *v18;
  const char *v19;
  size_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  id v33;
  id v34;

  if (a6->var1 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v27, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1148, CFSTR("Invalid struct"));

  }
  objc_msgSend_writeError(self, a2, (uint64_t)a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v14 = (const void *)objc_msgSend_valueColumnForField_(self, v13, a5);
    if (v14)
      v16 = __dynamic_cast(v14, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846298, 0);
    else
      v16 = 0;
    var2 = a6->var2;
    objc_msgSend_expandColumn_includingRow_(self, v15, (uint64_t)v16, var2);
    objc_msgSend_typeForEncoding_(MEMORY[0x1E0C94F60], v18, (uint64_t)a4);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_valueSizeForField_(self, v19, a5);
    if (v20 != objc_msgSend_size(v33, v21, v22))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v23, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_size(v33, v29, v30);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v32, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1161, CFSTR("Invalid size for data (is %lu, expecting %lu)"), v20, v31);

    }
    *(_QWORD *)(v16[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v23, var2)) = 0;
    v26 = objc_msgSend_offsetInCurrentBatchForRow_(self, v25, var2);
    memcpy((void *)(v16[12] + 8 * v26), a3, v20);

  }
}

- (void)setData:(void *)a3 withLength:(unint64_t)a4 forList:(id *)a5
{
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const char *v19;
  const void *v20;
  const char *v21;
  _QWORD *v22;
  const char *v23;
  unint64_t var3;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;

  if (a5->var0 != -1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v35, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1167, CFSTR("Invalid struct"));

  }
  if (a5->var2 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v36, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1168, CFSTR("Invalid list"));

  }
  objc_msgSend_writeError(self, a2, (uint64_t)a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend_schema(self, v11, v12);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v14 = sub_1D4BB57C8((uint64_t)v38, (const char *)a5->var1, v13);

    if ((unint64_t)(v14 - 1) < 2)
    {
      v20 = (const void *)objc_msgSend_valueColumnForField_(self, v15, a5->var1);
      if (v20)
        v22 = __dynamic_cast(v20, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846450, 0);
      else
        v22 = 0;
      var3 = a5->var3;
      objc_msgSend_expandColumn_includingRow_(self, v21, (uint64_t)v22, var3);
      if (*(_QWORD *)(v22[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v25, var3)))
      {
        v28 = objc_msgSend_offsetInCurrentBatchForRow_(self, v26, var3);
        free(*(void **)(v22[12] + 8 * v28));
        *(_QWORD *)(v22[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v29, var3)) = 0;
      }
      if (a3)
      {
        v30 = malloc_type_malloc(a4, 0xFCBB8C78uLL);
        *(_QWORD *)(v22[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v31, var3)) = v30;
        v33 = objc_msgSend_offsetInCurrentBatchForRow_(self, v32, var3);
        memcpy(*(void **)(v22[12] + 8 * v33), a3, a4);
      }
      else
      {
        if (a4)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27);
          v42 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v37, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1199, CFSTR("Attempting to set null data with non-zero length"));

        }
        *(_BYTE *)(v22[5] + objc_msgSend_offsetInCurrentBatchForRow_(self, v26, var3)) = 0;
      }
      *(_QWORD *)(v22[17] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v34, var3)) = a4;
    }
    else if (v14)
    {
      if (v14 == 3)
      {
        v17 = a5->var3;
        v18 = objc_msgSend_valueSizeForField_(self, v15, a5->var1);
        objc_msgSend__appendData_withValueSize_length_toRow_toList_(self, v19, (uint64_t)a3, v18, a4, v17, a5->var1);
      }
    }
    else
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v23, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1178, CFSTR("Invalid list type"));

    }
  }
}

- (void)assignStruct:(id *)a3 toReference:(unint64_t)a4 inStruct:(id *)a5
{
  unint64_t var0;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unint64_t var2;
  const char *v20;
  unint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;

  if (a3->var1 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1219, CFSTR("Invalid struct"));

  }
  if (a5->var1 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1220, CFSTR("Invalid struct"));

  }
  var0 = a3->var0;
  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = sub_1D4BB5A68((uint64_t)v11, (const char *)a4, v12);

  if (var0 != v13)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1221, CFSTR("Invalid struct type"));

  }
  objc_msgSend_writeError(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = objc_msgSend_structReferenceColumnForReference_(self, v17, a4);
    var2 = a5->var2;
    objc_msgSend_expandColumn_includingRow_(self, v20, v18, var2);
    v21 = a3->var2 - var2;
    *(_QWORD *)(*(_QWORD *)(v18 + 96) + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v22, var2)) = v21;
  }
}

- (void)commitStruct:(id *)a3
{
  void *v5;
  const char *v6;
  set<CKXStructInstance, std::less<CKXStructInstance>, std::allocator<CKXStructInstance>> *p_uncommittedStructs;
  uint64_t *left;
  unint64_t var2;
  unint64_t var1;
  CKXORCWriter *p_pair1;
  CKXORCWriter *isa;
  unint64_t var0;
  unint64_t begin_node;
  unint64_t v15;
  void *v16;
  CKXSchema *schema;
  CKXORCWriter **value;
  void *v19;
  CKXORCWriter *v20;
  BOOL v21;
  char v22;
  const char *v23;
  id v24;
  void *v26;
  const char *v27;
  id v28;

  if (a3->var1 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1244, CFSTR("Invalid struct"));

  }
  objc_msgSend_writeError(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return;
  p_uncommittedStructs = &self->_uncommittedStructs;
  left = (uint64_t *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_33;
  var1 = a3->var1;
  var2 = a3->var2;
  p_pair1 = (CKXORCWriter *)&self->_uncommittedStructs.__tree_.__pair1_;
  isa = (CKXORCWriter *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_;
  var0 = a3->var0;
  do
  {
    begin_node = (unint64_t)isa->_uncommittedStructs.__tree_.__begin_node_;
    if (begin_node < var1)
    {
LABEL_7:
      isa = (CKXORCWriter *)((char *)isa + 8);
      goto LABEL_10;
    }
    if (begin_node > var1)
      goto LABEL_9;
    v15 = (unint64_t)isa->_uncommittedStructs.__tree_.__pair1_.__value_.__left_;
    if (v15 < var2)
      goto LABEL_7;
    if (v15 > var2)
    {
LABEL_9:
      p_pair1 = isa;
    }
    else if (isa->_currentBatch.__ptr_.__value_ < (ColumnVectorBatch *)var0)
    {
      isa = (CKXORCWriter *)((char *)isa + 8);
    }
    else
    {
      p_pair1 = isa;
    }
LABEL_10:
    isa = (CKXORCWriter *)isa->super.super.isa;
  }
  while (isa);
  if (&self->_uncommittedStructs.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<CKXStructInstance, void *>>> *)p_pair1)
  {
    v16 = p_pair1->_uncommittedStructs.__tree_.__begin_node_;
    if (var1 >= (unint64_t)v16)
    {
      if (var1 > (unint64_t)v16
        || (v19 = p_pair1->_uncommittedStructs.__tree_.__pair1_.__value_.__left_, var2 >= (unint64_t)v19)
        && (var2 > (unint64_t)v19 || (ColumnVectorBatch *)var0 >= p_pair1->_currentBatch.__ptr_.__value_))
      {
        schema = p_pair1->super._schema;
        if (schema)
        {
          do
          {
            value = (CKXORCWriter **)schema;
            schema = (CKXSchema *)schema->super.isa;
          }
          while (schema);
        }
        else
        {
          v20 = p_pair1;
          do
          {
            value = (CKXORCWriter **)v20->_writer.__ptr_.__value_;
            v21 = *value == v20;
            v20 = (CKXORCWriter *)value;
          }
          while (!v21);
        }
        if (p_uncommittedStructs->__tree_.__begin_node_ == p_pair1)
          p_uncommittedStructs->__tree_.__begin_node_ = value;
        --self->_uncommittedStructs.__tree_.__pair3_.__value_;
        sub_1D4BAD2FC(left, (uint64_t *)p_pair1);
        operator delete(p_pair1);
      }
    }
  }
LABEL_33:
  v28 = 0;
  v22 = objc_msgSend_commitBatchIfNeededWithError_(self, v6, (uint64_t)&v28);
  v24 = v28;
  if ((v22 & 1) == 0)
    objc_msgSend_setWriteError_(self, v23, (uint64_t)v24);

}

- (BOOL)flushWithError:(id *)a3
{
  int WriterWithError;
  id v6;
  void *v7;
  char v8;
  void *v9;
  _BOOL4 v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  int v15;
  id v16;
  _QWORD *v17;
  Writer *value;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;
  NSObject *v23;
  uint64_t v25;
  _QWORD v26[4];
  CKXORCWriter *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_writer.__ptr_.__value_)
    goto LABEL_8;
  v29 = 0;
  WriterWithError = objc_msgSend_createWriterWithError_(self, a2, (uint64_t)&v29);
  v6 = v29;
  v7 = v6;
  if (a3)
    v8 = WriterWithError;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
    *a3 = objc_retainAutorelease(v6);

  if (WriterWithError)
  {
LABEL_8:
    objc_msgSend_writeError(self, a2, (uint64_t)a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    objc_msgSend_writeError(self, v11, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      sub_1D4BCA5FC((_QWORD *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
      self->_uncommittedStructs.__tree_.__begin_node_ = &self->_uncommittedStructs.__tree_.__pair1_;
      self->_uncommittedStructs.__tree_.__pair3_.__value_ = 0;
      self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_ = 0;
      v28 = v13;
      v15 = objc_msgSend_commitBatchWithError_(self, v14, (uint64_t)&v28);
      v16 = v28;

      if (v15)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = sub_1D4BC9E28;
        v26[3] = &unk_1E984B660;
        v27 = self;
        v17 = v26;
        (*(void (**)(Writer *))(*(_QWORD *)self->_writer.__ptr_.__value_ + 32))(self->_writer.__ptr_.__value_);
        value = v27->_writer.__ptr_.__value_;
        v27->_writer.__ptr_.__value_ = 0;
        if (value)
          (*(void (**)(Writer *))(*(_QWORD *)value + 8))(value);

        v13 = v16;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v19 = (id)*MEMORY[0x1E0C952C0];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v25 = objc_msgSend_startingRowForCurrentBatch(self, v20, v21);
          *(_DWORD *)buf = 134217984;
          v31 = v25;
          _os_log_debug_impl(&dword_1D4AFF000, v19, OS_LOG_TYPE_DEBUG, "Flushed ORC writer with rows: %llu", buf, 0xCu);
        }

        v22 = 1;
        goto LABEL_26;
      }
      v13 = v16;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = (uint64_t)v13;
      _os_log_debug_impl(&dword_1D4AFF000, v23, OS_LOG_TYPE_DEBUG, "Error flushing ORC writer: %@", buf, 0xCu);
      if (a3)
        goto LABEL_23;
    }
    else if (a3)
    {
LABEL_23:
      v13 = objc_retainAutorelease(v13);
      v22 = 0;
      *a3 = v13;
LABEL_26:

      return v22;
    }
    v22 = 0;
    goto LABEL_26;
  }
  return 0;
}

- (void)structColumnForStruct:(unint64_t)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *result;

  v5 = objc_msgSend_rootColumn(self, a2, a3);
  objc_msgSend_helpers(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_topLevelIndexForStruct_(v8, v9, a3);

  result = *(void **)(*(_QWORD *)(v5 + 80) + 8 * v10);
  if (result)
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
  return result;
}

- (void)structReferenceColumnForReference:(unint64_t)a3
{
  _QWORD *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  void *result;
  void *v20;
  const char *v21;

  objc_msgSend_schema(self, a2, a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = *(_QWORD *)(v6[10] + 56 * a3 + 16);
  else
    v7 = 0;

  v9 = objc_msgSend_structColumnForStruct_(self, v8, v7);
  objc_msgSend_helpers(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_structReferenceIndexForReference_(v12, v13, a3);

  v17 = *(_QWORD *)(v9 + 80);
  if (v14 >= (*(_QWORD *)(v9 + 88) - v17) >> 3
    || (v18 = *(const void **)(v17 + 8 * v14)) == 0
    || (result = __dynamic_cast(v18, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846298, 0)) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1313, CFSTR("Unexpected null struct reference column in writer"));

    return 0;
  }
  return result;
}

- (void)listColumnForReference:(unint64_t)a3
{
  _QWORD *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  void *result;
  void *v20;
  const char *v21;

  objc_msgSend_schema(self, a2, a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = *(_QWORD *)(v6[10] + 56 * a3 + 16);
  else
    v7 = 0;

  v9 = objc_msgSend_structColumnForStruct_(self, v8, v7);
  objc_msgSend_helpers(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_listColumnIndexForReference_(v12, v13, a3);

  v17 = *(_QWORD *)(v9 + 80);
  if (v14 >= (*(_QWORD *)(v9 + 88) - v17) >> 3
    || (v18 = *(const void **)(v17 + 8 * v14)) == 0
    || (result = __dynamic_cast(v18, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846280, 0)) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1322, CFSTR("Unexpected null struct list column in writer"));

    return 0;
  }
  return result;
}

- (void)valueColumnForField:(unint64_t)a3
{
  _QWORD *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *result;
  void *v19;
  const char *v20;

  objc_msgSend_schema(self, a2, a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = *(_QWORD *)(v6[10] + 56 * a3 + 16);
  else
    v7 = 0;

  v9 = objc_msgSend_structColumnForStruct_(self, v8, v7);
  objc_msgSend_helpers(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_valueColumnIndexForField_(v12, v13, a3);

  v17 = *(_QWORD *)(v9 + 80);
  if (v14 >= (*(_QWORD *)(v9 + 88) - v17) >> 3 || (result = *(void **)(v17 + 8 * v14)) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKXORCReaderWriter.mm"), 1331, CFSTR("Unexpected null value column in writer"));

    return 0;
  }
  return result;
}

- (CKDSWritableStorage)storage
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

- (CKXORCWriterOptions)options
{
  return self->_options;
}

- (unint64_t)rootStructToken
{
  return self->_rootStructToken;
}

- (void)setRootStructToken:(unint64_t)a3
{
  self->_rootStructToken = a3;
}

- (unint64_t)startingRowForCurrentBatch
{
  return self->_startingRowForCurrentBatch;
}

- (void)setStartingRowForCurrentBatch:(unint64_t)a3
{
  self->_startingRowForCurrentBatch = a3;
}

- (unint64_t)commitCount
{
  return self->_commitCount;
}

- (void)setCommitCount:(unint64_t)a3
{
  self->_commitCount = a3;
}

- (NSError)writeError
{
  return self->_writeError;
}

- (void)setWriteError:(id)a3
{
  objc_storeStrong((id *)&self->_writeError, a3);
}

- (void).cxx_destruct
{
  ColumnVectorBatch *value;
  OutputStream *v4;
  Writer *v5;

  objc_storeStrong((id *)&self->_writeError, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  sub_1D4BCA5FC((_QWORD *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
  value = self->_currentBatch.__ptr_.__value_;
  self->_currentBatch.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ColumnVectorBatch *))(*(_QWORD *)value + 8))(value);
  v4 = self->_outputStream.__ptr_.__value_;
  self->_outputStream.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(OutputStream *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->_writer.__ptr_.__value_;
  self->_writer.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Writer *))(*(_QWORD *)v5 + 8))(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  return self;
}

@end
