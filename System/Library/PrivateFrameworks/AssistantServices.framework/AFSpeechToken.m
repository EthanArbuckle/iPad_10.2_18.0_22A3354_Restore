@implementation AFSpeechToken

- (unint64_t)hash
{
  return -[NSString hash](self->_text, "hash");
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSString *v5;
  BOOL v6;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && ((v5 = (NSString *)*((_QWORD *)v4 + 2), v5 == self->_text) || -[NSString isEqualToString:](v5, "isEqualToString:"))&& ((objc_msgSend(*((id *)v4 + 3), "isEqualToString:", self->_phoneSequence) & 1) != 0|| (NSString *)*((_QWORD *)v4 + 3) == self->_phoneSequence)&& *((_QWORD *)v4 + 5) == self->_confidenceScore&& *((double *)v4 + 6) == self->_startTime&& *((double *)v4 + 7) == self->_silenceStartTime&& *((double *)v4 + 8) == self->_endTime&& v4[8] == self->_removeSpaceBefore&& v4[9] == self->_removeSpaceAfter&& ((objc_msgSend(*((id *)v4 + 4), "isEqualToString:", self->_ipaPhoneSequence) & 1) != 0|| (NSString *)*((_QWORD *)v4 + 3) == self->_phoneSequence)&& ((objc_msgSend(*((id *)v4 + 9), "isEqual:", self->_graphCost) & 1) != 0|| (NSNumber *)*((_QWORD *)v4 + 9) == self->_graphCost)&& ((objc_msgSend(*((id *)v4 + 10), "isEqual:", self->_acousticCost) & 1) != 0|| (NSNumber *)*((_QWORD *)v4 + 10) == self->_acousticCost);

  return v6;
}

