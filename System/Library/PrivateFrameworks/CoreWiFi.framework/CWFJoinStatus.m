@implementation CWFJoinStatus

- (CWFJoinStatus)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFJoinStatus *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFJoinStatus;
  v6 = -[CWFJoinStatus init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

- (double)duration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_endedAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_endedAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_endedAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilAssociationEnded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_associationEndedAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_associationEndedAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_associationEndedAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilAuthenticationEnded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_authenticationEndedAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_authenticationEndedAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_authenticationEndedAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv4Assigned
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_IPv4AssignedAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_IPv4AssignedAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_IPv4AssignedAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv6Assigned
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_IPv6AssignedAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_IPv6AssignedAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_IPv6AssignedAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv4Primary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_IPv4PrimaryAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_IPv4PrimaryAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_IPv4PrimaryAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv6Primary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_IPv6PrimaryAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_IPv6PrimaryAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_IPv6PrimaryAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilLinkUp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_linkUpAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_linkUpAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_linkUpAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  unint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  unint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  unint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  const char *v94;
  unint64_t v96;
  unint64_t v97;
  void *v98;
  unint64_t v99;
  void *v100;
  unint64_t v101;
  void *v102;
  void *v103;
  uint64_t EAP8021XClientStatus;
  void *v105;
  uint64_t EAP8021XControlState;
  uint64_t EAP8021XControlMode;
  uint64_t EAP8021XSupplicantState;
  uint64_t v109;
  void *v110;
  void *v111;
  NSString *interfaceName;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;

  objc_msgSend_SSID(self->_scanResult, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkName(self->_scanResult, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend_SSID(self->_knownNetworkProfile, v11, v12, v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_networkName(self->_knownNetworkProfile, v16, v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v20;
  }
  v100 = v6;
  v105 = v15;
  v114 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_UUIDString(self->_UUID, v11, v12, v13, v14);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v117, v21, 5, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  interfaceName = self->_interfaceName;
  v113 = (void *)v24;
  objc_msgSend_redactedForWiFi(v15, v25, v26, v27, v28);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(v6, v29, v30, v31, v32);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v116, v33, v34, v35, v36);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend_code(self->_error, v37, v38, v39, v40);
  EAP8021XSupplicantState = self->_EAP8021XSupplicantState;
  EAP8021XControlMode = self->_EAP8021XControlMode;
  EAP8021XControlState = self->_EAP8021XControlState;
  EAP8021XClientStatus = self->_EAP8021XClientStatus;
  sub_1B0630E50(self->_startedAt);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(self->_associationEndedAt);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationUntilAssociationEnded(self, v41, v42, v43, v44);
  v101 = (unint64_t)(v45 * 1000.0);
  sub_1B0630E50(self->_authenticationEndedAt);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationUntilAuthenticationEnded(self, v47, v48, v49, v50);
  v99 = (unint64_t)(v51 * 1000.0);
  sub_1B0630E50(self->_linkUpAt);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationUntilLinkUp(self, v52, v53, v54, v55);
  v97 = (unint64_t)(v56 * 1000.0);
  sub_1B0630E50(self->_endedAt);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v58, v59, v60, v61);
  v96 = (unint64_t)(v62 * 1000.0);
  sub_1B0630E50(self->_IPv4AssignedAt);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationUntilIPv4Assigned(self, v64, v65, v66, v67);
  v69 = (unint64_t)(v68 * 1000.0);
  sub_1B0630E50(self->_IPv4PrimaryAt);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationUntilIPv4Primary(self, v71, v72, v73, v74);
  v76 = (unint64_t)(v75 * 1000.0);
  sub_1B0630E50(self->_IPv6AssignedAt);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationUntilIPv6Assigned(self, v78, v79, v80, v81);
  v83 = (unint64_t)(v82 * 1000.0);
  sub_1B0630E50(self->_IPv6PrimaryAt);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationUntilIPv6Primary(self, v85, v86, v87, v88);
  v93 = v92 * 1000.0;
  if (self->_autoJoin)
    v94 = "yes";
  else
    v94 = "no";
  objc_msgSend_stringWithFormat_(v114, v89, (uint64_t)CFSTR("uuid=%@, intf=%@, ssid='%@' (%@), error=%ld, eap=[sup=%d mode=%d state=%d client=%d], start=%@, assoc=%@ (%lums), auth=%@ (%lums), linkup=%@ (%lums), end=%@ (%lums), ipv4=%@ (%lums), ipv4Primary=%@ (%lums), ipv6=%@ (%lums), ipv6Primary=%@ (%lums), auto=%s"), v90, v91, v113, interfaceName, v111, v110, v109, EAP8021XSupplicantState, EAP8021XControlMode, EAP8021XControlState, EAP8021XClientStatus, v103, v102, v101, v46, v99,
    v98,
    v97,
    v57,
    v96,
    v63,
    v69,
    v70,
    v76,
    v77,
    v83,
    v84,
    (unint64_t)v93,
    v94);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v115;
}

- (BOOL)isEqualToJoinStatus:(id)a3
{
  id v4;
  NSUUID *UUID;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUUID *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  int v28;
  _BOOL8 v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  NSString *interfaceName;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL4 v53;
  NSDate *startedAt;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL8 v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSDate *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  NSDate *endedAt;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL8 v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSDate *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  _BOOL4 v85;
  _BOOL4 v86;
  NSDate *associationEndedAt;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSDate *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  _BOOL4 v102;
  _BOOL4 v103;
  _BOOL4 v104;
  NSDate *authenticationEndedAt;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _BOOL8 v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSDate *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  _BOOL4 v121;
  _BOOL4 v122;
  _BOOL4 v123;
  _BOOL4 v124;
  _BOOL4 v125;
  NSDate *linkUpAt;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSDate *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  _BOOL4 v140;
  _BOOL4 v141;
  _BOOL4 v142;
  _BOOL4 v143;
  _BOOL4 v144;
  NSDate *IPv4AssignedAt;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSDate *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  _BOOL4 v159;
  _BOOL4 v160;
  _BOOL4 v161;
  _BOOL4 v162;
  _BOOL4 v163;
  _BOOL4 v164;
  _BOOL4 v165;
  NSDate *IPv6AssignedAt;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _BOOL4 v177;
  NSDate *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  _BOOL4 v182;
  _BOOL4 v183;
  _BOOL4 v184;
  _BOOL4 v185;
  _BOOL4 v186;
  NSDate *IPv4PrimaryAt;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  BOOL v193;
  _BOOL4 v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  NSDate *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  _BOOL4 v204;
  _BOOL4 v205;
  _BOOL4 v206;
  NSDate *IPv6PrimaryAt;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  _BOOL4 v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  NSDate *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  _BOOL4 v222;
  CWFScanResult *scanResult;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  CWFScanResult *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  _BOOL4 v237;
  CWFNetworkProfile *knownNetworkProfile;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  CWFNetworkProfile *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  _BOOL4 v251;
  NSError *error;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  NSError *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  unsigned int EAP8021XSupplicantState;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  unsigned int EAP8021XControlMode;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  unsigned int EAP8021XControlState;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  int EAP8021XClientStatus;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  int autoJoin;
  int v286;
  int v287;
  int v288;
  int v289;
  int v290;
  _BOOL4 v291;
  int v292;
  int v293;
  _BOOL4 v294;
  int v295;
  int v296;
  uint64_t v298;
  _BOOL4 v299;
  void *v300;
  void *v301;
  void *v302;
  NSError *v303;
  void *v304;
  void *v305;
  void *v306;
  CWFNetworkProfile *v307;
  void *v308;
  void *v309;
  CWFScanResult *v310;
  void *v311;
  void *v312;
  NSDate *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  NSDate *v319;
  void *v320;
  void *v321;
  NSDate *v322;
  void *v323;
  void *v324;
  NSDate *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  NSDate *v333;
  void *v334;
  void *v335;
  void *v336;
  id v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  uint64_t v342;
  __int128 v343;
  _BYTE v344[36];
  _BYTE v345[12];
  NSUUID *v346;
  _QWORD v347[7];

  v4 = a3;
  UUID = self->_UUID;
  objc_msgSend_UUID(v4, v6, v7, v8, v9);
  v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  v16 = UUID != v10;
  v346 = v10;
  if (UUID != v10)
  {
    v17 = self->_UUID;
    if (!v17)
    {
      *(_QWORD *)v345 = 0;
      LODWORD(v27) = 0;
      v28 = 0;
      memset(v347, 0, 52);
      LODWORD(v29) = 0;
      v30 = 0;
      v343 = 0uLL;
      v342 = 0;
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v345[8] = 0;
      goto LABEL_116;
    }
    objc_msgSend_UUID(v4, v11, v12, v13, v14);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v334 = 0;
      *(_QWORD *)v345 = 0;
      LODWORD(v27) = 0;
      v28 = 0;
      LODWORD(v29) = 0;
      memset(v347, 0, 20);
      v30 = 0;
      v343 = 0uLL;
      v342 = 0;
      memset((char *)&v347[3] + 4, 0, 24);
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      v345[8] = 0;
      *(_QWORD *)((char *)&v347[2] + 4) = 1;
      goto LABEL_116;
    }
    v334 = (void *)v18;
    v23 = self->_UUID;
    objc_msgSend_UUID(v4, v19, v20, v21, v22);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v23, v24, (uint64_t)v332, v25, v26))
    {
      *(_DWORD *)&v345[4] = 0;
      LODWORD(v27) = 0;
      v28 = 0;
      LODWORD(v29) = 0;
      memset(v347, 0, 20);
      v30 = 0;
      v343 = 0uLL;
      v342 = 0;
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      v345[8] = 0;
      HIDWORD(v347[2]) = 1;
      memset(&v347[3], 0, 28);
      v37 = 1;
LABEL_19:
      *(_DWORD *)v345 = v37;
      goto LABEL_116;
    }
  }
  interfaceName = self->_interfaceName;
  objc_msgSend_interfaceName(v4, v11, v12, v13, v14);
  v39 = objc_claimAutoreleasedReturnValue();
  v27 = interfaceName != (NSString *)v39;
  HIDWORD(v347[2]) = v16;
  v335 = (void *)v39;
  if (interfaceName != (NSString *)v39)
  {
    v17 = self->_interfaceName;
    if (!v17)
    {
      LODWORD(v27) = 0;
      LODWORD(v29) = 0;
      memset(v347, 0, 20);
      v37 = v16;
      v28 = 0;
      v30 = 0;
      v343 = 0uLL;
      v342 = 0;
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v15 = 1;
      *(_QWORD *)&v345[4] = 1;
      goto LABEL_19;
    }
    objc_msgSend_interfaceName(v4, v40, v41, v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      v331 = 0;
      LODWORD(v27) = 0;
      v347[1] = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      v86 = v16;
      v28 = 0;
      v30 = 0;
      v343 = 0uLL;
      v342 = 0;
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      v15 = 1;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)v345 = v86;
      LODWORD(v347[2]) = 1;
      goto LABEL_116;
    }
    v331 = (void *)v44;
    v49 = self->_interfaceName;
    objc_msgSend_interfaceName(v4, v45, v46, v47, v48);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v49, v50, (uint64_t)v329, v51, v52))
    {
      v347[1] = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      v53 = v16;
      v28 = 0;
      v30 = 0;
      v343 = 0uLL;
      v342 = 0;
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      v15 = 1;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)v345 = v53;
      LODWORD(v347[2]) = 1;
      LODWORD(v27) = 1;
      goto LABEL_116;
    }
  }
  startedAt = self->_startedAt;
  objc_msgSend_startedAt(v4, v40, v41, v42, v43);
  v333 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v59 = startedAt != v333;
  LODWORD(v347[2]) = v27;
  if (startedAt != v333)
  {
    v17 = self->_startedAt;
    if (!v17)
    {
      v347[1] = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      v30 = 0;
      v15 = v27;
      v343 = 0uLL;
      v342 = 0;
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      goto LABEL_116;
    }
    objc_msgSend_startedAt(v4, v55, v56, v57, v58);
    v60 = objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      v328 = 0;
      *(_QWORD *)((char *)v347 + 4) = 0;
      LODWORD(v29) = 0;
      LODWORD(v347[0]) = 0;
      v30 = 0;
      v15 = v27;
      v343 = 0uLL;
      v342 = 0;
      memset(v344, 0, sizeof(v344));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      HIDWORD(v347[1]) = 1;
      goto LABEL_116;
    }
    v328 = (void *)v60;
    v65 = self->_startedAt;
    objc_msgSend_startedAt(v4, v61, v62, v63, v64);
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v65, v66, (uint64_t)v327, v67, v68))
    {
      *(_QWORD *)((char *)v347 + 4) = 0;
      LODWORD(v29) = 0;
      LODWORD(v347[0]) = 0;
      memset(v344, 0, 32);
      v30 = 0;
      v15 = v27;
      v343 = 0uLL;
      v342 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      HIDWORD(v347[1]) = 1;
      *(_DWORD *)&v344[32] = 1;
      goto LABEL_116;
    }
  }
  endedAt = self->_endedAt;
  objc_msgSend_endedAt(v4, v55, v56, v57, v58);
  v70 = objc_claimAutoreleasedReturnValue();
  v75 = endedAt != (NSDate *)v70;
  HIDWORD(v347[1]) = v59;
  v330 = (void *)v70;
  if (endedAt != (NSDate *)v70)
  {
    v17 = self->_endedAt;
    if (!v17)
    {
      *(_QWORD *)((char *)v347 + 4) = 0;
      LODWORD(v29) = 0;
      LODWORD(v347[0]) = 0;
      v30 = 0;
      v15 = v27;
      v343 = 0uLL;
      v104 = v59;
      v342 = 0;
      memset(v344, 0, 28);
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v104;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[28] = 1;
      goto LABEL_116;
    }
    objc_msgSend_endedAt(v4, v71, v72, v73, v74);
    v76 = objc_claimAutoreleasedReturnValue();
    if (!v76)
    {
      v340 = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      v30 = 0;
      v15 = v27;
      v343 = 0uLL;
      v123 = v59;
      v342 = 0;
      memset(v344, 0, 28);
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v123;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[28] = 1;
      LODWORD(v347[1]) = 1;
      goto LABEL_116;
    }
    v340 = (void *)v76;
    v81 = self->_endedAt;
    objc_msgSend_endedAt(v4, v77, v78, v79, v80);
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v81, v82, (uint64_t)v326, v83, v84))
    {
      v347[0] = 0;
      LODWORD(v29) = 0;
      v30 = 0;
      v15 = v27;
      memset(v344, 0, 24);
      v85 = v59;
      v342 = 0;
      v343 = 0uLL;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v85;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[28] = 1;
      LODWORD(v347[1]) = 1;
      *(_DWORD *)&v344[24] = 1;
      goto LABEL_116;
    }
  }
  associationEndedAt = self->_associationEndedAt;
  objc_msgSend_associationEndedAt(v4, v71, v72, v73, v74);
  v88 = objc_claimAutoreleasedReturnValue();
  v29 = associationEndedAt != (NSDate *)v88;
  LODWORD(v347[1]) = v75;
  v341 = (void *)v88;
  if (associationEndedAt != (NSDate *)v88)
  {
    v17 = self->_associationEndedAt;
    if (!v17)
    {
      v347[0] = 0;
      LODWORD(v29) = 0;
      v15 = v27;
      v343 = 0uLL;
      v124 = v59;
      v125 = v75;
      v30 = 0;
      v342 = 0;
      memset(v344, 0, 20);
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v124;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v125;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      goto LABEL_116;
    }
    objc_msgSend_associationEndedAt(v4, v89, v90, v91, v92);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!v93)
    {
      v338 = 0;
      LODWORD(v29) = 0;
      v347[0] = 0x100000000;
      v15 = v27;
      v343 = 0uLL;
      v141 = v59;
      v142 = v75;
      v30 = 0;
      v342 = 0;
      memset(v344, 0, 20);
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v141;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v142;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      goto LABEL_116;
    }
    v338 = (void *)v93;
    v98 = self->_associationEndedAt;
    objc_msgSend_associationEndedAt(v4, v94, v95, v96, v97);
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v98, v99, (uint64_t)v324, v100, v101))
    {
      v347[0] = 0x100000000;
      v15 = v27;
      v343 = 0uLL;
      v102 = v59;
      v103 = v75;
      v30 = 0;
      v342 = 0;
      memset(v344, 0, 20);
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v102;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v103;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      LODWORD(v29) = 1;
      goto LABEL_116;
    }
  }
  authenticationEndedAt = self->_authenticationEndedAt;
  objc_msgSend_authenticationEndedAt(v4, v89, v90, v91, v92);
  v106 = objc_claimAutoreleasedReturnValue();
  v111 = authenticationEndedAt != (NSDate *)v106;
  HIDWORD(v347[0]) = v29;
  v339 = (void *)v106;
  if (authenticationEndedAt != (NSDate *)v106)
  {
    v17 = self->_authenticationEndedAt;
    if (!v17)
    {
      LODWORD(v347[0]) = 0;
      *(_QWORD *)v344 = 0;
      *(_QWORD *)&v344[8] = 0;
      v15 = v27;
      v343 = 0uLL;
      v143 = v59;
      v144 = v75;
      v30 = 0;
      v342 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v143;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v144;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[16] = 1;
      goto LABEL_116;
    }
    objc_msgSend_authenticationEndedAt(v4, v107, v108, v109, v110);
    v112 = objc_claimAutoreleasedReturnValue();
    if (!v112)
    {
      v323 = 0;
      *(_QWORD *)v344 = 0;
      *(_QWORD *)&v344[8] = 0;
      v15 = v27;
      v343 = 0uLL;
      v161 = v59;
      v162 = v75;
      v30 = 0;
      v342 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v161;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v162;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      LODWORD(v347[0]) = 1;
      goto LABEL_116;
    }
    v323 = (void *)v112;
    v117 = self->_authenticationEndedAt;
    objc_msgSend_authenticationEndedAt(v4, v113, v114, v115, v116);
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v117, v118, (uint64_t)v321, v119, v120))
    {
      *(_QWORD *)&v344[4] = 0;
      v15 = v27;
      v343 = 0uLL;
      v121 = v59;
      v122 = v75;
      v30 = 0;
      v342 = 0;
      *(_DWORD *)v344 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v121;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v122;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      LODWORD(v347[0]) = 1;
      *(_DWORD *)&v344[12] = 1;
      goto LABEL_116;
    }
  }
  linkUpAt = self->_linkUpAt;
  objc_msgSend_linkUpAt(v4, v107, v108, v109, v110);
  v325 = (NSDate *)objc_claimAutoreleasedReturnValue();
  LODWORD(v347[6]) = linkUpAt != v325;
  LODWORD(v347[0]) = v111;
  if (linkUpAt != v325)
  {
    v17 = self->_linkUpAt;
    if (!v17)
    {
      v15 = v27;
      *(_QWORD *)v344 = 0;
      v163 = v59;
      v164 = v75;
      v30 = 0;
      v342 = 0;
      v343 = 0uLL;
      v165 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 28);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v163;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v164;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v165;
      goto LABEL_116;
    }
    objc_msgSend_linkUpAt(v4, v127, v128, v129, v130);
    v131 = objc_claimAutoreleasedReturnValue();
    if (!v131)
    {
      v320 = 0;
      v15 = v27;
      *(_QWORD *)v344 = 0;
      v182 = v59;
      v183 = v75;
      v30 = 0;
      v342 = 0;
      v343 = 0uLL;
      memset(&v347[3], 0, 24);
      v184 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v182;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v183;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v184;
      LODWORD(v347[6]) = 1;
      goto LABEL_116;
    }
    v320 = (void *)v131;
    v136 = self->_linkUpAt;
    objc_msgSend_linkUpAt(v4, v132, v133, v134, v135);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v136, v137, (uint64_t)v318, v138, v139))
    {
      *(_QWORD *)v344 = 0;
      v15 = v59;
      v342 = 0;
      v343 = 0uLL;
      memset(&v347[3], 0, 24);
      v140 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v15;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v140;
      LODWORD(v347[6]) = 1;
      v30 = 1;
      goto LABEL_116;
    }
  }
  IPv4AssignedAt = self->_IPv4AssignedAt;
  objc_msgSend_IPv4AssignedAt(v4, v127, v128, v129, v130);
  v322 = (NSDate *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v347[5]) = IPv4AssignedAt != v322;
  if (IPv4AssignedAt != v322)
  {
    v17 = self->_IPv4AssignedAt;
    if (!v17)
    {
      v343 = 0uLL;
      v185 = v59;
      v15 = v75;
      v342 = 0;
      memset(&v347[3], 0, 24);
      v186 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v185;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v186;
      v30 = v347[6];
      *(_QWORD *)v344 = 0x100000000;
      goto LABEL_116;
    }
    objc_msgSend_IPv4AssignedAt(v4, v146, v147, v148, v149);
    v150 = objc_claimAutoreleasedReturnValue();
    if (!v150)
    {
      v317 = 0;
      v343 = 0uLL;
      v204 = v59;
      v15 = v75;
      v342 = 0;
      v205 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 20);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v204;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v205;
      v30 = v347[6];
      *(_QWORD *)v344 = 0x100000000;
      HIDWORD(v347[5]) = 1;
      goto LABEL_116;
    }
    v317 = (void *)v150;
    v155 = self->_IPv4AssignedAt;
    objc_msgSend_IPv4AssignedAt(v4, v151, v152, v153, v154);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v155, v156, (uint64_t)v315, v157, v158))
    {
      v159 = v59;
      *(_QWORD *)((char *)&v343 + 4) = 0;
      v15 = v75;
      v342 = 0;
      LODWORD(v343) = 0;
      v160 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 20);
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v159;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v160;
      v30 = v347[6];
      *(_QWORD *)v344 = 0x100000000;
      HIDWORD(v347[5]) = 1;
      HIDWORD(v343) = 1;
      goto LABEL_116;
    }
  }
  IPv6AssignedAt = self->_IPv6AssignedAt;
  objc_msgSend_IPv6AssignedAt(v4, v146, v147, v148, v149);
  v319 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v171 = IPv6AssignedAt != v319;
  if (IPv6AssignedAt != v319)
  {
    v17 = self->_IPv6AssignedAt;
    if (!v17)
    {
      v342 = 0;
      *(_QWORD *)&v343 = 0;
      v15 = v29;
      v206 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      memset(&v347[3], 0, 20);
      v35 = 0;
      v36 = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v206;
      *(_QWORD *)v344 = 0x100000000;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      goto LABEL_116;
    }
    objc_msgSend_IPv6AssignedAt(v4, v167, v168, v169, v170);
    v172 = objc_claimAutoreleasedReturnValue();
    if (!v172)
    {
      v314 = 0;
      v342 = 0;
      *(_QWORD *)&v343 = 0;
      v347[4] = 0;
      v15 = v29;
      v347[3] = 0;
      v222 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v222;
      *(_QWORD *)v344 = 0x100000000;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v347[5]) = 1;
      goto LABEL_116;
    }
    v314 = (void *)v172;
    v177 = IPv6AssignedAt != v319;
    v178 = self->_IPv6AssignedAt;
    objc_msgSend_IPv6AssignedAt(v4, v173, v174, v175, v176);
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v178, v179, (uint64_t)v312, v180, v181))
    {
      v342 = 0x100000000;
      v347[4] = 0;
      *(_QWORD *)&v343 = 0;
      v347[3] = 0;
      v15 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(_QWORD *)v344 = 0x100000000;
      v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v347[5]) = 1;
      goto LABEL_116;
    }
    v171 = v177;
  }
  IPv4PrimaryAt = self->_IPv4PrimaryAt;
  objc_msgSend_IPv4PrimaryAt(v4, v167, v168, v169, v170);
  v188 = objc_claimAutoreleasedReturnValue();
  v193 = IPv4PrimaryAt == (NSDate *)v188;
  v194 = IPv4PrimaryAt != (NSDate *)v188;
  LODWORD(v347[5]) = v171;
  v316 = (void *)v188;
  if (v193)
  {
    HIDWORD(v347[4]) = v194;
  }
  else
  {
    v17 = self->_IPv4PrimaryAt;
    if (!v17)
    {
      v347[4] = 0;
      *(_QWORD *)&v343 = 0;
      v347[3] = 0;
      v15 = v111;
      v31 = 0;
      v32 = 0;
      v35 = 0;
      v36 = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(_QWORD *)v344 = 0x100000000;
      v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      HIDWORD(v342) = v171;
      v33 = 0;
      LODWORD(v342) = 1;
      goto LABEL_116;
    }
    objc_msgSend_IPv4PrimaryAt(v4, v189, v190, v191, v192);
    v195 = objc_claimAutoreleasedReturnValue();
    if (!v195)
    {
      v311 = 0;
      *(_QWORD *)&v343 = 0;
      *(_QWORD *)((char *)&v347[3] + 4) = 0;
      v15 = v111;
      v31 = 0;
      v32 = 0;
      LODWORD(v347[3]) = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(_QWORD *)v344 = 0x100000000;
      v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      v33 = 0;
      HIDWORD(v347[4]) = 1;
      goto LABEL_116;
    }
    v311 = (void *)v195;
    v200 = self->_IPv4PrimaryAt;
    objc_msgSend_IPv4PrimaryAt(v4, v196, v197, v198, v199);
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v200, v201, (uint64_t)v309, v202, v203))
    {
      *(_QWORD *)((char *)&v343 + 4) = 0x100000000;
      *(_QWORD *)((char *)&v347[3] + 4) = 0;
      v15 = v111;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      LODWORD(v347[3]) = 0;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(_QWORD *)v344 = 0x100000000;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v347[5];
      HIDWORD(v347[4]) = 1;
      LODWORD(v343) = 1;
      goto LABEL_116;
    }
    HIDWORD(v347[4]) = v194;
    v171 = v347[5];
  }
  IPv6PrimaryAt = self->_IPv6PrimaryAt;
  objc_msgSend_IPv6PrimaryAt(v4, v189, v190, v191, v192);
  v313 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v193 = IPv6PrimaryAt == v313;
  v212 = IPv6PrimaryAt != v313;
  if (v193)
  {
    HIDWORD(v347[3]) = v212;
  }
  else
  {
    v17 = self->_IPv6PrimaryAt;
    if (!v17)
    {
      *(_QWORD *)((char *)&v347[3] + 4) = 0;
      v237 = v111;
      v31 = 0;
      v32 = 0;
      LODWORD(v347[3]) = 0;
      v35 = 0;
      v36 = 0;
      v15 = 1;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[12] = v237;
      *(_DWORD *)&v344[8] = 1;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      *(_QWORD *)v344 = 0x100000000;
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      v33 = 0;
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      goto LABEL_116;
    }
    objc_msgSend_IPv6PrimaryAt(v4, v208, v209, v210, v211);
    v213 = objc_claimAutoreleasedReturnValue();
    if (!v213)
    {
      v308 = 0;
      v251 = v111;
      *(_QWORD *)v344 = 0x100000000;
      v31 = 0;
      LODWORD(v347[4]) = 0;
      v32 = 0;
      v347[3] = 0x100000000;
      v35 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      v15 = 1;
      *(_QWORD *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[12] = v251;
      *(_DWORD *)&v344[8] = 1;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      v33 = 0;
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      goto LABEL_116;
    }
    v308 = (void *)v213;
    v218 = self->_IPv6PrimaryAt;
    objc_msgSend_IPv6PrimaryAt(v4, v214, v215, v216, v217);
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v218, v219, (uint64_t)v306, v220, v221))
    {
      v31 = 0;
      LODWORD(v347[4]) = 0;
      v32 = 0;
      v33 = 0;
      v347[3] = 0x100000000;
      v15 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      v35 = 0;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      HIDWORD(v342) = v347[5];
      LODWORD(v342) = 1;
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      *(_QWORD *)v344 = 0x100000001;
      goto LABEL_116;
    }
    HIDWORD(v347[3]) = v212;
    v171 = v347[5];
  }
  scanResult = self->_scanResult;
  objc_msgSend_scanResult(v4, v208, v209, v210, v211);
  v310 = (CWFScanResult *)objc_claimAutoreleasedReturnValue();
  LODWORD(v347[4]) = scanResult != v310;
  if (scanResult != v310)
  {
    v17 = self->_scanResult;
    if (!v17)
    {
      LODWORD(v347[4]) = 0;
      v32 = 0;
      LODWORD(v347[3]) = 0;
      v15 = 0;
      v36 = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      v35 = 0;
      *(_DWORD *)&v344[4] = 1;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      v33 = 0;
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      v31 = 1;
      goto LABEL_116;
    }
    objc_msgSend_scanResult(v4, v224, v225, v226, v227);
    v228 = objc_claimAutoreleasedReturnValue();
    if (!v228)
    {
      v305 = 0;
      v32 = 0;
      LODWORD(v347[3]) = 0;
      v15 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      v35 = 0;
      *(_DWORD *)&v344[4] = 1;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      v33 = 0;
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      v31 = 1;
      LODWORD(v347[4]) = 1;
      goto LABEL_116;
    }
    v305 = (void *)v228;
    v233 = self->_scanResult;
    objc_msgSend_scanResult(v4, v229, v230, v231, v232);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v233, v234, (uint64_t)v302, v235, v236))
    {
      v33 = 0;
      LODWORD(v347[3]) = 0;
      v15 = 0;
      v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      v28 = 1;
      v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      v35 = 0;
      *(_DWORD *)&v344[4] = 1;
      v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      HIDWORD(v342) = v347[5];
      LODWORD(v342) = 1;
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      v31 = 1;
      LODWORD(v347[4]) = 1;
      v32 = 1;
      goto LABEL_116;
    }
    v171 = v347[5];
  }
  knownNetworkProfile = self->_knownNetworkProfile;
  objc_msgSend_knownNetworkProfile(v4, v224, v225, v226, v227);
  v307 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
  LODWORD(v347[3]) = knownNetworkProfile != v307;
  if (knownNetworkProfile == v307)
    goto LABEL_95;
  v17 = self->_knownNetworkProfile;
  if (!v17)
  {
    LODWORD(v347[3]) = 0;
    v15 = 0;
    v36 = 0;
    *(_DWORD *)&v345[4] = 1;
    v345[8] = 0;
    *(_DWORD *)&v344[32] = v59;
    *(_DWORD *)v345 = v16;
    v28 = 1;
    v34 = 0;
    *(_DWORD *)&v344[24] = v75;
    *(_DWORD *)&v344[28] = 1;
    *(_DWORD *)&v344[16] = 1;
    *(_DWORD *)&v344[20] = 1;
    *(_DWORD *)&v344[8] = 1;
    *(_DWORD *)&v344[12] = v111;
    v35 = 0;
    *(_DWORD *)&v344[4] = 1;
    v30 = v347[6];
    HIDWORD(v343) = HIDWORD(v347[5]);
    DWORD2(v343) = 1;
    LODWORD(v342) = 1;
    HIDWORD(v342) = v171;
    v32 = v347[4];
    *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
    *(_DWORD *)v344 = HIDWORD(v347[3]);
    v31 = 1;
    v33 = 1;
    goto LABEL_116;
  }
  objc_msgSend_knownNetworkProfile(v4, v239, v240, v241, v242);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v304)
  {
    v304 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    LODWORD(v17) = 0;
    *(_DWORD *)&v345[4] = 1;
    v345[8] = 0;
    v28 = 1;
    *(_DWORD *)&v344[32] = HIDWORD(v347[1]);
    *(_DWORD *)v345 = HIDWORD(v347[2]);
    *(_DWORD *)&v344[24] = v75;
    *(_DWORD *)&v344[28] = 1;
    *(_DWORD *)&v344[16] = 1;
    *(_DWORD *)&v344[20] = 1;
    *(_DWORD *)&v344[8] = 1;
    *(_DWORD *)&v344[12] = v347[0];
    v30 = v347[6];
    DWORD2(v343) = 1;
    HIDWORD(v343) = HIDWORD(v347[5]);
    LODWORD(v342) = 1;
    HIDWORD(v342) = v347[5];
    v32 = v347[4];
    v15 = HIDWORD(v347[4]);
    *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
    *(_DWORD *)v344 = HIDWORD(v347[3]);
    *(_DWORD *)&v344[4] = 1;
    v31 = 1;
    v33 = 1;
    LODWORD(v347[3]) = 1;
    goto LABEL_116;
  }
  v247 = self->_knownNetworkProfile;
  v336 = v4;
  objc_msgSend_knownNetworkProfile(v4, v243, v244, v245, v246);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v247, v248, (uint64_t)v300, v249, v250))
  {
LABEL_95:
    error = self->_error;
    v336 = v4;
    objc_msgSend_error(v4, v239, v240, v241, v242);
    v303 = (NSError *)objc_claimAutoreleasedReturnValue();
    v299 = error != v303;
    if (error == v303)
      goto LABEL_103;
    v17 = self->_error;
    if (v17)
    {
      objc_msgSend_error(v4, v253, v254, v255, v256);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      if (v301)
      {
        v261 = self->_error;
        objc_msgSend_error(v336, v257, v258, v259, v260);
        v298 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v261, v262, v298, v263, v264))
        {
          *(_DWORD *)&v345[4] = 1;
          v345[8] = 0;
          v28 = 1;
          *(_DWORD *)&v344[32] = v59;
          *(_DWORD *)v345 = HIDWORD(v347[2]);
          *(_DWORD *)&v344[24] = v75;
          *(_DWORD *)&v344[28] = 1;
          *(_DWORD *)&v344[16] = 1;
          *(_DWORD *)&v344[20] = 1;
          *(_DWORD *)&v344[8] = 1;
          *(_DWORD *)&v344[12] = v111;
          v30 = v347[6];
          DWORD2(v343) = 1;
          HIDWORD(v343) = HIDWORD(v347[5]);
          LODWORD(v342) = 1;
          HIDWORD(v342) = v347[5];
          v32 = v347[4];
          *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
          v34 = v347[3];
          *(_DWORD *)v344 = HIDWORD(v347[3]);
          *(_DWORD *)&v344[4] = 1;
          v31 = 1;
          v33 = 1;
          v35 = 1;
          v36 = 1;
          LODWORD(v17) = 1;
          goto LABEL_109;
        }
LABEL_103:
        EAP8021XSupplicantState = self->_EAP8021XSupplicantState;
        if (EAP8021XSupplicantState == objc_msgSend_EAP8021XSupplicantState(v336, v253, v254, v255, v256))
        {
          EAP8021XControlMode = self->_EAP8021XControlMode;
          if (EAP8021XControlMode == objc_msgSend_EAP8021XControlMode(v336, v266, v267, v268, v269))
          {
            EAP8021XControlState = self->_EAP8021XControlState;
            if (EAP8021XControlState == objc_msgSend_EAP8021XControlState(v336, v271, v272, v273, v274))
            {
              EAP8021XClientStatus = self->_EAP8021XClientStatus;
              if (EAP8021XClientStatus == objc_msgSend_EAP8021XClientStatus(v336, v276, v277, v278, v279))
              {
                autoJoin = self->_autoJoin;
                v4 = v336;
                *(_DWORD *)&v345[4] = 1;
                v345[8] = autoJoin == objc_msgSend_isAutoJoin(v336, v281, v282, v283, v284);
                v28 = 1;
                *(_DWORD *)&v344[32] = v59;
                *(_DWORD *)v345 = HIDWORD(v347[2]);
                *(_DWORD *)&v344[24] = v75;
                *(_DWORD *)&v344[28] = 1;
                *(_DWORD *)&v344[16] = 1;
                *(_DWORD *)&v344[20] = 1;
                *(_DWORD *)&v344[8] = 1;
                *(_DWORD *)&v344[12] = v111;
                v30 = v347[6];
                DWORD2(v343) = 1;
                HIDWORD(v343) = HIDWORD(v347[5]);
                LODWORD(v342) = 1;
                HIDWORD(v342) = v347[5];
                v32 = v347[4];
                *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
                v34 = v347[3];
                *(_DWORD *)v344 = HIDWORD(v347[3]);
                *(_DWORD *)&v344[4] = 1;
                v31 = 1;
                v33 = 1;
                v35 = 1;
                v36 = v299;
                LODWORD(v17) = v299;
LABEL_110:
                v15 = v298;
                goto LABEL_116;
              }
            }
          }
        }
        *(_DWORD *)&v345[4] = 1;
        v345[8] = 0;
        v28 = 1;
        *(_DWORD *)&v344[32] = v59;
        *(_DWORD *)v345 = HIDWORD(v347[2]);
        *(_DWORD *)&v344[24] = v75;
        *(_DWORD *)&v344[28] = 1;
        *(_DWORD *)&v344[16] = 1;
        *(_DWORD *)&v344[20] = 1;
        *(_DWORD *)&v344[8] = 1;
        *(_DWORD *)&v344[12] = v111;
        v30 = v347[6];
        DWORD2(v343) = 1;
        HIDWORD(v343) = HIDWORD(v347[5]);
        LODWORD(v342) = 1;
        HIDWORD(v342) = v347[5];
        v32 = v347[4];
        *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
        v34 = v347[3];
        *(_DWORD *)v344 = HIDWORD(v347[3]);
        *(_DWORD *)&v344[4] = 1;
        v31 = 1;
        v33 = 1;
        v35 = 1;
        v36 = v299;
        LODWORD(v17) = v299;
LABEL_109:
        v4 = v336;
        goto LABEL_110;
      }
      v301 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      v28 = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = HIDWORD(v347[2]);
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v347[5];
      v32 = v347[4];
      v15 = HIDWORD(v347[4]);
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      v34 = v347[3];
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      *(_DWORD *)&v344[4] = 1;
      v31 = 1;
      v33 = 1;
      v35 = 1;
      v36 = 1;
    }
    else
    {
      v36 = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      v28 = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = HIDWORD(v347[2]);
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v347[5];
      v32 = v347[4];
      v15 = HIDWORD(v347[4]);
      *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
      v34 = v347[3];
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      *(_DWORD *)&v344[4] = 1;
      v31 = 1;
      v33 = 1;
      v35 = 1;
    }
  }
  else
  {
    v35 = 0;
    v36 = 0;
    LODWORD(v17) = 0;
    *(_DWORD *)&v345[4] = 1;
    v345[8] = 0;
    v28 = 1;
    *(_DWORD *)&v344[32] = v59;
    *(_DWORD *)v345 = HIDWORD(v347[2]);
    *(_DWORD *)&v344[24] = v75;
    *(_DWORD *)&v344[28] = 1;
    *(_DWORD *)&v344[16] = 1;
    *(_DWORD *)&v344[20] = 1;
    *(_DWORD *)&v344[8] = 1;
    *(_DWORD *)&v344[12] = v347[0];
    v30 = v347[6];
    DWORD2(v343) = 1;
    HIDWORD(v343) = HIDWORD(v347[5]);
    LODWORD(v342) = 1;
    HIDWORD(v342) = v347[5];
    v32 = v347[4];
    v15 = HIDWORD(v347[4]);
    *(_QWORD *)&v343 = HIDWORD(v347[4]) | 0x100000000;
    *(_DWORD *)v344 = HIDWORD(v347[3]);
    *(_DWORD *)&v344[4] = 1;
    v31 = 1;
    v33 = 1;
    LODWORD(v347[3]) = 1;
    v34 = 1;
  }
  v4 = v336;
