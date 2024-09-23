@implementation BCProtoAnnotation

- (void)setDeleted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasDeleted
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsUnderline:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isUnderline = a3;
}

- (void)setHasIsUnderline:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsUnderline
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasLocationCFIString
{
  return self->_locationCFIString != 0;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (BOOL)hasRepresentativeText
{
  return self->_representativeText != 0;
}

- (BOOL)hasSelectedText
{
  return self->_selectedText != 0;
}

- (void)setStyle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStyle
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasPhysicalPageNumber
{
  return self->_physicalPageNumber != 0;
}

- (BOOL)hasAnnotationVersion
{
  return self->_annotationVersion != 0;
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (BOOL)hasAttachments
{
  return self->_attachments != 0;
}

- (BOOL)hasChapterTitle
{
  return self->_chapterTitle != 0;
}

- (void)setUserModificationDate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_userModificationDate = a3;
}

- (void)setHasUserModificationDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasUserModificationDate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasSelectedTextRange
{
  return self->_selectedTextRange != 0;
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_readingProgressHighWaterMark = a3;
}

- (void)setHasReadingProgressHighWaterMark:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasReadingProgressHighWaterMark
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSpineIndexUpdated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_spineIndexUpdated = a3;
}

- (void)setHasSpineIndexUpdated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSpineIndexUpdated
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setReadingProgress:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_readingProgress = a3;
}

- (void)setHasReadingProgress:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasReadingProgress
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasFutureProofing11
{
  return self->_futureProofing11 != 0;
}

- (BOOL)hasFutureProofing12
{
  return self->_futureProofing12 != 0;
}

- (void)setPlAbsolutePhysicalLocation:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_plAbsolutePhysicalLocation = a3;
}

- (void)setHasPlAbsolutePhysicalLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPlAbsolutePhysicalLocation
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPlLocationRangeEnd:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_plLocationRangeEnd = a3;
}

- (void)setHasPlLocationRangeEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPlLocationRangeEnd
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPlLocationRangeStart:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_plLocationRangeStart = a3;
}

- (void)setHasPlLocationRangeStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPlLocationRangeStart
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlLocationStorageUUID
{
  return self->_plLocationStorageUUID != 0;
}

- (BOOL)hasPlUserData
{
  return self->_plUserData != 0;
}

- (void)setLocationModificationDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_locationModificationDate = a3;
}

- (void)setHasLocationModificationDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLocationModificationDate
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)BCProtoAnnotation;
  -[BCProtoAnnotation description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("%@ %@"), v11, v12, v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *creatorIdentifier;
  __int16 has;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSString *locationCFIString;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  NSString *note;
  NSString *representativeText;
  NSString *selectedText;
  __int16 v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSString *uuid;
  NSString *physicalPageNumber;
  NSString *annotationVersion;
  NSString *assetVersion;
  NSString *attachments;
  NSString *chapterTitle;
  void *v49;
  const char *v50;
  uint64_t v51;
  BCAnnotationRange *selectedTextRange;
  void *v53;
  const char *v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  NSString *futureProofing11;
  NSString *futureProofing12;
  __int16 v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  NSString *plLocationStorageUUID;
  NSData *plUserData;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v7, v8, v9, v10, self->_creationDate);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("creationDate"), v13);

  creatorIdentifier = self->_creatorIdentifier;
  if (creatorIdentifier)
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)creatorIdentifier, (uint64_t)CFSTR("creatorIdentifier"), v16);
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v14, self->_deleted, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, (uint64_t)CFSTR("deleted"), v21);

    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v14, self->_isUnderline, v15, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, (uint64_t)CFSTR("isUnderline"), v24);

  }
  locationCFIString = self->_locationCFIString;
  if (locationCFIString)
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)locationCFIString, (uint64_t)CFSTR("locationCFIString"), v16);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v14, (uint64_t)locationCFIString, v15, v16, self->_modificationDate);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, (uint64_t)CFSTR("modificationDate"), v28);

  note = self->_note;
  if (note)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)note, (uint64_t)CFSTR("note"), v31);
  representativeText = self->_representativeText;
  if (representativeText)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)representativeText, (uint64_t)CFSTR("representativeText"), v31);
  selectedText = self->_selectedText;
  if (selectedText)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)selectedText, (uint64_t)CFSTR("selectedText"), v31);
  v36 = (__int16)self->_has;
  if ((v36 & 0x80) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v29, self->_style, v30, v31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v37, (uint64_t)CFSTR("style"), v39);

    v36 = (__int16)self->_has;
  }
  if ((v36 & 0x100) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v29, self->_type, v30, v31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v41, (uint64_t)v40, (uint64_t)CFSTR("type"), v42);

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)uuid, (uint64_t)CFSTR("uuid"), v31);
  physicalPageNumber = self->_physicalPageNumber;
  if (physicalPageNumber)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)physicalPageNumber, (uint64_t)CFSTR("physicalPageNumber"), v31);
  annotationVersion = self->_annotationVersion;
  if (annotationVersion)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)annotationVersion, (uint64_t)CFSTR("annotationVersion"), v31);
  assetVersion = self->_assetVersion;
  if (assetVersion)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)assetVersion, (uint64_t)CFSTR("assetVersion"), v31);
  attachments = self->_attachments;
  if (attachments)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)attachments, (uint64_t)CFSTR("attachments"), v31);
  chapterTitle = self->_chapterTitle;
  if (chapterTitle)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)chapterTitle, (uint64_t)CFSTR("chapterTitle"), v31);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v29, (uint64_t)chapterTitle, v30, v31, self->_userModificationDate);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v50, (uint64_t)v49, (uint64_t)CFSTR("userModificationDate"), v51);

  }
  selectedTextRange = self->_selectedTextRange;
  if (selectedTextRange)
  {
    objc_msgSend_dictionaryRepresentation(selectedTextRange, v29, (uint64_t)chapterTitle, v30, v31);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v54, (uint64_t)v53, (uint64_t)CFSTR("selectedTextRange"), v55);

  }
  v56 = (__int16)self->_has;
  if ((v56 & 0x40) != 0)
  {
    *(float *)&v32 = self->_readingProgressHighWaterMark;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v29, (uint64_t)chapterTitle, v30, v31, v32);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v73, (uint64_t)v72, (uint64_t)CFSTR("readingProgressHighWaterMark"), v74);

    v56 = (__int16)self->_has;
    if ((v56 & 0x800) == 0)
    {
LABEL_37:
      if ((v56 & 0x20) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v29, self->_spineIndexUpdated, v30, v31);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v76, (uint64_t)v75, (uint64_t)CFSTR("spineIndexUpdated"), v77);

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_38:
    *(float *)&v32 = self->_readingProgress;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v29, (uint64_t)chapterTitle, v30, v31, v32);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v58, (uint64_t)v57, (uint64_t)CFSTR("readingProgress"), v59);

  }
