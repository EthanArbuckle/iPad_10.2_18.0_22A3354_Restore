@implementation GDInteraction

- (GDInteraction)initWithStartDate:(id)a3 endDate:(id)a4 bundleId:(id)a5 mechanism:(int64_t)a6 direction:(int64_t)a7 sender:(id)a8 recipients:(id)a9 selfParticipantStatus:(int64_t)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  GDInteraction *v19;
  GDInteraction *v20;
  id v24;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v24 = a8;
  v18 = a9;
  v25.receiver = self;
  v25.super_class = (Class)GDInteraction;
  v19 = -[GDInteraction init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_startDate, a3);
    objc_storeStrong((id *)&v20->_endDate, a4);
    objc_storeStrong((id *)&v20->_bundleId, a5);
    v20->_mechanism = a6;
    v20->_direction = a7;
    objc_storeStrong((id *)&v20->_sender, a8);
    objc_storeStrong((id *)&v20->_recipients, a9);
    v20->_selfParticipantStatus = a10;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_startDate(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startDate(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
    {
      v68 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend_endDate(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endDate(v5, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25))
    {
      v68 = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend_bundleId(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleId(v5, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v29, v34, (uint64_t)v33, v35)
      || (v39 = objc_msgSend_mechanism(self, v36, v37, v38), v39 != objc_msgSend_mechanism(v5, v40, v41, v42))
      || (v46 = objc_msgSend_direction(self, v43, v44, v45), v46 != objc_msgSend_direction(v5, v47, v48, v49)))
    {
      v68 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend_sender(self, v50, v51, v52);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92 || (objc_msgSend_sender(v5, v53, v54, v55), (v88 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_sender(self, v53, v54, v55);
      v56 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_sender(v5, v57, v58, v59);
      v60 = objc_claimAutoreleasedReturnValue();
      v91 = (void *)v56;
      v61 = (void *)v56;
      v62 = (void *)v60;
      if (!objc_msgSend_isEqual_(v61, v63, v60, v64))
      {
        v68 = 0;
        goto LABEL_26;
      }
      v90 = 1;
      objc_msgSend_recipients(self, v65, v66, v67, v62, v88);
    }
    else
    {
      v90 = 0;
      objc_msgSend_recipients(self, v53, v54, v55, v86, 0);
    }
    v70 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_recipients(v5, v71, v72, v73);
    v74 = objc_claimAutoreleasedReturnValue();
    v89 = (void *)v70;
    v75 = (void *)v70;
    v76 = (void *)v74;
    if (objc_msgSend_isEqual_(v75, v77, v74, v78))
    {
      v82 = objc_msgSend_selfParticipantStatus(self, v79, v80, v81);
      v68 = v82 == objc_msgSend_selfParticipantStatus(v5, v83, v84, v85);

      if ((v90 & 1) == 0)
        goto LABEL_27;
    }
    else
    {

      v68 = 0;
      if (!v90)
      {
LABEL_27:
        if (!v92)

        goto LABEL_15;
      }
    }
    v62 = v87;
LABEL_26:

    goto LABEL_27;
  }
  v68 = 0;
LABEL_18:

  return v68;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (int64_t)direction
{
  return self->_direction;
}

- (GDContact)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (int64_t)selfParticipantStatus
{
  return self->_selfParticipantStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