LABEL_116:
  if ((_DWORD)v17)
  {
    v337 = v4;
    v286 = v30;
    v287 = v31;
    v288 = v32;
    v289 = v33;
    v290 = v34;
    v291 = v29;
    v292 = v35;
    v293 = v28;
    v294 = v27;
    v295 = v36;

    v296 = v295;
    LODWORD(v27) = v294;
    v28 = v293;
    v35 = v292;
    LODWORD(v29) = v291;
    v34 = v290;
    v33 = v289;
    v32 = v288;
    v31 = v287;
    v30 = v286;
    v4 = v337;
    if (!v296)
      goto LABEL_118;
  }
  else if (!v36)
  {
LABEL_118:
    if (v35)
      goto LABEL_119;
LABEL_123:
    if (!v34)
      goto LABEL_125;
    goto LABEL_124;
  }

  if (!v35)
    goto LABEL_123;
LABEL_119:

  if (v34)
LABEL_124:

LABEL_125:
  if (LODWORD(v347[3]))
  {

    if (!v33)
      goto LABEL_127;
  }
  else if (!v33)
  {
LABEL_127:
    if (!v32)
      goto LABEL_129;
    goto LABEL_128;
  }

  if (v32)
LABEL_128:

LABEL_129:
  if (LODWORD(v347[4]))

  if (v31)
  if (*(_DWORD *)v344)

  if (HIDWORD(v347[3]))
  if (DWORD1(v343))

  if ((_DWORD)v343)
  if (HIDWORD(v347[4]))

  if ((_DWORD)v342)
  if (HIDWORD(v342))

  if (LODWORD(v347[5]))
  if (DWORD2(v343))

  if (HIDWORD(v343))
  if (HIDWORD(v347[5]))

  if (*(_DWORD *)&v344[4])
  if (v30)

  if (LODWORD(v347[6]))
  if (*(_DWORD *)&v344[8])

  if (*(_DWORD *)&v344[12])
  if (LODWORD(v347[0]))

  if (*(_DWORD *)&v344[16])
  if (v29)

  if (HIDWORD(v347[0]))
  if (*(_DWORD *)&v344[20])

  if (*(_DWORD *)&v344[24])
  if (LODWORD(v347[1]))

  if (*(_DWORD *)&v344[28])
  if (*(_DWORD *)&v344[32])
  {

    if (!HIDWORD(v347[1]))
      goto LABEL_183;
  }
  else if (!HIDWORD(v347[1]))
  {
LABEL_183:
    if (v28)
      goto LABEL_184;
    goto LABEL_199;
  }

  if (v28)
  {
LABEL_184:

    if (!v27)
      goto LABEL_185;
    goto LABEL_200;
  }