LABEL_39:
  futureProofing11 = self->_futureProofing11;
  if (futureProofing11)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)futureProofing11, (uint64_t)CFSTR("futureProofing11"), v31);
  futureProofing12 = self->_futureProofing12;
  if (futureProofing12)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)futureProofing12, (uint64_t)CFSTR("futureProofing12"), v31);
  v62 = (__int16)self->_has;
  if ((v62 & 4) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v29, self->_plAbsolutePhysicalLocation, v30, v31);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v79, (uint64_t)v78, (uint64_t)CFSTR("plAbsolutePhysicalLocation"), v80);

    v62 = (__int16)self->_has;
    if ((v62 & 8) == 0)
    {
LABEL_45:
      if ((v62 & 0x10) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((v62 & 8) == 0)
  {
    goto LABEL_45;
  }
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v29, self->_plLocationRangeEnd, v30, v31);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v82, (uint64_t)v81, (uint64_t)CFSTR("plLocationRangeEnd"), v83);

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_46:
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v29, self->_plLocationRangeStart, v30, v31);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v64, (uint64_t)v63, (uint64_t)CFSTR("plLocationRangeStart"), v65);

  }
LABEL_47:
  plLocationStorageUUID = self->_plLocationStorageUUID;
  if (plLocationStorageUUID)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)plLocationStorageUUID, (uint64_t)CFSTR("plLocationStorageUUID"), v31);
  plUserData = self->_plUserData;
  if (plUserData)
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)plUserData, (uint64_t)CFSTR("plUserData"), v31);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v29, (uint64_t)plUserData, v30, v31, self->_locationModificationDate);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v69, (uint64_t)v68, (uint64_t)CFSTR("locationModificationDate"), v70);

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return BCProtoAnnotationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  void *v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v9 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_creatorIdentifier)
    sub_227E5B75C();
  PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_locationCFIString)
    PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  if (self->_note)
    PBDataWriterWriteStringField();
  if (self->_representativeText)
    PBDataWriterWriteStringField();
  if (self->_selectedText)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x100) != 0)
    PBDataWriterWriteUint32Field();
  if (!self->_uuid)
    sub_227E5B784();
  PBDataWriterWriteStringField();
  if (self->_physicalPageNumber)
    PBDataWriterWriteStringField();
  if (self->_annotationVersion)
    PBDataWriterWriteStringField();
  v6 = v9;
  if (self->_assetVersion)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_attachments)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_chapterTitle)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v9;
  }
  if (self->_selectedTextRange)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteFloatField();
    v6 = v9;
    v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_35:
      if ((v7 & 0x20) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteBOOLField();
  v6 = v9;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_36:
    PBDataWriterWriteFloatField();
    v6 = v9;
  }
LABEL_37:
  if (self->_futureProofing11)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_futureProofing12)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v9;
    v8 = (__int16)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_43:
      if ((v8 & 0x10) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteInt32Field();
  v6 = v9;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_44:
    PBDataWriterWriteInt32Field();
    v6 = v9;
  }
