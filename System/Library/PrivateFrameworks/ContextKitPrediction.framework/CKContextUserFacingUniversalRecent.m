@implementation CKContextUserFacingUniversalRecent

- (unint64_t)hash
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[CKContextUserFacingUniversalRecent event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(v2, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(v2, "associatedBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(v2, "associatedURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  char v23;
  void *v24;
  void *v25;
  int v26;
  unint64_t v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  unint64_t v33;
  void *v34;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKContextUserFacingUniversalRecent event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "associatedURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v7, "title"), (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v13;
      if (!objc_msgSend(v13, "isEqualToString:", v3))
      {
        v14 = 0;
        goto LABEL_36;
      }
      v33 = (unint64_t)v11;
      v32 = 1;
    }
    else
    {
      v33 = (unint64_t)v11;
      v29 = 0;
      v32 = 0;
    }
    objc_msgSend(v6, "activityType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (objc_msgSend(v7, "activityType"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "activityType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v16;
      if (!objc_msgSend(v16, "isEqualToString:"))
      {
        v14 = 0;
        goto LABEL_33;
      }
      v27 = (unint64_t)v10;
      v17 = 1;
    }
    else
    {
      v27 = (unint64_t)v10;
      v25 = 0;
      v17 = 0;
    }
    *(_QWORD *)&v28 = v9;
    *((_QWORD *)&v28 + 1) = v8;
    objc_msgSend(v6, "associatedBundleId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v17;
    if (v18 || (objc_msgSend(v7, "associatedBundleId"), (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "associatedBundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "associatedBundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v9))
      {
        v14 = 0;
        goto LABEL_29;
      }
      v19 = 1;
    }
    else
    {
      v24 = 0;
      v19 = 0;
    }
    if (v28 == 0 || (v20 = v19, v21 = objc_msgSend(*((id *)&v28 + 1), "isEqualToString:"), v19 = v20, v21))
    {
      if (v27 | v33)
      {
        v23 = v19;
        v14 = objc_msgSend((id)v27, "isEqualToString:");
        if ((v23 & 1) == 0)
        {
LABEL_30:
          v8 = (void *)*((_QWORD *)&v28 + 1);
          v9 = (void *)v28;
          if (v18)
          {

            if (v26)
            {
LABEL_32:
              v10 = (void *)v27;
LABEL_33:

              if (v15)
                goto LABEL_34;
              goto LABEL_42;
            }
          }
          else
          {

            if ((v26 & 1) != 0)
              goto LABEL_32;
          }
          v10 = (void *)v27;
          if (v15)
          {
LABEL_34:

            if (v32)
            {
LABEL_35:
              v11 = (void *)v33;
LABEL_36:

              if (v12)
              {
LABEL_38:

                goto LABEL_39;
              }
LABEL_37:

              goto LABEL_38;
            }
LABEL_43:
            v11 = (void *)v33;
            if (v12)
              goto LABEL_38;
            goto LABEL_37;
          }
LABEL_42:

          if ((v32 & 1) != 0)
            goto LABEL_35;
          goto LABEL_43;
        }
LABEL_29:

        goto LABEL_30;
      }
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    if (!v19)
      goto LABEL_30;
    goto LABEL_29;
  }
  v14 = 0;
LABEL_39:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[CKContextUserFacingUniversalRecent event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEvent:", v5);

  }
  return v4;
}

- (BMUserActivityMetadataEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