LABEL_199:
  if (!v27)
  {
LABEL_185:
    if (!LODWORD(v347[2]))
      goto LABEL_187;
    goto LABEL_186;
  }
LABEL_200:

  if (LODWORD(v347[2]))
LABEL_186:

LABEL_187:
  if (*(_DWORD *)&v345[4])

  if (*(_DWORD *)v345)
  if (HIDWORD(v347[2]))

  return v345[8];
}

- (BOOL)isEqual:(id)a3
{
  CWFJoinStatus *v4;
  CWFJoinStatus *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToJoinStatus;

  v4 = (CWFJoinStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToJoinStatus = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToJoinStatus = objc_msgSend_isEqualToJoinStatus_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToJoinStatus = 0;
  }

  return isEqualToJoinStatus;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6;
  v16 = objc_msgSend_hash(self->_startedAt, v12, v13, v14, v15);
  v21 = v11 ^ v16 ^ objc_msgSend_hash(self->_endedAt, v17, v18, v19, v20);
  v26 = objc_msgSend_hash(self->_associationEndedAt, v22, v23, v24, v25);
  v31 = v26 ^ objc_msgSend_hash(self->_authenticationEndedAt, v27, v28, v29, v30);
  v36 = v21 ^ v31 ^ objc_msgSend_hash(self->_linkUpAt, v32, v33, v34, v35);
  v41 = objc_msgSend_hash(self->_IPv4AssignedAt, v37, v38, v39, v40);
  v46 = v41 ^ objc_msgSend_hash(self->_IPv4PrimaryAt, v42, v43, v44, v45);
  v51 = v46 ^ objc_msgSend_hash(self->_IPv6AssignedAt, v47, v48, v49, v50);
  v56 = v36 ^ v51 ^ objc_msgSend_hash(self->_IPv6PrimaryAt, v52, v53, v54, v55);
  v61 = objc_msgSend_hash(self->_scanResult, v57, v58, v59, v60);
  v66 = v61 ^ objc_msgSend_hash(self->_knownNetworkProfile, v62, v63, v64, v65);
  return v56 ^ v66 ^ objc_msgSend_hash(self->_error, v67, v68, v69, v70) ^ self->_EAP8021XSupplicantState ^ self->_EAP8021XControlMode ^ self->_EAP8021XControlState ^ (unint64_t)self->_EAP8021XClientStatus ^ self->_autoJoin;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFJoinStatus, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setStartedAt_(v11, v18, (uint64_t)self->_startedAt, v19, v20);
  objc_msgSend_setEndedAt_(v11, v21, (uint64_t)self->_endedAt, v22, v23);
  objc_msgSend_setAssociationEndedAt_(v11, v24, (uint64_t)self->_associationEndedAt, v25, v26);
  objc_msgSend_setAuthenticationEndedAt_(v11, v27, (uint64_t)self->_authenticationEndedAt, v28, v29);
  objc_msgSend_setLinkUpAt_(v11, v30, (uint64_t)self->_linkUpAt, v31, v32);
  objc_msgSend_setIPv4AssignedAt_(v11, v33, (uint64_t)self->_IPv4AssignedAt, v34, v35);
  objc_msgSend_setIPv4PrimaryAt_(v11, v36, (uint64_t)self->_IPv4PrimaryAt, v37, v38);
  objc_msgSend_setIPv6AssignedAt_(v11, v39, (uint64_t)self->_IPv6AssignedAt, v40, v41);
  objc_msgSend_setIPv6PrimaryAt_(v11, v42, (uint64_t)self->_IPv6PrimaryAt, v43, v44);
  objc_msgSend_setScanResult_(v11, v45, (uint64_t)self->_scanResult, v46, v47);
  objc_msgSend_setKnownNetworkProfile_(v11, v48, (uint64_t)self->_knownNetworkProfile, v49, v50);
  objc_msgSend_setError_(v11, v51, (uint64_t)self->_error, v52, v53);
  objc_msgSend_setEAP8021XSupplicantState_(v11, v54, self->_EAP8021XSupplicantState, v55, v56);
  objc_msgSend_setEAP8021XControlMode_(v11, v57, self->_EAP8021XControlMode, v58, v59);
  objc_msgSend_setEAP8021XControlState_(v11, v60, self->_EAP8021XControlState, v61, v62);
  objc_msgSend_setEAP8021XClientStatus_(v11, v63, self->_EAP8021XClientStatus, v64, v65);
  objc_msgSend_setAutoJoin_(v11, v66, self->_autoJoin, v67, v68);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  id v43;

  UUID = self->_UUID;
  v43 = a3;
  objc_msgSend_encodeObject_forKey_(v43, v5, (uint64_t)UUID, (uint64_t)CFSTR("_UUID"), v6);
  objc_msgSend_encodeObject_forKey_(v43, v7, (uint64_t)self->_interfaceName, (uint64_t)CFSTR("_interfaceName"), v8);
  objc_msgSend_encodeObject_forKey_(v43, v9, (uint64_t)self->_startedAt, (uint64_t)CFSTR("_startedAt"), v10);
  objc_msgSend_encodeObject_forKey_(v43, v11, (uint64_t)self->_endedAt, (uint64_t)CFSTR("_endedAt"), v12);
  objc_msgSend_encodeObject_forKey_(v43, v13, (uint64_t)self->_associationEndedAt, (uint64_t)CFSTR("_associationEndedAt"), v14);
  objc_msgSend_encodeObject_forKey_(v43, v15, (uint64_t)self->_authenticationEndedAt, (uint64_t)CFSTR("_authenticationEndedAt"), v16);
  objc_msgSend_encodeObject_forKey_(v43, v17, (uint64_t)self->_linkUpAt, (uint64_t)CFSTR("_linkUpAt"), v18);
  objc_msgSend_encodeObject_forKey_(v43, v19, (uint64_t)self->_IPv4AssignedAt, (uint64_t)CFSTR("_IPv4AssignedAt"), v20);
  objc_msgSend_encodeObject_forKey_(v43, v21, (uint64_t)self->_IPv6AssignedAt, (uint64_t)CFSTR("_IPv6AssignedAt"), v22);
  objc_msgSend_encodeObject_forKey_(v43, v23, (uint64_t)self->_IPv4PrimaryAt, (uint64_t)CFSTR("_IPv4PrimaryAt"), v24);
  objc_msgSend_encodeObject_forKey_(v43, v25, (uint64_t)self->_IPv6PrimaryAt, (uint64_t)CFSTR("_IPv6PrimaryAt"), v26);
  objc_msgSend_encodeObject_forKey_(v43, v27, (uint64_t)self->_error, (uint64_t)CFSTR("_error"), v28);
  objc_msgSend_encodeObject_forKey_(v43, v29, (uint64_t)self->_scanResult, (uint64_t)CFSTR("_scanResult"), v30);
  objc_msgSend_encodeObject_forKey_(v43, v31, (uint64_t)self->_knownNetworkProfile, (uint64_t)CFSTR("_knownNetworkProfile"), v32);
  objc_msgSend_encodeInteger_forKey_(v43, v33, self->_EAP8021XSupplicantState, (uint64_t)CFSTR("_EAP8021XSupplicantState"), v34);
  objc_msgSend_encodeInteger_forKey_(v43, v35, self->_EAP8021XControlState, (uint64_t)CFSTR("_EAP8021XControlState"), v36);
  objc_msgSend_encodeInteger_forKey_(v43, v37, self->_EAP8021XControlMode, (uint64_t)CFSTR("_EAP8021XControlMode"), v38);
  objc_msgSend_encodeInteger_forKey_(v43, v39, self->_EAP8021XClientStatus, (uint64_t)CFSTR("_EAP8021XClientStatus"), v40);
  objc_msgSend_encodeBool_forKey_(v43, v41, self->_autoJoin, (uint64_t)CFSTR("_autoJoin"), v42);

}