LABEL_45:
  if (self->_plLocationStorageUUID)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_plUserData)
  {
    PBDataWriterWriteDataField();
    v6 = v9;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v9;
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int16 has;
  NSString *locationCFIString;
  NSString *note;
  NSString *representativeText;
  NSString *selectedText;
  __int16 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *physicalPageNumber;
  NSString *annotationVersion;
  NSString *assetVersion;
  _QWORD *v23;
  NSString *attachments;
  NSString *chapterTitle;
  BCAnnotationRange *selectedTextRange;
  __int16 v27;
  NSString *futureProofing11;
  NSString *futureProofing12;
  __int16 v30;
  NSString *plLocationStorageUUID;
  NSData *plUserData;
  _QWORD *v33;

  v33 = a3;
  v33[1] = *(_QWORD *)&self->_creationDate;
  objc_msgSend_setCreatorIdentifier_(v33, v4, (uint64_t)self->_creatorIdentifier, v5, v6);
  v10 = v33;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_BYTE *)v33 + 200) = self->_deleted;
    *((_WORD *)v33 + 102) |= 0x200u;
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((_BYTE *)v33 + 201) = self->_isUnderline;
    *((_WORD *)v33 + 102) |= 0x400u;
  }
  locationCFIString = self->_locationCFIString;
  if (locationCFIString)
  {
    objc_msgSend_setLocationCFIString_(v33, v7, (uint64_t)locationCFIString, v8, v9);
    v10 = v33;
  }
  v10[3] = *(_QWORD *)&self->_modificationDate;
  note = self->_note;
  if (note)
  {
    objc_msgSend_setNote_(v33, v7, (uint64_t)note, v8, v9);
    v10 = v33;
  }
  representativeText = self->_representativeText;
  if (representativeText)
  {
    objc_msgSend_setRepresentativeText_(v33, v7, (uint64_t)representativeText, v8, v9);
    v10 = v33;
  }
  selectedText = self->_selectedText;
  if (selectedText)
  {
    objc_msgSend_setSelectedText_(v33, v7, (uint64_t)selectedText, v8, v9);
    v10 = v33;
  }
  v16 = (__int16)self->_has;
  if ((v16 & 0x80) != 0)
  {
    *((_DWORD *)v10 + 46) = self->_style;
    *((_WORD *)v10 + 102) |= 0x80u;
    v16 = (__int16)self->_has;
  }
  if ((v16 & 0x100) != 0)
  {
    *((_DWORD *)v10 + 47) = self->_type;
    *((_WORD *)v10 + 102) |= 0x100u;
  }
  objc_msgSend_setUuid_(v10, v7, (uint64_t)self->_uuid, v8, v9);
  physicalPageNumber = self->_physicalPageNumber;
  if (physicalPageNumber)
    objc_msgSend_setPhysicalPageNumber_(v33, v17, (uint64_t)physicalPageNumber, v18, v19);
  annotationVersion = self->_annotationVersion;
  if (annotationVersion)
    objc_msgSend_setAnnotationVersion_(v33, v17, (uint64_t)annotationVersion, v18, v19);
  assetVersion = self->_assetVersion;
  v23 = v33;
  if (assetVersion)
  {
    objc_msgSend_setAssetVersion_(v33, v17, (uint64_t)assetVersion, v18, v19);
    v23 = v33;
  }
  attachments = self->_attachments;
  if (attachments)
  {
    objc_msgSend_setAttachments_(v33, v17, (uint64_t)attachments, v18, v19);
    v23 = v33;
  }
  chapterTitle = self->_chapterTitle;
  if (chapterTitle)
  {
    objc_msgSend_setChapterTitle_(v33, v17, (uint64_t)chapterTitle, v18, v19);
    v23 = v33;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v23[4] = *(_QWORD *)&self->_userModificationDate;
    *((_WORD *)v23 + 102) |= 2u;
  }
  selectedTextRange = self->_selectedTextRange;
  if (selectedTextRange)
  {
    objc_msgSend_setSelectedTextRange_(v33, v17, (uint64_t)selectedTextRange, v18, v19);
    v23 = v33;
  }
  v27 = (__int16)self->_has;
  if ((v27 & 0x40) != 0)
  {
    *((_DWORD *)v23 + 39) = LODWORD(self->_readingProgressHighWaterMark);
    *((_WORD *)v23 + 102) |= 0x40u;
    v27 = (__int16)self->_has;
    if ((v27 & 0x800) == 0)
    {
LABEL_33:
      if ((v27 & 0x20) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_33;
  }
  *((_BYTE *)v23 + 202) = self->_spineIndexUpdated;
  *((_WORD *)v23 + 102) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_34:
    *((_DWORD *)v23 + 38) = LODWORD(self->_readingProgress);
    *((_WORD *)v23 + 102) |= 0x20u;
  }
LABEL_35:
  futureProofing11 = self->_futureProofing11;
  if (futureProofing11)
  {
    objc_msgSend_setFutureProofing11_(v33, v17, (uint64_t)futureProofing11, v18, v19);
    v23 = v33;
  }
  futureProofing12 = self->_futureProofing12;
  if (futureProofing12)
  {
    objc_msgSend_setFutureProofing12_(v33, v17, (uint64_t)futureProofing12, v18, v19);
    v23 = v33;
  }
  v30 = (__int16)self->_has;
  if ((v30 & 4) != 0)
  {
    *((_DWORD *)v23 + 30) = self->_plAbsolutePhysicalLocation;
    *((_WORD *)v23 + 102) |= 4u;
    v30 = (__int16)self->_has;
    if ((v30 & 8) == 0)
    {
LABEL_41:
      if ((v30 & 0x10) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((v30 & 8) == 0)
  {
    goto LABEL_41;
  }
  *((_DWORD *)v23 + 31) = self->_plLocationRangeEnd;
  *((_WORD *)v23 + 102) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_42:
    *((_DWORD *)v23 + 32) = self->_plLocationRangeStart;
    *((_WORD *)v23 + 102) |= 0x10u;
  }
LABEL_43:
  plLocationStorageUUID = self->_plLocationStorageUUID;
  if (plLocationStorageUUID)
  {
    objc_msgSend_setPlLocationStorageUUID_(v33, v17, (uint64_t)plLocationStorageUUID, v18, v19);
    v23 = v33;
  }
  plUserData = self->_plUserData;
  if (plUserData)
  {
    objc_msgSend_setPlUserData_(v33, v17, (uint64_t)plUserData, v18, v19);
    v23 = v33;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v23[2] = *(_QWORD *)&self->_locationModificationDate;
    *((_WORD *)v23 + 102) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __int16 has;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  *(double *)(v14 + 8) = self->_creationDate;
  v18 = objc_msgSend_copyWithZone_(self->_creatorIdentifier, v15, (uint64_t)a3, v16, v17);
  v19 = *(void **)(v14 + 72);
  *(_QWORD *)(v14 + 72) = v18;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_BYTE *)(v14 + 200) = self->_deleted;
    *(_WORD *)(v14 + 204) |= 0x200u;
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *(_BYTE *)(v14 + 201) = self->_isUnderline;
    *(_WORD *)(v14 + 204) |= 0x400u;
  }
  v24 = objc_msgSend_copyWithZone_(self->_locationCFIString, v20, (uint64_t)a3, v21, v22);
  v25 = *(void **)(v14 + 96);
  *(_QWORD *)(v14 + 96) = v24;

  *(double *)(v14 + 24) = self->_modificationDate;
  v29 = objc_msgSend_copyWithZone_(self->_note, v26, (uint64_t)a3, v27, v28);
  v30 = *(void **)(v14 + 104);
  *(_QWORD *)(v14 + 104) = v29;

  v34 = objc_msgSend_copyWithZone_(self->_representativeText, v31, (uint64_t)a3, v32, v33);
  v35 = *(void **)(v14 + 160);
  *(_QWORD *)(v14 + 160) = v34;

  v39 = objc_msgSend_copyWithZone_(self->_selectedText, v36, (uint64_t)a3, v37, v38);
  v40 = *(void **)(v14 + 168);
  *(_QWORD *)(v14 + 168) = v39;

  v44 = (__int16)self->_has;
  if ((v44 & 0x80) != 0)
  {
    *(_DWORD *)(v14 + 184) = self->_style;
    *(_WORD *)(v14 + 204) |= 0x80u;
    v44 = (__int16)self->_has;
  }
  if ((v44 & 0x100) != 0)
  {
    *(_DWORD *)(v14 + 188) = self->_type;
    *(_WORD *)(v14 + 204) |= 0x100u;
  }
  v45 = objc_msgSend_copyWithZone_(self->_uuid, v41, (uint64_t)a3, v42, v43);
  v46 = *(void **)(v14 + 192);
  *(_QWORD *)(v14 + 192) = v45;

  v50 = objc_msgSend_copyWithZone_(self->_physicalPageNumber, v47, (uint64_t)a3, v48, v49);
  v51 = *(void **)(v14 + 112);
  *(_QWORD *)(v14 + 112) = v50;

  v55 = objc_msgSend_copyWithZone_(self->_annotationVersion, v52, (uint64_t)a3, v53, v54);
  v56 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v55;

  v60 = objc_msgSend_copyWithZone_(self->_assetVersion, v57, (uint64_t)a3, v58, v59);
  v61 = *(void **)(v14 + 48);
  *(_QWORD *)(v14 + 48) = v60;

  v65 = objc_msgSend_copyWithZone_(self->_attachments, v62, (uint64_t)a3, v63, v64);
  v66 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = v65;

  v70 = objc_msgSend_copyWithZone_(self->_chapterTitle, v67, (uint64_t)a3, v68, v69);
  v71 = *(void **)(v14 + 64);
  *(_QWORD *)(v14 + 64) = v70;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(double *)(v14 + 32) = self->_userModificationDate;
    *(_WORD *)(v14 + 204) |= 2u;
  }
  v75 = objc_msgSend_copyWithZone_(self->_selectedTextRange, v72, (uint64_t)a3, v73, v74);
  v76 = *(void **)(v14 + 176);
  *(_QWORD *)(v14 + 176) = v75;

  v80 = (__int16)self->_has;
  if ((v80 & 0x40) != 0)
  {
    *(float *)(v14 + 156) = self->_readingProgressHighWaterMark;
    *(_WORD *)(v14 + 204) |= 0x40u;
    v80 = (__int16)self->_has;
    if ((v80 & 0x800) == 0)
    {
LABEL_13:
      if ((v80 & 0x20) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_13;
  }
  *(_BYTE *)(v14 + 202) = self->_spineIndexUpdated;
  *(_WORD *)(v14 + 204) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    *(float *)(v14 + 152) = self->_readingProgress;
    *(_WORD *)(v14 + 204) |= 0x20u;
  }
LABEL_15:
  v81 = objc_msgSend_copyWithZone_(self->_futureProofing11, v77, (uint64_t)a3, v78, v79);
  v82 = *(void **)(v14 + 80);
  *(_QWORD *)(v14 + 80) = v81;

  v86 = objc_msgSend_copyWithZone_(self->_futureProofing12, v83, (uint64_t)a3, v84, v85);
  v87 = *(void **)(v14 + 88);
  *(_QWORD *)(v14 + 88) = v86;

  v91 = (__int16)self->_has;
  if ((v91 & 4) != 0)
  {
    *(_DWORD *)(v14 + 120) = self->_plAbsolutePhysicalLocation;
    *(_WORD *)(v14 + 204) |= 4u;
    v91 = (__int16)self->_has;
    if ((v91 & 8) == 0)
    {
LABEL_17:
      if ((v91 & 0x10) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((v91 & 8) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v14 + 124) = self->_plLocationRangeEnd;
  *(_WORD *)(v14 + 204) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    *(_DWORD *)(v14 + 128) = self->_plLocationRangeStart;
    *(_WORD *)(v14 + 204) |= 0x10u;
  }
LABEL_19:
  v92 = objc_msgSend_copyWithZone_(self->_plLocationStorageUUID, v88, (uint64_t)a3, v89, v90);
  v93 = *(void **)(v14 + 136);
  *(_QWORD *)(v14 + 136) = v92;

  v97 = objc_msgSend_copyWithZone_(self->_plUserData, v94, (uint64_t)a3, v95, v96);
  v98 = *(void **)(v14 + 144);
  *(_QWORD *)(v14 + 144) = v97;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(double *)(v14 + 16) = self->_locationModificationDate;
    *(_WORD *)(v14 + 204) |= 1u;
  }
  return (id)v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *creatorIdentifier;
  uint64_t v13;
  NSString *locationCFIString;
  uint64_t v15;
  NSString *note;
  uint64_t v17;
  NSString *representativeText;
  uint64_t v19;
  NSString *selectedText;
  uint64_t v21;
  __int16 v22;
  NSString *uuid;
  uint64_t v24;
  NSString *physicalPageNumber;
  uint64_t v26;
  NSString *annotationVersion;
  uint64_t v28;
  NSString *assetVersion;
  uint64_t v30;
  NSString *attachments;
  uint64_t v32;
  NSString *chapterTitle;
  uint64_t v34;
  __int16 has;
  __int16 v36;
  BCAnnotationRange *selectedTextRange;
  uint64_t v38;
  __int16 v39;
  NSString *futureProofing11;
  uint64_t v41;
  NSString *futureProofing12;
  uint64_t v43;
  __int16 v44;
  __int16 v45;
  NSString *plLocationStorageUUID;
  uint64_t v47;
  NSData *plUserData;
  uint64_t v49;
  __int16 v50;
  BOOL v51;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8))
    goto LABEL_106;
  if (self->_creationDate != *((double *)v4 + 1))
    goto LABEL_106;
  creatorIdentifier = self->_creatorIdentifier;
  v13 = v4[9];
  if ((unint64_t)creatorIdentifier | v13)
  {
    if (!objc_msgSend_isEqual_(creatorIdentifier, v9, v13, v10, v11))
      goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0)
      goto LABEL_106;
    if (self->_deleted)
    {
      if (!*((_BYTE *)v4 + 200))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 200))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x400) == 0)
      goto LABEL_106;
    if (self->_isUnderline)
    {
      if (!*((_BYTE *)v4 + 201))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 201))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  locationCFIString = self->_locationCFIString;
  v15 = v4[12];
  if ((unint64_t)locationCFIString | v15
    && !objc_msgSend_isEqual_(locationCFIString, v9, v15, v10, v11))
  {
    goto LABEL_106;
  }
  if (self->_modificationDate != *((double *)v4 + 3))
    goto LABEL_106;
  note = self->_note;
  v17 = v4[13];
  if ((unint64_t)note | v17)
  {
    if (!objc_msgSend_isEqual_(note, v9, v17, v10, v11))
      goto LABEL_106;
  }
  representativeText = self->_representativeText;
  v19 = v4[20];
  if ((unint64_t)representativeText | v19)
  {
    if (!objc_msgSend_isEqual_(representativeText, v9, v19, v10, v11))
      goto LABEL_106;
  }
  selectedText = self->_selectedText;
  v21 = v4[21];
  if ((unint64_t)selectedText | v21)
  {
    if (!objc_msgSend_isEqual_(selectedText, v9, v21, v10, v11))
      goto LABEL_106;
  }
  v22 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v22 & 0x80) == 0 || self->_style != *((_DWORD *)v4 + 46))
      goto LABEL_106;
  }
  else if ((v22 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0 || self->_type != *((_DWORD *)v4 + 47))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  uuid = self->_uuid;
  v24 = v4[24];
  if ((unint64_t)uuid | v24 && !objc_msgSend_isEqual_(uuid, v9, v24, v10, v11))
    goto LABEL_106;
  physicalPageNumber = self->_physicalPageNumber;
  v26 = v4[14];
  if ((unint64_t)physicalPageNumber | v26)
  {
    if (!objc_msgSend_isEqual_(physicalPageNumber, v9, v26, v10, v11))
      goto LABEL_106;
  }
  annotationVersion = self->_annotationVersion;
  v28 = v4[5];
  if ((unint64_t)annotationVersion | v28)
  {
    if (!objc_msgSend_isEqual_(annotationVersion, v9, v28, v10, v11))
      goto LABEL_106;
  }
  assetVersion = self->_assetVersion;
  v30 = v4[6];
  if ((unint64_t)assetVersion | v30)
  {
    if (!objc_msgSend_isEqual_(assetVersion, v9, v30, v10, v11))
      goto LABEL_106;
  }
  attachments = self->_attachments;
  v32 = v4[7];
  if ((unint64_t)attachments | v32)
  {
    if (!objc_msgSend_isEqual_(attachments, v9, v32, v10, v11))
      goto LABEL_106;
  }
  chapterTitle = self->_chapterTitle;
  v34 = v4[8];
  if ((unint64_t)chapterTitle | v34)
  {
    if (!objc_msgSend_isEqual_(chapterTitle, v9, v34, v10, v11))
      goto LABEL_106;
  }
  has = (__int16)self->_has;
  v36 = *((_WORD *)v4 + 102);
  if ((has & 2) != 0)
  {
    if ((v36 & 2) == 0 || self->_userModificationDate != *((double *)v4 + 4))
      goto LABEL_106;
  }
  else if ((v36 & 2) != 0)
  {
    goto LABEL_106;
  }
  selectedTextRange = self->_selectedTextRange;
  v38 = v4[22];
  if ((unint64_t)selectedTextRange | v38)
  {
    if (!objc_msgSend_isEqual_(selectedTextRange, v9, v38, v10, v11))
      goto LABEL_106;
    has = (__int16)self->_has;
  }
  v39 = *((_WORD *)v4 + 102);
  if ((has & 0x40) != 0)
  {
    if ((v39 & 0x40) == 0 || self->_readingProgressHighWaterMark != *((float *)v4 + 39))
      goto LABEL_106;
  }
  else if ((v39 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x800) != 0)
    {
      if (self->_spineIndexUpdated)
      {
        if (!*((_BYTE *)v4 + 202))
          goto LABEL_106;
        goto LABEL_73;
      }
      if (!*((_BYTE *)v4 + 202))
        goto LABEL_73;
    }
LABEL_106:
    v51 = 0;
    goto LABEL_107;
  }
  if ((*((_WORD *)v4 + 102) & 0x800) != 0)
    goto LABEL_106;
