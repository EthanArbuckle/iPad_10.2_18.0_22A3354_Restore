@implementation EDAMResource

+ (id)structName
{
  return CFSTR("Resource");
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
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1223;
  if (!structFields_structFields_1223)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("guid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("noteGuid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v16;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 1, CFSTR("data"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("mime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 6, 1, CFSTR("width"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 6, 1, CFSTR("height"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[5] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 6, 1, CFSTR("duration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[6] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("active"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[7] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 9, 12, 1, CFSTR("recognition"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[8] = v9;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 11, 12, 1, CFSTR("attributes"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[9] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 8, 1, CFSTR("updateSequenceNum"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[10] = v11;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 13, 12, 1, CFSTR("alternateData"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[11] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_1223;
    structFields_structFields_1223 = v13;

    v2 = (void *)structFields_structFields_1223;
  }
  return v2;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSString)noteGuid
{
  return self->_noteGuid;
}

- (void)setNoteGuid:(id)a3
{
  objc_storeStrong((id *)&self->_noteGuid, a3);
}

- (EDAMData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)mime
{
  return self->_mime;
}

- (void)setMime:(id)a3
{
  objc_storeStrong((id *)&self->_mime, a3);
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
  objc_storeStrong((id *)&self->_width, a3);
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
  objc_storeStrong((id *)&self->_active, a3);
}

- (EDAMData)recognition
{
  return self->_recognition;
}

- (void)setRecognition:(id)a3
{
  objc_storeStrong((id *)&self->_recognition, a3);
}

- (EDAMResourceAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (EDAMData)alternateData
{
  return self->_alternateData;
}

- (void)setAlternateData:(id)a3
{
  objc_storeStrong((id *)&self->_alternateData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateData, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_recognition, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_mime, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_noteGuid, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
