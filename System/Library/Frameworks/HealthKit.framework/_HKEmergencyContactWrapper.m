@implementation _HKEmergencyContactWrapper

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_HKEmergencyContactWrapper contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v8)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v4, "contact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "phoneNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[_HKEmergencyContactWrapper contact](self, "contact");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "phoneNumber");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "phoneNumber");
        v18 = v5;
        v13 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v11, "isEqual:", v14);

        v9 = v13;
        v5 = v18;

      }
      else
      {
        v15 = 0;
      }

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HKEmergencyContact phoneNumber](self->_contact, "phoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (_HKEmergencyContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
