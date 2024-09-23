@implementation CLPlacemark(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  INJSONEncoder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "setLocationIncludesTimestamp:", 0);
  v9 = -[INJSONEncoder initWithConfiguration:]([INJSONEncoder alloc], "initWithConfiguration:", v8);
  objc_msgSend(a1, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoder encodeObject:](v9, "encodeObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, CFSTR("location"));

  objc_msgSend(a1, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoder encodeObject:](v9, "encodeObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v13, CFSTR("name"));

  objc_msgSend(a1, "postalAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v15, CFSTR("postalAddress"));

  return v6;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = &stru_1E2295770;
      if (v15)
        v17 = (__CFString *)v15;
      v18 = v17;

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("postalAddress"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v20 = (void *)MEMORY[0x1E0C9E3F0];
        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v21 = (void *)getCNPostalAddressClass_softClass_101821;
        v30 = getCNPostalAddressClass_softClass_101821;
        if (!getCNPostalAddressClass_softClass_101821)
        {
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __getCNPostalAddressClass_block_invoke_101822;
          v26[3] = &unk_1E22953C0;
          v26[4] = &v27;
          __getCNPostalAddressClass_block_invoke_101822((uint64_t)v26);
          v21 = (void *)v28[3];
        }
        v22 = objc_retainAutorelease(v21);
        _Block_object_dispose(&v27, 8);
        objc_msgSend(v22, "postalAddressWithDictionaryRepresentation:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "placemarkWithLocation:name:postalAddress:", v12, v18, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {

        objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithLocation:name:postalAddress:", v12, v18, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {

    v24 = 0;
  }

  return v24;
}

@end
