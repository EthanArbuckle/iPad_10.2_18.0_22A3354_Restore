@implementation HKMCStatistics

- (void)encodeWithCoder:(id)a3
{
  int64_t numberOfCycles;
  id v5;

  numberOfCycles = self->_numberOfCycles;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", numberOfCycles, CFSTR("NumberOfCycles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstMenstruationStartDayIndex, CFSTR("FirstMenstruationStartDayIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastMenstruationStartDayIndex, CFSTR("LastMenstruationStartDayIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycleLengthMedian, CFSTR("CycleLengthMedian"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycleLengthLowerPercentile, CFSTR("CycleLengthLowerPercentile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycleLengthUpperPercentile, CFSTR("CycleLengthUpperPercentile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_menstruationLengthMedian, CFSTR("MenstruationLengthMedian"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_menstruationLengthLowerPercentile, CFSTR("MenstruationLengthLowerPercentile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_menstruationLengthUpperPercentile, CFSTR("MenstruationLengthUpperPercentile"));

}

- (HKMCStatistics)initWithCoder:(id)a3
{
  id v4;
  HKMCStatistics *v5;
  uint64_t v6;
  NSNumber *firstMenstruationStartDayIndex;
  uint64_t v8;
  NSNumber *lastMenstruationStartDayIndex;
  uint64_t v10;
  NSNumber *cycleLengthMedian;
  uint64_t v12;
  NSNumber *cycleLengthLowerPercentile;
  uint64_t v14;
  NSNumber *cycleLengthUpperPercentile;
  uint64_t v16;
  NSNumber *menstruationLengthMedian;
  uint64_t v18;
  NSNumber *menstruationLengthLowerPercentile;
  uint64_t v20;
  NSNumber *menstruationLengthUpperPercentile;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKMCStatistics;
  v5 = -[HKMCStatistics init](&v23, sel_init);
  if (v5)
  {
    v5->_numberOfCycles = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfCycles"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstMenstruationStartDayIndex"));
    v6 = objc_claimAutoreleasedReturnValue();
    firstMenstruationStartDayIndex = v5->_firstMenstruationStartDayIndex;
    v5->_firstMenstruationStartDayIndex = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastMenstruationStartDayIndex"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastMenstruationStartDayIndex = v5->_lastMenstruationStartDayIndex;
    v5->_lastMenstruationStartDayIndex = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CycleLengthMedian"));
    v10 = objc_claimAutoreleasedReturnValue();
    cycleLengthMedian = v5->_cycleLengthMedian;
    v5->_cycleLengthMedian = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CycleLengthLowerPercentile"));
    v12 = objc_claimAutoreleasedReturnValue();
    cycleLengthLowerPercentile = v5->_cycleLengthLowerPercentile;
    v5->_cycleLengthLowerPercentile = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CycleLengthUpperPercentile"));
    v14 = objc_claimAutoreleasedReturnValue();
    cycleLengthUpperPercentile = v5->_cycleLengthUpperPercentile;
    v5->_cycleLengthUpperPercentile = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MenstruationLengthMedian"));
    v16 = objc_claimAutoreleasedReturnValue();
    menstruationLengthMedian = v5->_menstruationLengthMedian;
    v5->_menstruationLengthMedian = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MenstruationLengthLowerPercentile"));
    v18 = objc_claimAutoreleasedReturnValue();
    menstruationLengthLowerPercentile = v5->_menstruationLengthLowerPercentile;
    v5->_menstruationLengthLowerPercentile = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MenstruationLengthUpperPercentile"));
    v20 = objc_claimAutoreleasedReturnValue();
    menstruationLengthUpperPercentile = v5->_menstruationLengthUpperPercentile;
    v5->_menstruationLengthUpperPercentile = (NSNumber *)v20;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCStatistics)initWithNumberOfCycles:(int64_t)a3 firstMenstruationStartDayIndex:(id)a4 lastMenstruationStartDayIndex:(id)a5 cycleLengthMedian:(id)a6 cycleLengthLowerPercentile:(id)a7 cycleLengthUpperPercentile:(id)a8 menstruationLengthMedian:(id)a9 menstruationLengthLowerPercentile:(id)a10 menstruationLengthUpperPercentile:(id)a11
{
  id v17;
  HKMCStatistics *v18;
  HKMCStatistics *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)HKMCStatistics;
  v18 = -[HKMCStatistics init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_numberOfCycles = a3;
    objc_storeStrong((id *)&v18->_firstMenstruationStartDayIndex, a4);
    objc_storeStrong((id *)&v19->_lastMenstruationStartDayIndex, a5);
    objc_storeStrong((id *)&v19->_cycleLengthMedian, a6);
    objc_storeStrong((id *)&v19->_cycleLengthLowerPercentile, a7);
    objc_storeStrong((id *)&v19->_cycleLengthUpperPercentile, a8);
    objc_storeStrong((id *)&v19->_menstruationLengthMedian, a9);
    objc_storeStrong((id *)&v19->_menstruationLengthLowerPercentile, a10);
    objc_storeStrong((id *)&v19->_menstruationLengthUpperPercentile, a11);
  }

  return v19;
}

+ (id)_emptyStatistics
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithNumberOfCycles:firstMenstruationStartDayIndex:lastMenstruationStartDayIndex:cycleLengthMedian:cycleLengthLowerPercentile:cycleLengthUpperPercentile:menstruationLengthMedian:menstruationLengthLowerPercentile:menstruationLengthUpperPercentile:", 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfCycles);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ cycles, firstMenstruationStart: %@, lastMenstruationStart: %@, cycleLength: %@ (%@ - %@) menstruationLength: %@ (%@ - %@)>"), v4, self, v5, self->_firstMenstruationStartDayIndex, self->_lastMenstruationStartDayIndex, self->_cycleLengthMedian, self->_cycleLengthLowerPercentile, self->_cycleLengthUpperPercentile, self->_menstruationLengthMedian, self->_menstruationLengthLowerPercentile, self->_menstruationLengthUpperPercentile);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)hk_redactedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfCycles);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ cycles>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKMCStatistics *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  BOOL v88;
  void *v89;
  void *v90;

  v5 = (HKMCStatistics *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[HKMCStatistics numberOfCycles](self, "numberOfCycles");
      if (v6 == -[HKMCStatistics numberOfCycles](v5, "numberOfCycles"))
      {
        -[HKMCStatistics firstMenstruationStartDayIndex](self, "firstMenstruationStartDayIndex");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics firstMenstruationStartDayIndex](v5, "firstMenstruationStartDayIndex");
        v8 = objc_claimAutoreleasedReturnValue();
        v88 = v7 != (void *)v8;
        if (v7 != (void *)v8)
        {
          -[HKMCStatistics firstMenstruationStartDayIndex](v5, "firstMenstruationStartDayIndex");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v90)
          {
            v11 = 0;

            goto LABEL_95;
          }
          -[HKMCStatistics firstMenstruationStartDayIndex](self, "firstMenstruationStartDayIndex");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCStatistics firstMenstruationStartDayIndex](v5, "firstMenstruationStartDayIndex");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            v11 = 0;
