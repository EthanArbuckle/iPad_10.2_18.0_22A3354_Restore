@implementation _HKCDADocumentExtractedFields

- (_HKCDADocumentExtractedFields)initWithDocumentData:(id)a3
{
  id v4;
  _HKCDADocumentExtractedFields *v5;
  _HKCDADocumentExtractedFields *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKCDADocumentExtractedFields;
  v5 = -[_HKCDADocumentExtractedFields init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_HKCDADocumentExtractedFields extractHeaderFieldsFromDocumentData:](v5, "extractHeaderFieldsFromDocumentData:", v4);

  return v6;
}

- (void)extractHeaderFieldsFromDocumentData:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *extractedDate;
  NSString *v8;
  NSString *extractedTitle;
  NSString *v10;
  NSString *extractedPatient;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *extractedAuthorName;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *extractedCustodianName;
  _HKXMLExtractor *v20;

  v4 = a3;
  v20 = objc_alloc_init(_HKXMLExtractor);
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/effectiveTime/@value"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/title"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name%use=L/given"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name%use=L/family"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name/given"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name/family"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/author/assignedAuthor/assignedPerson/name/given"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/author/assignedAuthor/assignedPerson/name/family"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/author/assignedAuthor/assignedAuthoringDevice/softwareName"));
  -[_HKXMLExtractor addTagSpecificationForExtraction:](v20, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/name"));
  -[_HKXMLExtractor parseWithData:](v20, "parseWithData:", v4);

  -[_HKCDADocumentExtractedFields _firstFrom:tagRule:nilOnFail:](self, "_firstFrom:tagRule:nilOnFail:", v20, CFSTR("ClinicalDocument/effectiveTime/@value"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_HKCDADocumentExtractedFields _parseCDADate:](self, "_parseCDADate:", v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    extractedDate = self->_extractedDate;
    self->_extractedDate = v6;

  }
  -[_HKCDADocumentExtractedFields _firstFrom:tagRule:nilOnFail:](self, "_firstFrom:tagRule:nilOnFail:", v20, CFSTR("ClinicalDocument/title"), 0);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  extractedTitle = self->_extractedTitle;
  self->_extractedTitle = v8;

  -[_HKCDADocumentExtractedFields _personNameFrom:familyTagRule:givenTagRule:nilOnFail:](self, "_personNameFrom:familyTagRule:givenTagRule:nilOnFail:", v20, CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name%use=L/family"), CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name%use=L/given"), 1);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  extractedPatient = self->_extractedPatient;
  self->_extractedPatient = v10;

  if (!self->_extractedPatient)
  {
    -[_HKCDADocumentExtractedFields _personNameFrom:familyTagRule:givenTagRule:nilOnFail:](self, "_personNameFrom:familyTagRule:givenTagRule:nilOnFail:", v20, CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name/family"), CFSTR("ClinicalDocument/recordTarget/patientRole/patient/name/given"), 1);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_extractedPatient;
    self->_extractedPatient = v12;

  }
  -[_HKCDADocumentExtractedFields _personNameFrom:familyTagRule:givenTagRule:nilOnFail:](self, "_personNameFrom:familyTagRule:givenTagRule:nilOnFail:", v20, CFSTR("ClinicalDocument/author/assignedAuthor/assignedPerson/name/family"), CFSTR("ClinicalDocument/author/assignedAuthor/assignedPerson/name/given"), 1);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  extractedAuthorName = self->_extractedAuthorName;
  self->_extractedAuthorName = v14;

  if (!self->_extractedAuthorName)
  {
    -[_HKCDADocumentExtractedFields _firstFrom:tagRule:nilOnFail:](self, "_firstFrom:tagRule:nilOnFail:", v20, CFSTR("ClinicalDocument/author/assignedAuthor/assignedAuthoringDevice/softwareName"), 0);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = self->_extractedAuthorName;
    self->_extractedAuthorName = v16;

  }
  -[_HKCDADocumentExtractedFields _firstFrom:tagRule:nilOnFail:](self, "_firstFrom:tagRule:nilOnFail:", v20, CFSTR("ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/name"), 0);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  extractedCustodianName = self->_extractedCustodianName;
  self->_extractedCustodianName = v18;

}

- (id)_firstFrom:(id)a3 tagRule:(id)a4 nilOnFail:(BOOL)a5
{
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;

  v7 = &stru_1E37FD4C0;
  if (a5)
    v7 = 0;
  v8 = v7;
  objc_msgSend(a3, "getDataForTagSpecification:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v10;
  }

  return v8;
}

- (id)_personNameFrom:(id)a3 familyTagRule:(id)a4 givenTagRule:(id)a5 nilOnFail:(BOOL)a6
{
  _BOOL4 v6;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  __CFString *v20;

  v6 = a6;
  v9 = (objc_class *)MEMORY[0x1E0CB3850];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v9);
  objc_msgSend(v12, "getDataForTagSpecification:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "getDataForTagSpecification:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count") || (v16 = objc_msgSend(v15, "count")) != 0)
  {
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" "));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFamilyName:", v17);

    }
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setGivenName:", v18);

    }
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v13, 3, 0);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  if (v16)
    v19 = 1;
  else
    v19 = v6;
  if (v19)
    v20 = (__CFString *)v16;
  else
    v20 = &stru_1E37FD4C0;

  return v20;
}

- (id)_parseCDADate:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_HKDateFormatterParsers_onceToken != -1)
    dispatch_once(&_HKDateFormatterParsers_onceToken, &__block_literal_global_238);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)_HKDateFormatterParsers__formatters;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dateFromString:", v3, (_QWORD)v12);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (NSDate)extractedDate
{
  return self->_extractedDate;
}

- (NSString)extractedTitle
{
  return self->_extractedTitle;
}

- (NSString)extractedPatient
{
  return self->_extractedPatient;
}

- (NSString)extractedAuthorName
{
  return self->_extractedAuthorName;
}

- (NSString)extractedCustodianName
{
  return self->_extractedCustodianName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedCustodianName, 0);
  objc_storeStrong((id *)&self->_extractedAuthorName, 0);
  objc_storeStrong((id *)&self->_extractedPatient, 0);
  objc_storeStrong((id *)&self->_extractedTitle, 0);
  objc_storeStrong((id *)&self->_extractedDate, 0);
}

@end
