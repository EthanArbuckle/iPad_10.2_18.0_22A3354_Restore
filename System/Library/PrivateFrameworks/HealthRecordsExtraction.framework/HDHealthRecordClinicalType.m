@implementation HDHealthRecordClinicalType

- (HDHealthRecordClinicalType)initWithClinicalType:(int64_t)a3
{
  HDHealthRecordClinicalType *v4;
  HDHealthRecordClinicalType *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordClinicalType;
  v4 = -[HDHealthRecordClinicalType init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    objc_msgSend((id)objc_opt_class(), "nameForClinicalType:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (HDHealthRecordClinicalType)initWithClinicalTypeName:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  HDHealthRecordClinicalType *v8;
  HDHealthRecordClinicalType *v9;
  uint64_t v10;
  NSString *name;
  HDHealthRecordClinicalType *v12;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordClinicalType.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("allergy")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("clinicalNote")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("condition")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("coverage")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("immunization")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("medicationDispense")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("medicationOrder")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("medicationStatement")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("observation")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("panel")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("patient")) & 1) != 0)
  {
    v6 = 10;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("procedure")))
    {
      v12 = 0;
      goto LABEL_30;
    }
    v6 = 11;
  }
  v14.receiver = self;
  v14.super_class = (Class)HDHealthRecordClinicalType;
  v8 = -[HDHealthRecordClinicalType init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = v6;
    v10 = objc_msgSend(v5, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

  }
  self = v9;
  v12 = self;
LABEL_30:

  return v12;
}

- (Class)medicalRecordClass
{
  void *v2;
  void *v6;

  switch(self->_type)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
      objc_opt_class();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordClinicalType.m"), 161, CFSTR("Invalid type: %ld"), self->_type);

      break;
  }
  return (Class)v2;
}

+ (id)nameForClinicalType:(int64_t)a3
{
  id result;
  void *v7;

  if ((unint64_t)a3 < 0xC)
    return off_24ECF5900[a3];
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthRecordClinicalType.m"), 219, CFSTR("Invalid type: %ld"), a3);

  return result;
}

+ (void)enumerateClinicalTypesUsingBlock:(id)a3
{
  void (**v3)(id, _QWORD, char *);
  char v4;

  v3 = (void (**)(id, _QWORD, char *))a3;
  v4 = 0;
  v3[2](v3, 0, &v4);
  if (!v4)
  {
    v3[2](v3, 1, &v4);
    if (!v4)
    {
      v3[2](v3, 2, &v4);
      if (!v4)
      {
        v3[2](v3, 3, &v4);
        if (!v4)
        {
          v3[2](v3, 4, &v4);
          if (!v4)
          {
            v3[2](v3, 5, &v4);
            if (!v4)
            {
              v3[2](v3, 6, &v4);
              if (!v4)
              {
                v3[2](v3, 7, &v4);
                if (!v4)
                {
                  v3[2](v3, 8, &v4);
                  if (!v4)
                  {
                    v3[2](v3, 9, &v4);
                    if (!v4)
                    {
                      v3[2](v3, 10, &v4);
                      if (!v4)
                        v3[2](v3, 11, &v4);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