LABEL_55:

LABEL_94:
            goto LABEL_95;
          }
          v84 = v10;
          v85 = v9;
        }
        -[HKMCStatistics lastMenstruationStartDayIndex](self, "lastMenstruationStartDayIndex");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics lastMenstruationStartDayIndex](v5, "lastMenstruationStartDayIndex");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v13)
        {
          -[HKMCStatistics lastMenstruationStartDayIndex](v5, "lastMenstruationStartDayIndex");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {

            v11 = 0;
            if (v7 == (void *)v8)
            {
              v88 = 0;
              goto LABEL_93;
            }
            v88 = 1;
LABEL_92:

LABEL_93:
            if (v88)
              goto LABEL_94;
            goto LABEL_95;
          }
          v3 = (void *)v14;
          -[HKMCStatistics lastMenstruationStartDayIndex](self, "lastMenstruationStartDayIndex");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCStatistics lastMenstruationStartDayIndex](v5, "lastMenstruationStartDayIndex");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            v11 = 0;
            goto LABEL_54;
          }
        }
        -[HKMCStatistics cycleLengthMedian](self, "cycleLengthMedian");
        v16 = objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics cycleLengthMedian](v5, "cycleLengthMedian");
        v86 = (void *)v16;
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v16 == (_QWORD)v87;
        v17 = v16 != (_QWORD)v87;
        if (v52)
        {
          v79 = v17;
        }
        else
        {
          -[HKMCStatistics cycleLengthMedian](v5, "cycleLengthMedian");
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
          {

            v11 = 0;
            if (v12 != v13)
            {
              LOBYTE(v24) = 1;
              goto LABEL_89;
            }
            v24 = 0;
LABEL_98:
            if (!v24)
              goto LABEL_91;
LABEL_90:

            goto LABEL_91;
          }
          v79 = v17;
          v76 = (void *)v18;
          -[HKMCStatistics cycleLengthMedian](self, "cycleLengthMedian");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCStatistics cycleLengthMedian](v5, "cycleLengthMedian");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            v11 = 0;
            v20 = v86;
            goto LABEL_53;
          }
        }
        -[HKMCStatistics cycleLengthLowerPercentile](self, "cycleLengthLowerPercentile");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics cycleLengthLowerPercentile](v5, "cycleLengthLowerPercentile");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v21 != v81;
        if (v21 == v81)
        {
          v74 = v3;
        }
        else
        {
          -[HKMCStatistics cycleLengthLowerPercentile](v5, "cycleLengthLowerPercentile");
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {

            v11 = 0;
            v20 = v86;
            if (v86 != v87)
            {
              LOBYTE(v30) = 1;
              goto LABEL_86;
            }
            v30 = 0;
            goto LABEL_100;
          }
          v69 = (void *)v22;
          -[HKMCStatistics cycleLengthLowerPercentile](self, "cycleLengthLowerPercentile");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCStatistics cycleLengthLowerPercentile](v5, "cycleLengthLowerPercentile");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v23;
          if (!objc_msgSend(v23, "isEqual:"))
          {
            v80 = v21;
            v11 = 0;
            v20 = v86;
            goto LABEL_52;
          }
          v74 = v3;
        }
        -[HKMCStatistics cycleLengthUpperPercentile](self, "cycleLengthUpperPercentile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics cycleLengthUpperPercentile](v5, "cycleLengthUpperPercentile");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v25;
        v26 = v25 != v72;
        v80 = v21;
        if (v25 != v72)
        {
          -[HKMCStatistics cycleLengthUpperPercentile](v5, "cycleLengthUpperPercentile");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v27)
          {

            v39 = v21;
            v11 = 0;
            v3 = v74;
            v20 = v86;
            if (v39 != v81)
            {
              LOBYTE(v75) = 1;
              goto LABEL_83;
            }
            v75 = 0;
LABEL_102:
            if (!v75)
            {
LABEL_85:

              v30 = v79;
              if (v20 != v87)
              {
LABEL_86:

                if (!v30)
                  goto LABEL_88;
                goto LABEL_87;
              }
LABEL_100:
              if (v30)
LABEL_87:

LABEL_88:
              v24 = v12 != v13;
              if (v12 != v13)
              {
LABEL_89:

                if (!v24)
                  goto LABEL_91;
                goto LABEL_90;
              }
              goto LABEL_98;
            }
LABEL_84:

            goto LABEL_85;
          }
          v66 = (void *)v27;
          -[HKMCStatistics cycleLengthUpperPercentile](self, "cycleLengthUpperPercentile");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCStatistics cycleLengthUpperPercentile](v5, "cycleLengthUpperPercentile");
          v67 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v28, "isEqual:"))
          {
            v11 = 0;
            v20 = v86;
LABEL_51:

            v3 = v74;
            if (v80 == v81)
              goto LABEL_85;
LABEL_52:

            if (v20 != v87)
            {
LABEL_53:

              if (v12 != v13)
              {
LABEL_54:

                v10 = v84;
                v9 = v85;
                if (v7 != (void *)v8)
                  goto LABEL_55;
LABEL_95:
                v53 = (void *)v8;
LABEL_96:

                goto LABEL_97;
              }
LABEL_91:

              if (v7 == (void *)v8)
                goto LABEL_93;
              goto LABEL_92;
            }
            goto LABEL_88;
          }
          v63 = v29;
        }
        -[HKMCStatistics menstruationLengthMedian](self, "menstruationLengthMedian");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics menstruationLengthMedian](v5, "menstruationLengthMedian");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v68 = v31;
        if (v31 == (void *)v32)
        {
          v64 = (void *)v32;
        }
        else
        {
          -[HKMCStatistics menstruationLengthMedian](v5, "menstruationLengthMedian");
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {

            v11 = 0;
            v20 = v86;
            if (v73 != v72)
              goto LABEL_77;
            goto LABEL_80;
          }
          v62 = (void *)v34;
          -[HKMCStatistics menstruationLengthMedian](self, "menstruationLengthMedian");
          v35 = objc_claimAutoreleasedReturnValue();
          -[HKMCStatistics menstruationLengthMedian](v5, "menstruationLengthMedian");
          v36 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v35;
          v37 = (void *)v35;
          v38 = (void *)v36;
          if (!objc_msgSend(v37, "isEqual:", v36))
          {
            v11 = 0;
            v20 = v86;
LABEL_75:

            if (v73 != v72)
            {
              LOBYTE(v26) = 1;
LABEL_77:

              if (!v26)
                goto LABEL_82;
LABEL_81:

              goto LABEL_82;
            }
            v26 = 0;
LABEL_80:
            if (!v26)
              goto LABEL_82;
            goto LABEL_81;
          }
          v60 = v38;
          v64 = v33;
        }
        -[HKMCStatistics menstruationLengthLowerPercentile](self, "menstruationLengthLowerPercentile");
        v40 = objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics menstruationLengthLowerPercentile](v5, "menstruationLengthLowerPercentile");
        v41 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v40;
        v52 = v40 == v41;
        v42 = (void *)v41;
        if (v52)
        {
          -[HKMCStatistics menstruationLengthUpperPercentile](self, "menstruationLengthUpperPercentile", v55);
        }
        else
        {
          -[HKMCStatistics menstruationLengthLowerPercentile](v5, "menstruationLengthLowerPercentile");
          v43 = objc_claimAutoreleasedReturnValue();
          if (!v43)
          {
            v11 = 0;
            goto LABEL_72;
          }
          v59 = (void *)v43;
          -[HKMCStatistics menstruationLengthLowerPercentile](self, "menstruationLengthLowerPercentile");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCStatistics menstruationLengthLowerPercentile](v5, "menstruationLengthLowerPercentile");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v44, "isEqual:", v45) & 1) == 0)
          {

            v11 = 0;
            goto LABEL_108;
          }
          v57 = v44;
          -[HKMCStatistics menstruationLengthUpperPercentile](self, "menstruationLengthUpperPercentile", v45);
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCStatistics menstruationLengthUpperPercentile](v5, "menstruationLengthUpperPercentile");
        v47 = objc_claimAutoreleasedReturnValue();
        v11 = v46 == (void *)v47;
        if (v46 == (void *)v47)
        {

        }
        else
        {
          v58 = (void *)v47;
          -[HKMCStatistics menstruationLengthUpperPercentile](v5, "menstruationLengthUpperPercentile");
          v48 = objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v89 = v42;
            v49 = (void *)v48;
            -[HKMCStatistics menstruationLengthUpperPercentile](self, "menstruationLengthUpperPercentile");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMCStatistics menstruationLengthUpperPercentile](v5, "menstruationLengthUpperPercentile");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v50, "isEqual:", v51);

            if (v65 == v89)
            {

            }
            else
            {

            }