LABEL_73:
  if ((has & 0x20) != 0)
  {
    if ((v39 & 0x20) == 0 || self->_readingProgress != *((float *)v4 + 38))
      goto LABEL_106;
  }
  else if ((v39 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  futureProofing11 = self->_futureProofing11;
  v41 = v4[10];
  if ((unint64_t)futureProofing11 | v41
    && !objc_msgSend_isEqual_(futureProofing11, v9, v41, v10, v11))
  {
    goto LABEL_106;
  }
  futureProofing12 = self->_futureProofing12;
  v43 = v4[11];
  if ((unint64_t)futureProofing12 | v43)
  {
    if (!objc_msgSend_isEqual_(futureProofing12, v9, v43, v10, v11))
      goto LABEL_106;
  }
  v44 = (__int16)self->_has;
  v45 = *((_WORD *)v4 + 102);
  if ((v44 & 4) != 0)
  {
    if ((v45 & 4) == 0 || self->_plAbsolutePhysicalLocation != *((_DWORD *)v4 + 30))
      goto LABEL_106;
  }
  else if ((v45 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((v44 & 8) != 0)
  {
    if ((v45 & 8) == 0 || self->_plLocationRangeEnd != *((_DWORD *)v4 + 31))
      goto LABEL_106;
  }
  else if ((v45 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((v44 & 0x10) != 0)
  {
    if ((v45 & 0x10) == 0 || self->_plLocationRangeStart != *((_DWORD *)v4 + 32))
      goto LABEL_106;
  }
  else if ((v45 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  plLocationStorageUUID = self->_plLocationStorageUUID;
  v47 = v4[17];
  if ((unint64_t)plLocationStorageUUID | v47
    && !objc_msgSend_isEqual_(plLocationStorageUUID, v9, v47, v10, v11))
  {
    goto LABEL_106;
  }
  plUserData = self->_plUserData;
  v49 = v4[18];
  if ((unint64_t)plUserData | v49)
  {
    if (!objc_msgSend_isEqual_(plUserData, v9, v49, v10, v11))
      goto LABEL_106;
  }
  v50 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v50 & 1) == 0 || self->_locationModificationDate != *((double *)v4 + 2))
      goto LABEL_106;
    v51 = 1;
  }
  else
  {
    v51 = (v50 & 1) == 0;
  }
LABEL_107:

  return v51;
}

- (unint64_t)hash
{
  double creationDate;
  double v4;
  long double v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double modificationDate;
  double v20;
  long double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  double userModificationDate;
  double v69;
  long double v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int16 has;
  unint64_t v77;
  float readingProgressHighWaterMark;
  double v79;
  long double v80;
  double v81;
  unint64_t v82;
  float readingProgress;
  double v84;
  long double v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  double locationModificationDate;
  double v108;
  long double v109;
  double v110;
  double v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;

  creationDate = self->_creationDate;
  v4 = -creationDate;
  if (creationDate >= 0.0)
    v4 = self->_creationDate;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v11 = fmod(v5, 1.84467441e19);
  v12 = 2654435761u * (unint64_t)v11;
  v13 = v12 + (unint64_t)v6;
  if (v6 <= 0.0)
    v13 = 2654435761u * (unint64_t)v11;
  v14 = v12 - (unint64_t)fabs(v6);
  if (v6 >= 0.0)
    v14 = v13;
  v136 = v14;
  v135 = objc_msgSend_hash(self->_creatorIdentifier, v7, v8, v9, v10);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v134 = 2654435761 * self->_deleted;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
  }
  else
  {
    v134 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_9:
      v133 = 2654435761 * self->_isUnderline;
      goto LABEL_12;
    }
  }
  v133 = 0;
LABEL_12:
  v132 = objc_msgSend_hash(self->_locationCFIString, v15, v16, v17, v18);
  modificationDate = self->_modificationDate;
  v20 = -modificationDate;
  if (modificationDate >= 0.0)
    v20 = self->_modificationDate;
  v21 = floor(v20 + 0.5);
  v22 = (v20 - v21) * 1.84467441e19;
  v27 = fmod(v21, 1.84467441e19);
  v28 = 2654435761u * (unint64_t)v27;
  v29 = v28 + (unint64_t)v22;
  if (v22 <= 0.0)
    v29 = 2654435761u * (unint64_t)v27;
  v30 = v28 - (unint64_t)fabs(v22);
  if (v22 >= 0.0)
    v30 = v29;
  v131 = v30;
  v130 = objc_msgSend_hash(self->_note, v23, v24, v25, v26);
  v129 = objc_msgSend_hash(self->_representativeText, v31, v32, v33, v34);
  v128 = objc_msgSend_hash(self->_selectedText, v35, v36, v37, v38);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v127 = 2654435761 * self->_style;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_20;
  }
  else
  {
    v127 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_20:
      v126 = 2654435761 * self->_type;
      goto LABEL_23;
    }
  }
  v126 = 0;
LABEL_23:
  v125 = objc_msgSend_hash(self->_uuid, v39, v40, v41, v42);
  v124 = objc_msgSend_hash(self->_physicalPageNumber, v43, v44, v45, v46);
  v123 = objc_msgSend_hash(self->_annotationVersion, v47, v48, v49, v50);
  v122 = objc_msgSend_hash(self->_assetVersion, v51, v52, v53, v54);
  v121 = objc_msgSend_hash(self->_attachments, v55, v56, v57, v58);
  v120 = objc_msgSend_hash(self->_chapterTitle, v59, v60, v61, v62);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    userModificationDate = self->_userModificationDate;
    v69 = -userModificationDate;
    if (userModificationDate >= 0.0)
      v69 = self->_userModificationDate;
    v70 = floor(v69 + 0.5);
    v71 = (v69 - v70) * 1.84467441e19;
    v67 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
    if (v71 >= 0.0)
    {
      if (v71 > 0.0)
        v67 += (unint64_t)v71;
    }
    else
    {
      v67 -= (unint64_t)fabs(v71);
    }
  }
  else
  {
    v67 = 0;
  }
  v119 = v67;
  v118 = objc_msgSend_hash(self->_selectedTextRange, v63, v64, v65, v66);
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    readingProgressHighWaterMark = self->_readingProgressHighWaterMark;
    v79 = readingProgressHighWaterMark;
    if (readingProgressHighWaterMark < 0.0)
      v79 = -readingProgressHighWaterMark;
    v80 = floor(v79 + 0.5);
    v81 = (v79 - v80) * 1.84467441e19;
    v77 = 2654435761u * (unint64_t)fmod(v80, 1.84467441e19);
    if (v81 >= 0.0)
    {
      if (v81 > 0.0)
        v77 += (unint64_t)v81;
    }
    else
    {
      v77 -= (unint64_t)fabs(v81);
    }
  }
  else
  {
    v77 = 0;
  }
  if ((has & 0x800) != 0)
    v116 = 2654435761 * self->_spineIndexUpdated;
  else
    v116 = 0;
  v117 = v77;
  if ((has & 0x20) != 0)
  {
    readingProgress = self->_readingProgress;
    v84 = readingProgress;
    if (readingProgress < 0.0)
      v84 = -readingProgress;
    v85 = floor(v84 + 0.5);
    v86 = (v84 - v85) * 1.84467441e19;
    v82 = 2654435761u * (unint64_t)fmod(v85, 1.84467441e19);
    if (v86 >= 0.0)
    {
      if (v86 > 0.0)
        v82 += (unint64_t)v86;
    }
    else
    {
      v82 -= (unint64_t)fabs(v86);
    }
  }
  else
  {
    v82 = 0;
  }
  v115 = objc_msgSend_hash(self->_futureProofing11, v72, v73, v74, v75);
  v95 = objc_msgSend_hash(self->_futureProofing12, v87, v88, v89, v90);
  v96 = (__int16)self->_has;
  if ((v96 & 4) == 0)
  {
    v97 = 0;
    if ((v96 & 8) != 0)
      goto LABEL_52;
LABEL_55:
    v98 = 0;
    if ((v96 & 0x10) != 0)
      goto LABEL_53;
    goto LABEL_56;
  }
  v97 = 2654435761 * self->_plAbsolutePhysicalLocation;
  if ((v96 & 8) == 0)
    goto LABEL_55;
