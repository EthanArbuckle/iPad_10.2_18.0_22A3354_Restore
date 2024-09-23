@implementation _ANSTViSegHQUtility

+ (unint64_t)_tensorDataTypeForConfiguration:(id)a3
{
  if (objc_msgSend_useE5(a3, a2, (uint64_t)a3))
    return 104;
  else
    return 102;
}

+ (id)makeProbTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  char *v10;
  uint64_t v11;
  void *v12;
  ANSTTensorDescriptor *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  switch(objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0))
  {
    case 0:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D50;
      goto LABEL_9;
    case 1:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D40;
      goto LABEL_9;
    case 2:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D30;
      goto LABEL_9;
    case 3:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D20;
LABEL_9:
      *((_QWORD *)&v21 + 1) = 1;
      v22 = v9;
      v13 = [ANSTTensorDescriptor alloc];
      v15 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v14, (uint64_t)v5, v21, v22);
      if (objc_msgSend_useE5(v5, v16, v17))
        v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 64, 0);
      else
        v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 1, 0);
      v12 = (void *)v19;
      break;
    default:
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT))
        sub_23590F39C(v5, v10, v11);

      v12 = 0;
      break;
  }

  return v12;
}

+ (id)makeHiddenTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  char *v10;
  uint64_t v11;
  void *v12;
  ANSTTensorDescriptor *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  switch(objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0))
  {
    case 0:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D90;
      goto LABEL_9;
    case 1:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D80;
      goto LABEL_9;
    case 2:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D70;
      goto LABEL_9;
    case 3:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D60;
LABEL_9:
      *((_QWORD *)&v21 + 1) = 64;
      v22 = v9;
      v13 = [ANSTTensorDescriptor alloc];
      v15 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v14, (uint64_t)v5, v21, v22);
      if (objc_msgSend_useE5(v5, v16, v17))
        v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 64, 0);
      else
        v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 1, 0);
      v12 = (void *)v19;
      break;
    default:
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT))
        sub_23590F410(v5, v10, v11);

      v12 = 0;
      break;
  }

  return v12;
}

+ (id)makeKeyTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  ANSTTensorDescriptor *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v9 = objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0);
  if (v9 >= 4)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
      sub_23590F484(v5, v19, v20);

    v18 = 0;
  }
  else
  {
    v10 = qword_235914DD0[v9];
    *(_QWORD *)&v22 = 1;
    *((_QWORD *)&v22 + 1) = v10;
    v11 = [ANSTTensorDescriptor alloc];
    v13 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v12, (uint64_t)v5, v22, xmmword_235914DA0);
    if (objc_msgSend_useE5(v5, v14, v15))
      v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 64, 0);
    else
      v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 1, 0);
    v18 = (void *)v17;
  }

  return v18;
}

+ (id)makeValueTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  ANSTTensorDescriptor *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v9 = objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0);
  if (v9 >= 4)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
      sub_23590F4F8(v5, v19, v20);

    v18 = 0;
  }
  else
  {
    v10 = qword_235914DD0[v9];
    *(_QWORD *)&v23 = 1;
    *((_QWORD *)&v23 + 1) = v10;
    v11 = [ANSTTensorDescriptor alloc];
    v13 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v12, (uint64_t)v5, xmmword_235914DB0, v23);
    if (objc_msgSend_useE5(v5, v14, v15))
      v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 64, 0);
    else
      v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 1, 0);
    v18 = (void *)v17;
  }

  return v18;
}

+ (id)makeMattingTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  char *v10;
  uint64_t v11;
  void *v12;
  ANSTTensorDescriptor *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  switch(objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0))
  {
    case 0:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D50;
      goto LABEL_9;
    case 1:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D40;
      goto LABEL_9;
    case 2:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D30;
      goto LABEL_9;
    case 3:
      *(_QWORD *)&v21 = 1;
      v9 = xmmword_235914D20;
LABEL_9:
      *((_QWORD *)&v21 + 1) = 1;
      v22 = v9;
      v13 = [ANSTTensorDescriptor alloc];
      v15 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v14, (uint64_t)v5, v21, v22);
      if (objc_msgSend_useE5(v5, v16, v17))
        v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 64, 0);
      else
        v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 1, 0);
      v12 = (void *)v19;
      break;
    default:
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT))
        sub_23590F56C(v5, v10, v11);

      v12 = 0;
      break;
  }

  return v12;
}

+ (id)makeInputImagePixelBufferDescriptorForConfiguration:(id)a3 name:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  ANSTPixelBufferDescriptor *v22;
  const char *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  _QWORD v31[4];
  _QWORD v32[4];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v11 = objc_msgSend_resolution(v7, v9, v10);
  if (v11 >= 4)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v25 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT))
      sub_23590F5E0(v7, v25, v26);

    if (!a5)
    {
      v24 = 0;
      goto LABEL_8;
    }
    v28 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0BA0];
    v34[0] = CFSTR("Unexpected resolution");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)v34, &v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v29, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v21);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = qword_235914E10[v11];
    v14 = qword_235914DF0[v11];
    v31[0] = *MEMORY[0x24BDC5708];
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    v31[1] = *MEMORY[0x24BDC5650];
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDC56B8];
    v32[1] = v17;
    v32[2] = &unk_2506EDA20;
    v19 = *MEMORY[0x24BDC5668];
    v31[2] = v18;
    v31[3] = v19;
    v32[3] = MEMORY[0x24BDBD1B8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)v32, v31, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [ANSTPixelBufferDescriptor alloc];
    v24 = (void *)objc_msgSend_initWithName_pixelBufferAttributes_error_(v22, v23, (uint64_t)v8, v21, a5);
  }

LABEL_8:
  return v24;
}

+ (id)makeMaskPixelBufferDescriptorForConfiguration:(id)a3 name:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  ANSTPixelBufferDescriptor *v22;
  const char *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  _QWORD v31[4];
  _QWORD v32[4];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v11 = objc_msgSend_resolution(v7, v9, v10);
  if (v11 >= 4)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v25 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT))
      sub_23590F654(v7, v25, v26);

    if (!a5)
    {
      v24 = 0;
      goto LABEL_8;
    }
    v28 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0BA0];
    v34[0] = CFSTR("Unexpected resolution");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)v34, &v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v29, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v21);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = qword_235914DF0[v11];
    v14 = qword_235914E10[v11];
    v31[0] = *MEMORY[0x24BDC5708];
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    v31[1] = *MEMORY[0x24BDC5650];
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v17;
    v31[2] = *MEMORY[0x24BDC56B8];
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v18, 1278226536);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = *MEMORY[0x24BDC5668];
    v32[2] = v19;
    v32[3] = MEMORY[0x24BDBD1B8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)v32, v31, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [ANSTPixelBufferDescriptor alloc];
    v24 = (void *)objc_msgSend_initWithName_pixelBufferAttributes_error_(v22, v23, (uint64_t)v8, v21, a5);
  }

LABEL_8:
  return v24;
}

@end