LABEL_108:
            if (v68 != v64)
            {

            }
            if (v73 != v72)
            {

            }
            if (v80 != v81)
            {

            }
            if (v86 != v87)
            {

            }
            if (v12 != v13)
            {

            }
            v53 = v7;
            v10 = v84;
            v9 = v85;
            if (v7 == (void *)v8)
              goto LABEL_96;
            goto LABEL_55;
          }

        }
        if (v65 == v42)
        {

          v31 = v68;
          v33 = v64;
          v52 = v68 == v64;
          v20 = v86;
          goto LABEL_74;
        }

LABEL_72:
        v20 = v86;

        v31 = v68;
        v33 = v64;
        v52 = v68 == v64;
LABEL_74:
        v38 = v60;
        if (!v52)
          goto LABEL_75;

        v29 = v63;
        if (v73 == v72)
        {
LABEL_82:

          v3 = v74;
          if (v80 != v81)
          {
LABEL_83:

            if (!v75)
              goto LABEL_85;
            goto LABEL_84;
          }
          goto LABEL_102;
        }
        goto LABEL_51;
      }
    }
    v11 = 0;
  }
LABEL_97:

  return v11;
}

- (unint64_t)hash
{
  int64_t numberOfCycles;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  numberOfCycles = self->_numberOfCycles;
  v4 = -[NSNumber hash](self->_firstMenstruationStartDayIndex, "hash") ^ numberOfCycles;
  v5 = -[NSNumber hash](self->_lastMenstruationStartDayIndex, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_cycleLengthLowerPercentile, "hash");
  v7 = -[NSNumber hash](self->_cycleLengthUpperPercentile, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_menstruationLengthMedian, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_menstruationLengthLowerPercentile, "hash");
  return v9 ^ -[NSNumber hash](self->_menstruationLengthUpperPercentile, "hash");
}

