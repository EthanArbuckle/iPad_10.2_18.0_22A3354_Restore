@implementation BUContainedZipArchive

+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_212E680DC;
  v38 = sub_212E680EC;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_212E680DC;
  v32 = sub_212E680EC;
  v33 = 0;
  v12 = objc_alloc((Class)a1);
  v15 = (void *)objc_msgSend_initWithEntry_zipArchive_options_(v12, v13, (uint64_t)v10, v11, a5);
  if (v15)
  {
    v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    dispatch_get_global_queue(0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_212E680F4;
    v24[3] = &unk_24CEDAD50;
    v26 = &v34;
    v27 = &v28;
    v18 = v16;
    v25 = v18;
    objc_msgSend_readArchiveWithQueue_completion_(v15, v19, (uint64_t)v17, v24);
    dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a6 && !v35[5])
  {
    v20 = (void *)v29[5];
    if (v20)
    {
      *a6 = objc_retainAutorelease(v20);
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v14, 0);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v21;

    }
  }
  v22 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (BUContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  BUContainedZipArchive *v12;
  BUContainedZipArchive *v13;
  id *p_isa;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)BUContainedZipArchive;
    v13 = -[BUZipArchive initWithOptions:](&v16, sel_initWithOptions_, a5);
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_zipArchive, a4);
      objc_storeStrong(p_isa + 6, a3);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BUContainedZipArchive;
  -[BUZipArchive readChannelForEntry:validateCRC:](&v5, sel_readChannelForEntry_validateCRC_, a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BUContainedZipArchive;
  -[BUZipArchive streamReadChannelForEntry:validateCRC:](&v5, sel_streamReadChannelForEntry_validateCRC_, a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)archiveLength
{
  uint64_t v2;

  return objc_msgSend_size(self->_entry, a2, v2);
}

- (id)newArchiveReadChannel
{
  objc_msgSend_readChannelForEntry_validateCRC_(self->_zipArchive, a2, (uint64_t)self->_entry, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return ((uint64_t (*)(BUZipArchive *, char *))MEMORY[0x24BEDD108])(self->_zipArchive, sel_isValid);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_zipArchive, 0);
}

@end