LABEL_52:
  v98 = 2654435761 * self->_plLocationRangeEnd;
  if ((v96 & 0x10) != 0)
  {
LABEL_53:
    v99 = 2654435761 * self->_plLocationRangeStart;
    goto LABEL_57;
  }
LABEL_56:
  v99 = 0;
LABEL_57:
  v100 = objc_msgSend_hash(self->_plLocationStorageUUID, v91, v92, v93, v94);
  v105 = objc_msgSend_hash(self->_plUserData, v101, v102, v103, v104);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    locationModificationDate = self->_locationModificationDate;
    v108 = -locationModificationDate;
    if (locationModificationDate >= 0.0)
      v108 = self->_locationModificationDate;
    v109 = floor(v108 + 0.5);
    v110 = (v108 - v109) * 1.84467441e19;
    v111 = fmod(v109, 1.84467441e19);
    v112 = 2654435761u * (unint64_t)v111;
    v113 = v112 + (unint64_t)v110;
    if (v110 <= 0.0)
      v113 = 2654435761u * (unint64_t)v111;
    v106 = v112 - (unint64_t)fabs(v110);
    if (v110 >= 0.0)
      v106 = v113;
  }
  else
  {
    v106 = 0;
  }
  return v135 ^ v136 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v82 ^ v115 ^ v95 ^ v97 ^ v98 ^ v99 ^ v100 ^ v105 ^ v106;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BCAnnotationRange *selectedTextRange;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v4 = a3;
  self->_creationDate = *((double *)v4 + 1);
  v7 = *((_QWORD *)v4 + 9);
  v28 = v4;
  if (v7)
  {
    objc_msgSend_setCreatorIdentifier_(self, (const char *)v4, v7, v5, v6);
    v4 = v28;
  }
  v8 = *((_WORD *)v4 + 102);
  if ((v8 & 0x200) != 0)
  {
    self->_deleted = *((_BYTE *)v4 + 200);
    *(_WORD *)&self->_has |= 0x200u;
    v8 = *((_WORD *)v4 + 102);
  }
  if ((v8 & 0x400) != 0)
  {
    self->_isUnderline = *((_BYTE *)v4 + 201);
    *(_WORD *)&self->_has |= 0x400u;
  }
  v9 = *((_QWORD *)v4 + 12);
  if (v9)
  {
    objc_msgSend_setLocationCFIString_(self, (const char *)v4, v9, v5, v6);
    v4 = v28;
  }
  self->_modificationDate = *((double *)v4 + 3);
  v10 = *((_QWORD *)v4 + 13);
  if (v10)
  {
    objc_msgSend_setNote_(self, (const char *)v4, v10, v5, v6);
    v4 = v28;
  }
  v11 = *((_QWORD *)v4 + 20);
  if (v11)
  {
    objc_msgSend_setRepresentativeText_(self, (const char *)v4, v11, v5, v6);
    v4 = v28;
  }
  v12 = *((_QWORD *)v4 + 21);
  if (v12)
  {
    objc_msgSend_setSelectedText_(self, (const char *)v4, v12, v5, v6);
    v4 = v28;
  }
  v13 = *((_WORD *)v4 + 102);
  if ((v13 & 0x80) != 0)
  {
    self->_style = *((_DWORD *)v4 + 46);
    *(_WORD *)&self->_has |= 0x80u;
    v13 = *((_WORD *)v4 + 102);
  }
  if ((v13 & 0x100) != 0)
  {
    self->_type = *((_DWORD *)v4 + 47);
    *(_WORD *)&self->_has |= 0x100u;
  }
  v14 = *((_QWORD *)v4 + 24);
  if (v14)
  {
    objc_msgSend_setUuid_(self, (const char *)v4, v14, v5, v6);
    v4 = v28;
  }
  v15 = *((_QWORD *)v4 + 14);
  if (v15)
  {
    objc_msgSend_setPhysicalPageNumber_(self, (const char *)v4, v15, v5, v6);
    v4 = v28;
  }
  v16 = *((_QWORD *)v4 + 5);
  if (v16)
  {
    objc_msgSend_setAnnotationVersion_(self, (const char *)v4, v16, v5, v6);
    v4 = v28;
  }
  v17 = *((_QWORD *)v4 + 6);
  if (v17)
  {
    objc_msgSend_setAssetVersion_(self, (const char *)v4, v17, v5, v6);
    v4 = v28;
  }
  v18 = *((_QWORD *)v4 + 7);
  if (v18)
  {
    objc_msgSend_setAttachments_(self, (const char *)v4, v18, v5, v6);
    v4 = v28;
  }
  v19 = *((_QWORD *)v4 + 8);
  if (v19)
  {
    objc_msgSend_setChapterTitle_(self, (const char *)v4, v19, v5, v6);
    v4 = v28;
  }
  if ((*((_WORD *)v4 + 102) & 2) != 0)
  {
    self->_userModificationDate = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
  selectedTextRange = self->_selectedTextRange;
  v21 = *((_QWORD *)v4 + 22);
  if (selectedTextRange)
  {
    if (!v21)
      goto LABEL_39;
    objc_msgSend_mergeFrom_(selectedTextRange, (const char *)v4, v21, v5, v6);
  }
  else
  {
    if (!v21)
      goto LABEL_39;
    objc_msgSend_setSelectedTextRange_(self, (const char *)v4, v21, v5, v6);
  }
  v4 = v28;
LABEL_39:
  v22 = *((_WORD *)v4 + 102);
  if ((v22 & 0x40) != 0)
  {
    self->_readingProgressHighWaterMark = *((float *)v4 + 39);
    *(_WORD *)&self->_has |= 0x40u;
    v22 = *((_WORD *)v4 + 102);
    if ((v22 & 0x800) == 0)
    {
LABEL_41:
      if ((v22 & 0x20) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) == 0)
  {
    goto LABEL_41;
  }
  self->_spineIndexUpdated = *((_BYTE *)v4 + 202);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_42:
    self->_readingProgress = *((float *)v4 + 38);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_43:
  v23 = *((_QWORD *)v4 + 10);
  if (v23)
  {
    objc_msgSend_setFutureProofing11_(self, (const char *)v4, v23, v5, v6);
    v4 = v28;
  }
  v24 = *((_QWORD *)v4 + 11);
  if (v24)
  {
    objc_msgSend_setFutureProofing12_(self, (const char *)v4, v24, v5, v6);
    v4 = v28;
  }
  v25 = *((_WORD *)v4 + 102);
  if ((v25 & 4) != 0)
  {
    self->_plAbsolutePhysicalLocation = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 4u;
    v25 = *((_WORD *)v4 + 102);
    if ((v25 & 8) == 0)
    {
LABEL_49:
      if ((v25 & 0x10) == 0)
        goto LABEL_51;
      goto LABEL_50;
    }
  }
  else if ((v25 & 8) == 0)
  {
    goto LABEL_49;
  }
  self->_plLocationRangeEnd = *((_DWORD *)v4 + 31);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 102) & 0x10) != 0)
  {
LABEL_50:
    self->_plLocationRangeStart = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_51:
  v26 = *((_QWORD *)v4 + 17);
  if (v26)
  {
    objc_msgSend_setPlLocationStorageUUID_(self, (const char *)v4, v26, v5, v6);
    v4 = v28;
  }
  v27 = *((_QWORD *)v4 + 18);
  if (v27)
  {
    objc_msgSend_setPlUserData_(self, (const char *)v4, v27, v5, v6);
    v4 = v28;
  }
  if ((*((_WORD *)v4 + 102) & 1) != 0)
  {
    self->_locationModificationDate = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }

}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (NSString)creatorIdentifier
{
  return self->_creatorIdentifier;
}