- (CWFJoinStatus)initWithCoder:(id)a3
{
  id v4;
  CWFJoinStatus *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *interfaceName;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSDate *startedAt;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSDate *endedAt;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSDate *associationEndedAt;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSDate *authenticationEndedAt;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSDate *linkUpAt;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSDate *IPv4AssignedAt;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSDate *IPv6AssignedAt;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSDate *IPv4PrimaryAt;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSDate *IPv6PrimaryAt;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  NSError *error;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  CWFScanResult *scanResult;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  CWFNetworkProfile *knownNetworkProfile;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  objc_super v92;

  v4 = a3;
  v92.receiver = self;
  v92.super_class = (Class)CWFJoinStatus;
  v5 = -[CWFJoinStatus init](&v92, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_UUID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_interfaceName"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_startedAt"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("_endedAt"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    endedAt = v5->_endedAt;
    v5->_endedAt = (NSDate *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("_associationEndedAt"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    associationEndedAt = v5->_associationEndedAt;
    v5->_associationEndedAt = (NSDate *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("_authenticationEndedAt"), v33);
    v34 = objc_claimAutoreleasedReturnValue();
    authenticationEndedAt = v5->_authenticationEndedAt;
    v5->_authenticationEndedAt = (NSDate *)v34;

    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)CFSTR("_linkUpAt"), v38);
    v39 = objc_claimAutoreleasedReturnValue();
    linkUpAt = v5->_linkUpAt;
    v5->_linkUpAt = (NSDate *)v39;

    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("_IPv4AssignedAt"), v43);
    v44 = objc_claimAutoreleasedReturnValue();
    IPv4AssignedAt = v5->_IPv4AssignedAt;
    v5->_IPv4AssignedAt = (NSDate *)v44;

    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("_IPv6AssignedAt"), v48);
    v49 = objc_claimAutoreleasedReturnValue();
    IPv6AssignedAt = v5->_IPv6AssignedAt;
    v5->_IPv6AssignedAt = (NSDate *)v49;

    v51 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, (uint64_t)CFSTR("_IPv4PrimaryAt"), v53);
    v54 = objc_claimAutoreleasedReturnValue();
    IPv4PrimaryAt = v5->_IPv4PrimaryAt;
    v5->_IPv4PrimaryAt = (NSDate *)v54;

    v56 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, (uint64_t)CFSTR("_IPv6PrimaryAt"), v58);
    v59 = objc_claimAutoreleasedReturnValue();
    IPv6PrimaryAt = v5->_IPv6PrimaryAt;
    v5->_IPv6PrimaryAt = (NSDate *)v59;

    v61 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, (uint64_t)CFSTR("_error"), v63);
    v64 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v64;

    v66 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, (uint64_t)CFSTR("_scanResult"), v68);
    v69 = objc_claimAutoreleasedReturnValue();
    scanResult = v5->_scanResult;
    v5->_scanResult = (CWFScanResult *)v69;

    v71 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, (uint64_t)CFSTR("_knownNetworkProfile"), v73);
    v74 = objc_claimAutoreleasedReturnValue();
    knownNetworkProfile = v5->_knownNetworkProfile;
    v5->_knownNetworkProfile = (CWFNetworkProfile *)v74;

    v5->_EAP8021XSupplicantState = objc_msgSend_decodeIntegerForKey_(v4, v76, (uint64_t)CFSTR("_EAP8021XSupplicantState"), v77, v78);
    v5->_EAP8021XControlMode = objc_msgSend_decodeIntegerForKey_(v4, v79, (uint64_t)CFSTR("_EAP8021XControlMode"), v80, v81);
    v5->_EAP8021XControlState = objc_msgSend_decodeIntegerForKey_(v4, v82, (uint64_t)CFSTR("_EAP8021XControlState"), v83, v84);
    v5->_EAP8021XClientStatus = objc_msgSend_decodeIntegerForKey_(v4, v85, (uint64_t)CFSTR("_EAP8021XClientStatus"), v86, v87);
    v5->_autoJoin = objc_msgSend_decodeBoolForKey_(v4, v88, (uint64_t)CFSTR("_autoJoin"), v89, v90);
  }

  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CWFNetworkProfile)knownNetworkProfile
{
  return self->_knownNetworkProfile;
}