- (int64_t)numberOfCycles
{
  return self->_numberOfCycles;
}

- (NSNumber)firstMenstruationStartDayIndex
{
  return self->_firstMenstruationStartDayIndex;
}

- (NSNumber)lastMenstruationStartDayIndex
{
  return self->_lastMenstruationStartDayIndex;
}

- (NSNumber)cycleLengthMedian
{
  return self->_cycleLengthMedian;
}

- (void)setCycleLengthMedian:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)cycleLengthLowerPercentile
{
  return self->_cycleLengthLowerPercentile;
}

- (NSNumber)cycleLengthUpperPercentile
{
  return self->_cycleLengthUpperPercentile;
}

- (NSNumber)menstruationLengthMedian
{
  return self->_menstruationLengthMedian;
}

- (void)setMenstruationLengthMedian:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)menstruationLengthLowerPercentile
{
  return self->_menstruationLengthLowerPercentile;
}

- (NSNumber)menstruationLengthUpperPercentile
{
  return self->_menstruationLengthUpperPercentile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menstruationLengthUpperPercentile, 0);
  objc_storeStrong((id *)&self->_menstruationLengthLowerPercentile, 0);
  objc_storeStrong((id *)&self->_menstruationLengthMedian, 0);
  objc_storeStrong((id *)&self->_cycleLengthUpperPercentile, 0);
  objc_storeStrong((id *)&self->_cycleLengthLowerPercentile, 0);
  objc_storeStrong((id *)&self->_cycleLengthMedian, 0);
  objc_storeStrong((id *)&self->_lastMenstruationStartDayIndex, 0);
  objc_storeStrong((id *)&self->_firstMenstruationStartDayIndex, 0);
}

@end