- (void)setCreatorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_creatorIdentifier, a3);
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (BOOL)isUnderline
{
  return self->_isUnderline;
}

- (NSString)locationCFIString
{
  return self->_locationCFIString;
}

- (void)setLocationCFIString:(id)a3
{
  objc_storeStrong((id *)&self->_locationCFIString, a3);
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(double)a3
{
  self->_modificationDate = a3;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (NSString)representativeText
{
  return self->_representativeText;
}

- (void)setRepresentativeText:(id)a3
{
  objc_storeStrong((id *)&self->_representativeText, a3);
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_storeStrong((id *)&self->_selectedText, a3);
}

- (unsigned)style
{
  return self->_style;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)physicalPageNumber
{
  return self->_physicalPageNumber;
}

- (void)setPhysicalPageNumber:(id)a3
{
  objc_storeStrong((id *)&self->_physicalPageNumber, a3);
}

- (NSString)annotationVersion
{
  return self->_annotationVersion;
}

- (void)setAnnotationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_annotationVersion, a3);
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (NSString)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSString)chapterTitle
{
  return self->_chapterTitle;
}

- (void)setChapterTitle:(id)a3
{
  objc_storeStrong((id *)&self->_chapterTitle, a3);
}

- (double)userModificationDate
{
  return self->_userModificationDate;
}