- (void)setKnownNetworkProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)EAP8021XSupplicantState
{
  return self->_EAP8021XSupplicantState;
}

- (void)setEAP8021XSupplicantState:(unsigned int)a3
{
  self->_EAP8021XSupplicantState = a3;
}

- (unsigned)EAP8021XControlMode
{
  return self->_EAP8021XControlMode;
}

- (void)setEAP8021XControlMode:(unsigned int)a3
{
  self->_EAP8021XControlMode = a3;
}

- (unsigned)EAP8021XControlState
{
  return self->_EAP8021XControlState;
}

- (void)setEAP8021XControlState:(unsigned int)a3
{
  self->_EAP8021XControlState = a3;
}

- (int)EAP8021XClientStatus
{
  return self->_EAP8021XClientStatus;
}

- (void)setEAP8021XClientStatus:(int)a3
{
  self->_EAP8021XClientStatus = a3;
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)associationEndedAt
{
  return self->_associationEndedAt;
}

- (void)setAssociationEndedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)authenticationEndedAt
{
  return self->_authenticationEndedAt;
}

- (void)setAuthenticationEndedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)linkUpAt
{
  return self->_linkUpAt;
}

- (void)setLinkUpAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)IPv4AssignedAt
{
  return self->_IPv4AssignedAt;
}

