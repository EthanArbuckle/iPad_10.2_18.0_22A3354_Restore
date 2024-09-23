@implementation EDAMNoteResultSpec

+ (id)structName
{
  return CFSTR("NoteResultSpec");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[9];

  v14[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_694;
  if (!structFields_structFields_694)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("includeContent"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("includeResourcesData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("includeResourcesRecognition"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("includeResourcesAlternateData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("includeSharedNotes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("includeNoteAppDataValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 1, CFSTR("includeResourceAppDataValues"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[6] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("includeAccountLimits"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[7] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)structFields_structFields_694;
    structFields_structFields_694 = v11;

    v2 = (void *)structFields_structFields_694;
  }
  return v2;
}

- (NSNumber)includeContent
{
  return self->_includeContent;
}

- (void)setIncludeContent:(id)a3
{
  objc_storeStrong((id *)&self->_includeContent, a3);
}

- (NSNumber)includeResourcesData
{
  return self->_includeResourcesData;
}

- (void)setIncludeResourcesData:(id)a3
{
  objc_storeStrong((id *)&self->_includeResourcesData, a3);
}

- (NSNumber)includeResourcesRecognition
{
  return self->_includeResourcesRecognition;
}

- (void)setIncludeResourcesRecognition:(id)a3
{
  objc_storeStrong((id *)&self->_includeResourcesRecognition, a3);
}

- (NSNumber)includeResourcesAlternateData
{
  return self->_includeResourcesAlternateData;
}

- (void)setIncludeResourcesAlternateData:(id)a3
{
  objc_storeStrong((id *)&self->_includeResourcesAlternateData, a3);
}

- (NSNumber)includeSharedNotes
{
  return self->_includeSharedNotes;
}

- (void)setIncludeSharedNotes:(id)a3
{
  objc_storeStrong((id *)&self->_includeSharedNotes, a3);
}

- (NSNumber)includeNoteAppDataValues
{
  return self->_includeNoteAppDataValues;
}

- (void)setIncludeNoteAppDataValues:(id)a3
{
  objc_storeStrong((id *)&self->_includeNoteAppDataValues, a3);
}

- (NSNumber)includeResourceAppDataValues
{
  return self->_includeResourceAppDataValues;
}

- (void)setIncludeResourceAppDataValues:(id)a3
{
  objc_storeStrong((id *)&self->_includeResourceAppDataValues, a3);
}

- (NSNumber)includeAccountLimits
{
  return self->_includeAccountLimits;
}

- (void)setIncludeAccountLimits:(id)a3
{
  objc_storeStrong((id *)&self->_includeAccountLimits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeAccountLimits, 0);
  objc_storeStrong((id *)&self->_includeResourceAppDataValues, 0);
  objc_storeStrong((id *)&self->_includeNoteAppDataValues, 0);
  objc_storeStrong((id *)&self->_includeSharedNotes, 0);
  objc_storeStrong((id *)&self->_includeResourcesAlternateData, 0);
  objc_storeStrong((id *)&self->_includeResourcesRecognition, 0);
  objc_storeStrong((id *)&self->_includeResourcesData, 0);
  objc_storeStrong((id *)&self->_includeContent, 0);
}

@end
