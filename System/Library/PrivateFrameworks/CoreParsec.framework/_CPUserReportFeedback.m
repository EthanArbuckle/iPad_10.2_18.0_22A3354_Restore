@implementation _CPUserReportFeedback

- (_CPUserReportFeedback)init
{
  _CPUserReportFeedback *v2;
  _CPUserReportFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPUserReportFeedback;
  v2 = -[_CPUserReportFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPUserReportFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void)setSections:(id)a3
{
  NSArray *v4;
  NSArray *sections;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  sections = self->_sections;
  self->_sections = v4;

}

- (void)clearSections
{
  -[NSArray removeAllObjects](self->_sections, "removeAllObjects");
}

- (void)addSections:(id)a3
{
  id v4;
  NSArray *sections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  sections = self->_sections;
  v8 = v4;
  if (!sections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sections;
    self->_sections = v6;

    v4 = v8;
    sections = self->_sections;
  }
  -[NSArray addObject:](sections, "addObject:", v4);

}

- (unint64_t)sectionsCount
{
  return -[NSArray count](self->_sections, "count");
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPUserReportFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_CPUserReportFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPUserReportFeedback result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_CPUserReportFeedback result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUserReportFeedback userSelection](self, "userSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_CPUserReportFeedback userSelection](self, "userSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUserReportFeedback cardSection](self, "cardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_CPUserReportFeedback cardSection](self, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUserReportFeedback uuidBytes](self, "uuidBytes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteDataField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_sections;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  -[_CPUserReportFeedback uploadedDataIdentifier](self, "uploadedDataIdentifier", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  if (-[_CPUserReportFeedback reportType](self, "reportType"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  BOOL v38;
  int reportType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_33;
  -[_CPUserReportFeedback result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[_CPUserReportFeedback result](self, "result");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPUserReportFeedback result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_33;
  }
  else
  {

  }
  -[_CPUserReportFeedback userSelection](self, "userSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[_CPUserReportFeedback userSelection](self, "userSelection");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPUserReportFeedback userSelection](self, "userSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSelection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[_CPUserReportFeedback cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[_CPUserReportFeedback cardSection](self, "cardSection");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_CPUserReportFeedback cardSection](self, "cardSection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[_CPUserReportFeedback uuidBytes](self, "uuidBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuidBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[_CPUserReportFeedback uuidBytes](self, "uuidBytes");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_CPUserReportFeedback uuidBytes](self, "uuidBytes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuidBytes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[_CPUserReportFeedback sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[_CPUserReportFeedback sections](self, "sections");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_CPUserReportFeedback sections](self, "sections");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sections");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[_CPUserReportFeedback uploadedDataIdentifier](self, "uploadedDataIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uploadedDataIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_CPUserReportFeedback uploadedDataIdentifier](self, "uploadedDataIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      reportType = self->_reportType;
      v38 = reportType == objc_msgSend(v4, "reportType");
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[_CPUserReportFeedback uploadedDataIdentifier](self, "uploadedDataIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uploadedDataIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (v37)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPSearchResultForFeedback hash](self->_result, "hash");
  v5 = v4 ^ -[_CPPunchoutForFeedback hash](self->_userSelection, "hash");
  v6 = v5 ^ -[_CPCardSectionForFeedback hash](self->_cardSection, "hash");
  v7 = v6 ^ -[NSData hash](self->_uuidBytes, "hash");
  v8 = v7 ^ -[NSArray hash](self->_sections, "hash") ^ v3;
  return v8 ^ -[NSString hash](self->_uploadedDataIdentifier, "hash") ^ (2654435761 * self->_reportType);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (_CPPunchoutForFeedback)userSelection
{
  return self->_userSelection;
}

- (void)setUserSelection:(id)a3
{
  objc_storeStrong((id *)&self->_userSelection, a3);
}

- (_CPCardSectionForFeedback)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (NSData)uuidBytes
{
  return self->_uuidBytes;
}

- (void)setUuidBytes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSString)uploadedDataIdentifier
{
  return self->_uploadedDataIdentifier;
}

- (void)setUploadedDataIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)reportType
{
  return self->_reportType;
}

- (void)setReportType:(int)a3
{
  self->_reportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadedDataIdentifier, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_uuidBytes, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (_CPUserReportFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPUserReportFeedback *v5;
  void *v6;
  _CPSearchResultForFeedback *v7;
  void *v8;
  _CPSearchResultForFeedback *v9;
  void *v10;
  _CPPunchoutForFeedback *v11;
  void *v12;
  _CPPunchoutForFeedback *v13;
  void *v14;
  _CPCardSectionForFeedback *v15;
  void *v16;
  _CPCardSectionForFeedback *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  _CPResultSectionForFeedback *v25;
  void *v26;
  void *v27;
  _CPUserReportFeedback *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_CPUserReportFeedback;
  v5 = -[_CPUserReportFeedback init](&v34, sel_init);
  if (v5)
  {
    -[_CPUserReportFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPSearchResultForFeedback alloc];
      objc_msgSend(v4, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPSearchResultForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPUserReportFeedback setResult:](v5, "setResult:", v9);

    }
    objc_msgSend(v4, "userSelection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_CPPunchoutForFeedback alloc];
      objc_msgSend(v4, "userSelection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_CPPunchoutForFeedback initWithFacade:](v11, "initWithFacade:", v12);
      -[_CPUserReportFeedback setUserSelection:](v5, "setUserSelection:", v13);

    }
    objc_msgSend(v4, "cardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_CPCardSectionForFeedback alloc];
      objc_msgSend(v4, "cardSection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_CPCardSectionForFeedback initWithFacade:](v15, "initWithFacade:", v16);
      -[_CPUserReportFeedback setCardSection:](v5, "setCardSection:", v17);

    }
    objc_msgSend(v4, "sections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "sections", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = -[_CPResultSectionForFeedback initWithFacade:]([_CPResultSectionForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v22);
    }

    -[_CPUserReportFeedback setSections:](v5, "setSections:", v19);
    objc_msgSend(v4, "uploadedDataIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "uploadedDataIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUserReportFeedback setUploadedDataIdentifier:](v5, "setUploadedDataIdentifier:", v27);

    }
    -[_CPUserReportFeedback setReportType:](v5, "setReportType:", objc_msgSend(v4, "reportType"));
    v28 = v5;

  }
  return v5;
}

@end