- (void)setIPv4AssignedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)IPv4PrimaryAt
{
  return self->_IPv4PrimaryAt;
}

- (void)setIPv4PrimaryAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDate)IPv6AssignedAt
{
  return self->_IPv6AssignedAt;
}

- (void)setIPv6AssignedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)IPv6PrimaryAt
{
  return self->_IPv6PrimaryAt;
}

- (void)setIPv6PrimaryAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isAutoJoin
{
  return self->_autoJoin;
}

- (void)setAutoJoin:(BOOL)a3
{
  self->_autoJoin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_IPv6PrimaryAt, 0);
  objc_storeStrong((id *)&self->_IPv6AssignedAt, 0);
  objc_storeStrong((id *)&self->_IPv4PrimaryAt, 0);
  objc_storeStrong((id *)&self->_IPv4AssignedAt, 0);
  objc_storeStrong((id *)&self->_linkUpAt, 0);
  objc_storeStrong((id *)&self->_authenticationEndedAt, 0);
  objc_storeStrong((id *)&self->_associationEndedAt, 0);
  objc_storeStrong((id *)&self->_endedAt, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_knownNetworkProfile, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t isAutoJoin;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  double v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  double v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  double v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  double v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  double v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  unsigned int v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  void *v280;
  _QWORD v282[2];
  _QWORD v283[3];

  v283[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_UUID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("uuid"), v15);

  objc_msgSend_interfaceName(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("interface_name"), v22);

  objc_msgSend_scanResult(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONCompatibleKeyValueMap(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)CFSTR("scan_result"), v34);

  objc_msgSend_error(self, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_code(v39, v40, v41, v42, v43) <= 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, 0, (uint64_t)CFSTR("error"), v47);
  }
  else
  {
    v282[0] = CFSTR("description");
    objc_msgSend_error(self, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedDescription(v48, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v282[1] = CFSTR("code");
    v283[0] = v53;
    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_error(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_code(v59, v60, v61, v62, v63);
    objc_msgSend_numberWithInteger_(v54, v65, v64, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v283[1] = v68;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v69, (uint64_t)v283, (uint64_t)v282, 2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v71, (uint64_t)v70, (uint64_t)CFSTR("error"), v72);

  }
  v73 = (void *)MEMORY[0x1E0CB37E8];
  isAutoJoin = objc_msgSend_isAutoJoin(self, v74, v75, v76, v77);
  objc_msgSend_numberWithBool_(v73, v79, isAutoJoin, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v83, (uint64_t)v82, (uint64_t)CFSTR("is_auto_join"), v84);

  objc_msgSend_startedAt(self, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v90, (uint64_t)v89, (uint64_t)CFSTR("started_at"), v91);

  objc_msgSend_endedAt(self, v92, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v97, (uint64_t)v96, (uint64_t)CFSTR("ended_at"), v98);

  v99 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_duration(self, v100, v101, v102, v103);
  objc_msgSend_numberWithUnsignedInteger_(v99, v105, (unint64_t)(v104 * 1000.0), v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v109, (uint64_t)v108, (uint64_t)CFSTR("duration"), v110);

  objc_msgSend_associationEndedAt(self, v111, v112, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v116, (uint64_t)v115, (uint64_t)CFSTR("associated_ended_at"), v117);

  v118 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationUntilAssociationEnded(self, v119, v120, v121, v122);
  objc_msgSend_numberWithUnsignedInteger_(v118, v124, (unint64_t)(v123 * 1000.0), v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v128, (uint64_t)v127, (uint64_t)CFSTR("duration_until_association_ended"), v129);

  objc_msgSend_authenticationEndedAt(self, v130, v131, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v135, (uint64_t)v134, (uint64_t)CFSTR("authentication_ended_at"), v136);

  v137 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationUntilAuthenticationEnded(self, v138, v139, v140, v141);
  objc_msgSend_numberWithUnsignedInteger_(v137, v143, (unint64_t)(v142 * 1000.0), v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v147, (uint64_t)v146, (uint64_t)CFSTR("duration_until_authentication_ended"), v148);

  objc_msgSend_linkUpAt(self, v149, v150, v151, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v154, (uint64_t)v153, (uint64_t)CFSTR("link_up_at"), v155);

  v156 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationUntilLinkUp(self, v157, v158, v159, v160);
  objc_msgSend_numberWithUnsignedInteger_(v156, v162, (unint64_t)(v161 * 1000.0), v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v166, (uint64_t)v165, (uint64_t)CFSTR("duration_until_link_up"), v167);

  objc_msgSend_IPv4AssignedAt(self, v168, v169, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v173, (uint64_t)v172, (uint64_t)CFSTR("ipv4_assigned_at"), v174);

  v175 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationUntilIPv4Assigned(self, v176, v177, v178, v179);
  objc_msgSend_numberWithUnsignedInteger_(v175, v181, (unint64_t)(v180 * 1000.0), v182, v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v185, (uint64_t)v184, (uint64_t)CFSTR("duration_until_ipv4_assigned"), v186);

  objc_msgSend_IPv4PrimaryAt(self, v187, v188, v189, v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v192, (uint64_t)v191, (uint64_t)CFSTR("ipv4_primary_at"), v193);

  v194 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationUntilIPv4Primary(self, v195, v196, v197, v198);
  objc_msgSend_numberWithUnsignedInteger_(v194, v200, (unint64_t)(v199 * 1000.0), v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v204, (uint64_t)v203, (uint64_t)CFSTR("duration_until_ipv4_primary"), v205);

  objc_msgSend_IPv6AssignedAt(self, v206, v207, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v211, (uint64_t)v210, (uint64_t)CFSTR("ipv4_assigned_at"), v212);

  v213 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationUntilIPv6Assigned(self, v214, v215, v216, v217);
  objc_msgSend_numberWithUnsignedInteger_(v213, v219, (unint64_t)(v218 * 1000.0), v220, v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v223, (uint64_t)v222, (uint64_t)CFSTR("duration_until_ipv6_assigned"), v224);

  objc_msgSend_IPv6PrimaryAt(self, v225, v226, v227, v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v230, (uint64_t)v229, (uint64_t)CFSTR("ipv6_primary_at"), v231);

  v232 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationUntilIPv6Primary(self, v233, v234, v235, v236);
  objc_msgSend_numberWithUnsignedInteger_(v232, v238, (unint64_t)(v237 * 1000.0), v239, v240);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v242, (uint64_t)v241, (uint64_t)CFSTR("duration_until_ipv6_primary"), v243);

  v244 = (void *)MEMORY[0x1E0CB3940];
  v249 = objc_msgSend_EAP8021XSupplicantState(self, v245, v246, v247, v248);
  if (v249 > 8)
    objc_msgSend_stringWithCString_encoding_(v244, v250, (uint64_t)"<unknown>", 4, v251);
  else
    objc_msgSend_stringWithCString_encoding_(v244, v250, (uint64_t)off_1E6135CA8[v249], 4, v251);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v253, (uint64_t)v252, (uint64_t)CFSTR("supplicant_state"), v254);

  objc_msgSend_descriptionForEAPOLControlMode(self, v255, v256, v257, v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v260, (uint64_t)v259, (uint64_t)CFSTR("eapol_control_mode"), v261);

  objc_msgSend_descriptionForEAP8021XControlState(self, v262, v263, v264, v265);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v267, (uint64_t)v266, (uint64_t)CFSTR("eapol_control_state"), v268);

  objc_msgSend_descriptionForEAPOLClientStatus(self, v269, v270, v271, v272);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v274, (uint64_t)v273, (uint64_t)CFSTR("eapol_client_status"), v275);

  sub_1B06475A8(v3, 0, 1u);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  if (v279)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v276, (uint64_t)v279, v277, v278);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v280 = 0;
  }

  return v280;
}

- (id)descriptionForEAPOLClientStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __CFString *v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = objc_msgSend_EAP8021XClientStatus(self, a2, v2, v3, v4);
  v11 = v6;
  if (v6 > 999)
  {
    switch(v6)
    {
      case 1000:
        v12 = CFSTR("Errno Error");
        break;
      case 1001:
        v12 = CFSTR("Security Error");
        break;
      case 1002:
        v12 = CFSTR("Plugin Specific Error");
        break;
      default:
LABEL_28:
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = objc_msgSend_EAP8021XClientStatus(self, v7, v8, v9, v10);
        objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("? (%ld)"), v16, v17, v14);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    v12 = CFSTR("OK");
    switch(v11)
    {
      case 0:
        return v12;
      case 1:
        v12 = CFSTR("Failed");
        break;
      case 2:
        v12 = CFSTR("Allocation Failed");
        break;
      case 3:
        v12 = CFSTR("User Input Required");
        break;
      case 4:
        v12 = CFSTR("Configuration Invalid");
        break;
      case 5:
        v12 = CFSTR("Protocol Not Supported");
        break;
      case 6:
        v12 = CFSTR("Certificate Not Trusted");
        break;
      case 7:
        v12 = CFSTR("Inner Protocol Not Supported");
        break;
      case 8:
        v12 = CFSTR("Internal Error");
        break;
      case 9:
        v12 = CFSTR("User Cancelled Authentication");
        break;
      case 10:
        v12 = CFSTR("Unknown Root Certificate");
        break;
      case 11:
        v12 = CFSTR("No Root Certificate");
        break;
      case 12:
        v12 = CFSTR("Certificate Expired");
        break;
      case 13:
        v12 = CFSTR("Certificate Not Yet Valid");
        break;
      case 14:
        v12 = CFSTR("Certificate Requires Confirmation");
        break;
      case 15:
        v12 = CFSTR("User Input Not Possible");
        break;
      case 16:
        v12 = CFSTR("Resource Unavailable");
        break;
      case 17:
        v12 = CFSTR("Protocol Error");
        break;
      case 18:
        v12 = CFSTR("Authentication Stalled");
        break;
      case 19:
        v12 = CFSTR("Identity Decryption Error");
        break;
      default:
        goto LABEL_28;
    }
  }
  return v12;
}

- (id)descriptionForEAPOLControlMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = objc_msgSend_EAP8021XControlMode(self, a2, v2, v3, v4);
  if (v6 >= 4)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_msgSend_EAP8021XControlMode(self, v7, v8, v9, v10);
    objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("? (%ld)"), v15, v16, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *(&off_1E6135CF0 + (int)v6);
  }
  return v11;
}

- (id)descriptionForEAP8021XControlState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = objc_msgSend_EAP8021XControlState(self, a2, v2, v3, v4);
  if (v6 >= 4)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_msgSend_EAP8021XControlState(self, v7, v8, v9, v10);
    objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("? (%ld)"), v15, v16, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *(&off_1E6135D10 + (int)v6);
  }
  return v11;
}

@end