- (BCAnnotationRange)selectedTextRange
{
  return self->_selectedTextRange;
}

- (void)setSelectedTextRange:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTextRange, a3);
}

- (float)readingProgressHighWaterMark
{
  return self->_readingProgressHighWaterMark;
}

- (BOOL)spineIndexUpdated
{
  return self->_spineIndexUpdated;
}

- (float)readingProgress
{
  return self->_readingProgress;
}

- (NSString)futureProofing11
{
  return self->_futureProofing11;
}

- (void)setFutureProofing11:(id)a3
{
  objc_storeStrong((id *)&self->_futureProofing11, a3);
}

- (NSString)futureProofing12
{
  return self->_futureProofing12;
}

- (void)setFutureProofing12:(id)a3
{
  objc_storeStrong((id *)&self->_futureProofing12, a3);
}

- (int)plAbsolutePhysicalLocation
{
  return self->_plAbsolutePhysicalLocation;
}

- (int)plLocationRangeEnd
{
  return self->_plLocationRangeEnd;
}

- (int)plLocationRangeStart
{
  return self->_plLocationRangeStart;
}

- (NSString)plLocationStorageUUID
{
  return self->_plLocationStorageUUID;
}

- (void)setPlLocationStorageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_plLocationStorageUUID, a3);
}

- (NSData)plUserData
{
  return self->_plUserData;
}

- (void)setPlUserData:(id)a3
{
  objc_storeStrong((id *)&self->_plUserData, a3);
}

- (double)locationModificationDate
{
  return self->_locationModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_selectedTextRange, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_representativeText, 0);
  objc_storeStrong((id *)&self->_plUserData, 0);
  objc_storeStrong((id *)&self->_plLocationStorageUUID, 0);
  objc_storeStrong((id *)&self->_physicalPageNumber, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_locationCFIString, 0);
  objc_storeStrong((id *)&self->_futureProofing12, 0);
  objc_storeStrong((id *)&self->_futureProofing11, 0);
  objc_storeStrong((id *)&self->_creatorIdentifier, 0);
  objc_storeStrong((id *)&self->_chapterTitle, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_annotationVersion, 0);
}

@end
