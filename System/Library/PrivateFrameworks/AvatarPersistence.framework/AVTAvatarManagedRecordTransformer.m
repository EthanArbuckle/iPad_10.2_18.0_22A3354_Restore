@implementation AVTAvatarManagedRecordTransformer

- (id)managedRecordIdentifierForIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  return v5;
}

- (id)identifierForManagedRecordIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "UUIDString");
}

- (void)updateManagedRecord:(id)a3 withRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarManagedRecordTransformer managedRecordIdentifierForIdentifier:](self, "managedRecordIdentifierForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v9);

  objc_msgSend(v6, "avatarData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAvatarData:", v10);

  objc_msgSend(v6, "orderDate");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setOrderDate:", v11);
}

- (id)recordWithManagedRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  AVTAvatarRecord *v13;
  void *v14;
  void *v15;
  AVTAvatarRecord *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarManagedRecordTransformer identifierForManagedRecordIdentifier:](self, "identifierForManagedRecordIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "avatarData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[AVTAvatarRecord canLoadAvatarWithData:](AVTAvatarRecord, "canLoadAvatarWithData:", v11);

      if (v12)
      {
        v13 = [AVTAvatarRecord alloc];
        objc_msgSend(v6, "avatarData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "orderDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[AVTAvatarRecord initWithAvatarData:identifier:orderDate:](v13, "initWithAvatarData:identifier:orderDate:", v14, v10, v15);

LABEL_13:
        goto LABEL_14;
      }
      if (a4)
      {
        +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 702, 0);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else if (a4)
    {
      v23 = *MEMORY[0x24BDD0FD8];
      v24 = CFSTR("Record has a nil identifier");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 701, v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if (a4)
  {
    v25[0] = *MEMORY[0x24BDD0FD8];
    v25[1] = CFSTR("InvalidClass");
    v26[0] = CFSTR("Record identifier is not of type NSUUID");
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 703, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

@end