- (id)description
{
  void *v3;
  double endTime;
  const __CFString *v5;
  const __CFString *v6;
  int64_t confidenceScore;
  NSString *ipaPhoneSequence;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AFSpeechToken;
  -[AFSpeechToken description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_startTime;
  v14 = *(_OWORD *)&self->_text;
  endTime = self->_endTime;
  if (self->_removeSpaceBefore)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (self->_removeSpaceAfter)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  ipaPhoneSequence = self->_ipaPhoneSequence;
  confidenceScore = self->_confidenceScore;
  -[NSNumber stringValue](self->_graphCost, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumber stringValue](self->_acousticCost, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("text: %@, phoneSequence: %@, score: %ld, start: %lf, silenceStart: %lf, end: %lf, remove space before: %@ after: %@, ipaPhoneSequence: %@, graphCost: %@, acousticCost: %@"), v14, confidenceScore, v13, *(_QWORD *)&endTime, v5, v6, ipaPhoneSequence, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneSequence, CFSTR("phoneSequence"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_confidenceScore, CFSTR("confidence"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("silenceStartTime"), self->_silenceStartTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  objc_msgSend(v5, "encodeBool:forKey:", self->_removeSpaceBefore, CFSTR("removeSpaceBefore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_removeSpaceAfter, CFSTR("removeSpaceAfter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipaPhoneSequence, CFSTR("ipaPhoneSequence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_graphCost, CFSTR("graphCost"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acousticCost, CFSTR("acousticCost"));

}

- (AFSpeechToken)initWithCoder:(id)a3
{
  id v4;
  AFSpeechToken *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *phoneSequence;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSString *ipaPhoneSequence;
  uint64_t v15;
  NSNumber *graphCost;
  uint64_t v17;
  NSNumber *acousticCost;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFSpeechToken;
  v5 = -[AFSpeechToken init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneSequence"));
    v8 = objc_claimAutoreleasedReturnValue();
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v8;

    v5->_confidenceScore = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("confidence"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_startTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("silenceStartTime"));
    v5->_silenceStartTime = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTime"));
    v5->_endTime = v12;
    v5->_removeSpaceBefore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("removeSpaceBefore"));
    v5->_removeSpaceAfter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("removeSpaceAfter"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipaPhoneSequence"));
    v13 = objc_claimAutoreleasedReturnValue();
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("graphCost"));
    v15 = objc_claimAutoreleasedReturnValue();
    graphCost = v5->_graphCost;
    v5->_graphCost = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acousticCost"));
    v17 = objc_claimAutoreleasedReturnValue();
    acousticCost = v5->_acousticCost;
    v5->_acousticCost = (NSNumber *)v17;

  }
  return v5;
}

- (id)aceToken
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0D88408]);
  -[AFSpeechToken text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[AFSpeechToken phoneSequence](self, "phoneSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPhoneSequence:", v5);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[AFSpeechToken startTime](self, "startTime");
  objc_msgSend(v6, "numberWithDouble:", v7 * 1000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStartTime:", v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[AFSpeechToken silenceStartTime](self, "silenceStartTime");
  objc_msgSend(v9, "numberWithDouble:", v10 * 1000.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSilenceStartTime:", v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[AFSpeechToken endTime](self, "endTime");
  objc_msgSend(v12, "numberWithDouble:", v13 * 1000.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEndTime:", v14);

  objc_msgSend(v3, "setAddSpaceAfter:", -[AFSpeechToken removeSpaceAfter](self, "removeSpaceAfter") ^ 1);
  objc_msgSend(v3, "setRemoveSpaceAfter:", -[AFSpeechToken removeSpaceAfter](self, "removeSpaceAfter"));
  objc_msgSend(v3, "setRemoveSpaceBefore:", -[AFSpeechToken removeSpaceBefore](self, "removeSpaceBefore"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AFSpeechToken confidenceScore](self, "confidenceScore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfidenceScore:", v15);

  return v3;
}

- (AFSpeechToken)initWithDictionary:(id)a3
{
  id v4;
  AFSpeechToken *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  AFSpeechToken *v27;
  char isKindOfClass;
  char v29;
  void *v30;
  int v31;
  void *v32;
  objc_class *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  char v39;
  char v40;
  void *v41;
  char v42;
  double v43;
  int v44;
  void *v45;
  objc_class *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  char v52;
  char v53;
  void *v54;
  char v55;
  double v56;
  void *v57;
  objc_class *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  char v66;
  void *v67;
  char v68;
  double v69;
  void *v70;
  objc_class *v71;
  void *v72;
  int v73;
  void *v74;
  char v75;
  void *v76;
  objc_class *v77;
  void *v78;
  int v79;
  void *v80;
  char v81;
  void *v82;
  objc_class *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  objc_class *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  objc_class *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  objc_super v106;

  v4 = a3;
  v106.receiver = self;
  v106.super_class = (Class)AFSpeechToken;
  v5 = -[AFSpeechToken init](&v106, sel_init);
  if (!v5)
    goto LABEL_94;
  objc_msgSend(v4, "objectForKey:", CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (!v9 || (NSClassFromString((NSString *)v8), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_14:
    goto LABEL_15;
  }

  objc_storeStrong((id *)&v5->_text, v6);
  objc_msgSend(v4, "objectForKey:", CFSTR("phoneSequence"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  v14 = v12;
  if (!v13
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v13, "isEqual:", v15),
        v15,
        v16))
  {

    goto LABEL_7;
  }
  NSClassFromString((NSString *)v14);
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {

    goto LABEL_14;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqual:", v17))
    v18 = 0;
  else
    v18 = v13;
  objc_storeStrong((id *)&v5->_phoneSequence, v18);

  objc_msgSend(v4, "objectForKey:", CFSTR("confidence"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  v23 = v21;
  v24 = v23;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v22, "isEqual:", v25);

    if ((v26 & 1) != 0)
    {

    }
    else
    {
      NSClassFromString((NSString *)v24);
      v29 = objc_opt_isKindOfClass();

      if ((v29 & 1) == 0)
      {
        v44 = 1;
        goto LABEL_93;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqual:", v30) & 1) != 0)
      v31 = 0;
    else
      v31 = objc_msgSend(v22, "intValue");
    v5->_confidenceScore = v31;

  }
  else
  {

    v5->_confidenceScore = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("startTime"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (objc_class *)objc_opt_class();
  NSStringFromClass(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v32;
  v36 = v34;
  v37 = v36;
  if (!v35)
  {

    v5->_startTime = 0.0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v35, "isEqual:", v38);

  if ((v39 & 1) != 0)
  {

    goto LABEL_29;
  }
  NSClassFromString((NSString *)v37);
  v40 = objc_opt_isKindOfClass();

  if ((v40 & 1) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v35, "isEqual:", v41);
    v43 = 0.0;
    if ((v42 & 1) == 0)
      objc_msgSend(v35, "doubleValue", 0.0);
    v5->_startTime = v43;

    if (v5->_startTime < 0.0)
      goto LABEL_32;
LABEL_33:
    objc_msgSend(v4, "objectForKey:", CFSTR("silenceStartTime"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v45;
    v49 = v47;
    v50 = v49;
    if (v48)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v48, "isEqual:", v51);

      if ((v52 & 1) != 0)
      {

      }
      else
      {
        NSClassFromString((NSString *)v50);
        v53 = objc_opt_isKindOfClass();

        if ((v53 & 1) == 0)
        {
LABEL_41:
          v44 = 1;
LABEL_91:

          goto LABEL_92;
        }
      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v48, "isEqual:", v54);
      v56 = 0.0;
      if ((v55 & 1) == 0)
        objc_msgSend(v48, "doubleValue", 0.0);
      v5->_silenceStartTime = v56;

      if (v5->_silenceStartTime < 0.0)
        goto LABEL_41;
    }
    else
    {

      v5->_silenceStartTime = 0.0;
    }
    v105 = v35;
    objc_msgSend(v4, "objectForKey:", CFSTR("endTime"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v57;
    v61 = v59;
    v62 = v61;
    if (v60)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v60, "isEqual:", v63);

      if ((v64 & 1) != 0)
      {

        v65 = v60;
      }
      else
      {
        NSClassFromString((NSString *)v62);
        v66 = objc_opt_isKindOfClass();

        v65 = v60;
        if ((v66 & 1) == 0)
        {
          v44 = 1;
          v35 = v105;
          goto LABEL_90;
        }
      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v65, "isEqual:", v67);
      v69 = 0.0;
      if ((v68 & 1) == 0)
        objc_msgSend(v65, "doubleValue", 0.0);
      v5->_endTime = v69;

      if (v5->_endTime < 0.0)
      {
        v44 = 1;
        v35 = v105;
LABEL_90:

        goto LABEL_91;
      }
    }
    else
    {

      v5->_endTime = 0.0;
      v65 = 0;
    }
    v104 = v65;
    objc_msgSend(v4, "objectForKey:", CFSTR("removeSpaceBefore"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = validationOfObjectWithClassType(v70, v72);

    if (v73)
    {
      if (v70)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v70, "isEqual:", v74) & 1) != 0)
          v75 = 0;
        else
          v75 = objc_msgSend(v70, "BOOLValue");
        v5->_removeSpaceBefore = v75;

      }
      else
      {
        v5->_removeSpaceBefore = 0;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("removeSpaceAfter"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (objc_class *)objc_opt_class();
      NSStringFromClass(v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = validationOfObjectWithClassType(v76, v78);

      v103 = v76;
      if (v79)
      {
        if (v76)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v76, "isEqual:", v80) & 1) != 0)
            v81 = 0;
          else
            v81 = objc_msgSend(v76, "BOOLValue");
          v5->_removeSpaceAfter = v81;

        }
        else
        {
          v5->_removeSpaceAfter = 0;
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("ipaPhoneSequence"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (objc_class *)objc_opt_class();
        NSStringFromClass(v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = validationOfObjectWithClassType(v82, v84);

        v102 = v82;
        if (v85)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v82, "isEqual:", v86))
            v87 = 0;
          else
            v87 = v82;
          objc_storeStrong((id *)&v5->_ipaPhoneSequence, v87);

          objc_msgSend(v4, "objectForKey:", CFSTR("graphCost"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = (objc_class *)objc_opt_class();
          NSStringFromClass(v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v88;
          LODWORD(v88) = validationOfObjectWithClassType(v88, v90);

          if ((_DWORD)v88)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v101, "isEqual:", v91))
              v92 = 0;
            else
              v92 = v101;
            objc_storeStrong((id *)&v5->_graphCost, v92);

            objc_msgSend(v4, "objectForKey:", CFSTR("acousticCost"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = (objc_class *)objc_opt_class();
            NSStringFromClass(v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = v93;
            LODWORD(v93) = validationOfObjectWithClassType(v93, v95);

            if ((_DWORD)v93)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = v100;
              if (objc_msgSend(v100, "isEqual:", v96))
                v98 = 0;
              else
                v98 = v100;
              objc_storeStrong((id *)&v5->_acousticCost, v98);

              v44 = 0;
            }
            else
            {
              v44 = 1;
              v97 = v100;
            }

          }
          else
          {
            v44 = 1;
          }
          v65 = v104;
          v35 = v105;

        }
        else
        {
          v44 = 1;
          v65 = v104;
          v35 = v105;
        }

      }
      else
      {
        v44 = 1;
        v65 = v104;
        v35 = v105;
      }

    }
    else
    {
      v44 = 1;
      v65 = v104;
      v35 = v105;
    }

    goto LABEL_90;
  }
LABEL_32:
  v44 = 1;
LABEL_92:

LABEL_93:
  if (!v44)
  {
LABEL_94:
    v27 = v5;
    goto LABEL_95;
  }
LABEL_15:
  v27 = 0;
LABEL_95:

  return v27;
}

- (id)dictionaryRepresentation
{
  uint64_t text;
  uint64_t phoneSequence;
  NSString *ipaPhoneSequence;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSNumber *graphCost;
  void *v12;
  NSNumber *acousticCost;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[11];
  _QWORD v25[13];

  v25[11] = *MEMORY[0x1E0C80C00];
  text = (uint64_t)self->_text;
  v23 = text;
  v24[0] = CFSTR("text");
  if (!text)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    text = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)text;
  v25[0] = text;
  v24[1] = CFSTR("phoneSequence");
  phoneSequence = (uint64_t)self->_phoneSequence;
  v22 = phoneSequence;
  if (!phoneSequence)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    phoneSequence = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)phoneSequence;
  v25[1] = phoneSequence;
  v24[2] = CFSTR("ipaPhoneSequence");
  ipaPhoneSequence = self->_ipaPhoneSequence;
  v6 = (uint64_t)ipaPhoneSequence;
  if (!ipaPhoneSequence)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v6;
  v25[2] = v6;
  v24[3] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_confidenceScore);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v21;
  v24[4] = CFSTR("startTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v20;
  v24[5] = CFSTR("silenceStartTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_silenceStartTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v7;
  v24[6] = CFSTR("endTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v8;
  v24[7] = CFSTR("removeSpaceBefore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeSpaceBefore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v9;
  v24[8] = CFSTR("removeSpaceAfter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeSpaceAfter);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v10;
  v24[9] = CFSTR("graphCost");
  graphCost = self->_graphCost;
  v12 = graphCost;
  if (!graphCost)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[9] = v12;
  v24[10] = CFSTR("acousticCost");
  acousticCost = self->_acousticCost;
  v14 = acousticCost;
  if (!acousticCost)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[10] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (acousticCost)
  {
    if (graphCost)
      goto LABEL_13;
  }
  else
  {

    if (graphCost)
      goto LABEL_13;
  }

LABEL_13:
  if (!ipaPhoneSequence)

  if (!v22)
  if (!v23)

  return v15;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void)setIpaPhoneSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(int64_t)a3
{
  self->_confidenceScore = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)silenceStartTime
{
  return self->_silenceStartTime;
}

- (void)setSilenceStartTime:(double)a3
{
  self->_silenceStartTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (BOOL)removeSpaceBefore
{
  return self->_removeSpaceBefore;
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  self->_removeSpaceBefore = a3;
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  self->_removeSpaceAfter = a3;
}

- (NSNumber)graphCost
{
  return self->_graphCost;
}

- (void)setGraphCost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)acousticCost
{
  return self->_acousticCost;
}

- (void)setAcousticCost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticCost, 0);
  objc_storeStrong((id *)&self->_graphCost, 0);
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
