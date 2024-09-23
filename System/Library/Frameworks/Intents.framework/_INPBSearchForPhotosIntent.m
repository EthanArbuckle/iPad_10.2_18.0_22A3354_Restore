@implementation _INPBSearchForPhotosIntent

- (void)setActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
}

- (BOOL)hasActivities
{
  return self->_activities != 0;
}

- (void)setAlbumName:(id)a3
{
  objc_storeStrong((id *)&self->_albumName, a3);
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (BOOL)hasEvents
{
  return self->_events != 0;
}

- (void)setExcludedAttributes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)excludedAttributes
{
  return self->_excludedAttributes.list;
}

- (void)clearExcludedAttributes
{
  PBRepeatedInt32Clear();
}

- (void)addExcludedAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)excludedAttributesCount
{
  return self->_excludedAttributes.count;
}

- (int)excludedAttributeAtIndex:(unint64_t)a3
{
  return self->_excludedAttributes.list[a3];
}

- (id)excludedAttributesAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 49)
  {
    v3 = CFSTR("PHOTO");
    switch(a3)
    {
      case 2:
        goto LABEL_5;
      case 3:
        result = CFSTR("VIDEO");
        break;
      case 4:
        result = CFSTR("GIF");
        break;
      case 10:
        result = CFSTR("FLASH");
        break;
      case 11:
        result = CFSTR("LANDSCAPE_ORIENTATION");
        break;
      case 12:
        result = CFSTR("PORTRAIT_ORIENTATION");
        break;
      case 13:
        result = CFSTR("FAVORITE");
        break;
      case 14:
        result = CFSTR("SELFIE");
        break;
      case 15:
        result = CFSTR("FRONT_FACING_CAMERA");
        break;
      case 16:
        result = CFSTR("SCREENSHOT");
        break;
      default:
LABEL_38:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
        result = v3;
        break;
    }
  }
  else if (a3 > 80)
  {
    switch(a3)
    {
      case 300:
        result = CFSTR("NOIR_FILTER");
        break;
      case 301:
        result = CFSTR("CHROME_FILTER");
        break;
      case 302:
        result = CFSTR("INSTANT_FILTER");
        break;
      case 303:
        result = CFSTR("TONAL_FILTER");
        break;
      case 304:
        result = CFSTR("TRANSFER_FILTER");
        break;
      case 305:
        result = CFSTR("MONO_FILTER");
        break;
      case 306:
        result = CFSTR("FADE_FILTER");
        break;
      case 307:
        result = CFSTR("PROCESS_FILTER");
        break;
      default:
        if (a3 != 81)
          goto LABEL_38;
        result = CFSTR("SLOW_MOTION_VIDEO");
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '2':
        v3 = CFSTR("BURST_PHOTO");
        goto LABEL_5;
      case '3':
        result = CFSTR("HDR_PHOTO");
        break;
      case '4':
        result = CFSTR("SQUARE_PHOTO");
        break;
      case '5':
        result = CFSTR("PANORAMA_PHOTO");
        break;
      case '6':
        result = CFSTR("PORTRAIT_PHOTO");
        break;
      case '7':
        result = CFSTR("LIVE_PHOTO");
        break;
      case '8':
        result = CFSTR("LOOP_PHOTO");
        break;
      case '9':
        result = CFSTR("BOUNCE_PHOTO");
        break;
      case ':':
        result = CFSTR("LONG_EXPOSURE_PHOTO");
        break;
      default:
        if (a3 != 80)
          goto LABEL_38;
        result = CFSTR("TIME_LAPSE_VIDEO");
        break;
    }
  }
  return result;
}

- (int)StringAsExcludedAttributes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GIF")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLASH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANDSCAPE_ORIENTATION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PORTRAIT_ORIENTATION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SELFIE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRONT_FACING_CAMERA")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCREENSHOT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BURST_PHOTO")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HDR_PHOTO")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SQUARE_PHOTO")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PANORAMA_PHOTO")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_LAPSE_VIDEO")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLOW_MOTION_VIDEO")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOIR_FILTER")) & 1) != 0)
  {
    v4 = 300;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHROME_FILTER")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTANT_FILTER")) & 1) != 0)
  {
    v4 = 302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TONAL_FILTER")) & 1) != 0)
  {
    v4 = 303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSFER_FILTER")) & 1) != 0)
  {
    v4 = 304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONO_FILTER")) & 1) != 0)
  {
    v4 = 305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FADE_FILTER")) & 1) != 0)
  {
    v4 = 306;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROCESS_FILTER")) & 1) != 0)
  {
    v4 = 307;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PORTRAIT_PHOTO")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIVE_PHOTO")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOP_PHOTO")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOUNCE_PHOTO")) & 1) != 0)
  {
    v4 = 57;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LONG_EXPOSURE_PHOTO")))
  {
    v4 = 58;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setGeographicalFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_geographicalFeatures, a3);
}

- (BOOL)hasGeographicalFeatures
{
  return self->_geographicalFeatures != 0;
}

- (void)setIncludedAttributes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)includedAttributes
{
  return self->_includedAttributes.list;
}

- (void)clearIncludedAttributes
{
  PBRepeatedInt32Clear();
}

- (void)addIncludedAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)includedAttributesCount
{
  return self->_includedAttributes.count;
}

- (int)includedAttributeAtIndex:(unint64_t)a3
{
  return self->_includedAttributes.list[a3];
}

- (id)includedAttributesAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 49)
  {
    v3 = CFSTR("PHOTO");
    switch(a3)
    {
      case 2:
        goto LABEL_5;
      case 3:
        result = CFSTR("VIDEO");
        break;
      case 4:
        result = CFSTR("GIF");
        break;
      case 10:
        result = CFSTR("FLASH");
        break;
      case 11:
        result = CFSTR("LANDSCAPE_ORIENTATION");
        break;
      case 12:
        result = CFSTR("PORTRAIT_ORIENTATION");
        break;
      case 13:
        result = CFSTR("FAVORITE");
        break;
      case 14:
        result = CFSTR("SELFIE");
        break;
      case 15:
        result = CFSTR("FRONT_FACING_CAMERA");
        break;
      case 16:
        result = CFSTR("SCREENSHOT");
        break;
      default:
LABEL_38:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
        result = v3;
        break;
    }
  }
  else if (a3 > 80)
  {
    switch(a3)
    {
      case 300:
        result = CFSTR("NOIR_FILTER");
        break;
      case 301:
        result = CFSTR("CHROME_FILTER");
        break;
      case 302:
        result = CFSTR("INSTANT_FILTER");
        break;
      case 303:
        result = CFSTR("TONAL_FILTER");
        break;
      case 304:
        result = CFSTR("TRANSFER_FILTER");
        break;
      case 305:
        result = CFSTR("MONO_FILTER");
        break;
      case 306:
        result = CFSTR("FADE_FILTER");
        break;
      case 307:
        result = CFSTR("PROCESS_FILTER");
        break;
      default:
        if (a3 != 81)
          goto LABEL_38;
        result = CFSTR("SLOW_MOTION_VIDEO");
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '2':
        v3 = CFSTR("BURST_PHOTO");
        goto LABEL_5;
      case '3':
        result = CFSTR("HDR_PHOTO");
        break;
      case '4':
        result = CFSTR("SQUARE_PHOTO");
        break;
      case '5':
        result = CFSTR("PANORAMA_PHOTO");
        break;
      case '6':
        result = CFSTR("PORTRAIT_PHOTO");
        break;
      case '7':
        result = CFSTR("LIVE_PHOTO");
        break;
      case '8':
        result = CFSTR("LOOP_PHOTO");
        break;
      case '9':
        result = CFSTR("BOUNCE_PHOTO");
        break;
      case ':':
        result = CFSTR("LONG_EXPOSURE_PHOTO");
        break;
      default:
        if (a3 != 80)
          goto LABEL_38;
        result = CFSTR("TIME_LAPSE_VIDEO");
        break;
    }
  }
  return result;
}

- (int)StringAsIncludedAttributes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GIF")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLASH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANDSCAPE_ORIENTATION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PORTRAIT_ORIENTATION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SELFIE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRONT_FACING_CAMERA")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCREENSHOT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BURST_PHOTO")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HDR_PHOTO")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SQUARE_PHOTO")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PANORAMA_PHOTO")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_LAPSE_VIDEO")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLOW_MOTION_VIDEO")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOIR_FILTER")) & 1) != 0)
  {
    v4 = 300;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHROME_FILTER")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTANT_FILTER")) & 1) != 0)
  {
    v4 = 302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TONAL_FILTER")) & 1) != 0)
  {
    v4 = 303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSFER_FILTER")) & 1) != 0)
  {
    v4 = 304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONO_FILTER")) & 1) != 0)
  {
    v4 = 305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FADE_FILTER")) & 1) != 0)
  {
    v4 = 306;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROCESS_FILTER")) & 1) != 0)
  {
    v4 = 307;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PORTRAIT_PHOTO")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIVE_PHOTO")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOP_PHOTO")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOUNCE_PHOTO")) & 1) != 0)
  {
    v4 = 57;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LONG_EXPOSURE_PHOTO")))
  {
    v4 = 58;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setLocationCreated:(id)a3
{
  objc_storeStrong((id *)&self->_locationCreated, a3);
}

- (BOOL)hasLocationCreated
{
  return self->_locationCreated != 0;
}

- (void)setMemoryName:(id)a3
{
  objc_storeStrong((id *)&self->_memoryName, a3);
}

- (BOOL)hasMemoryName
{
  return self->_memoryName != 0;
}

- (void)setPeopleInPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_peopleInPhoto, a3);
}

- (BOOL)hasPeopleInPhoto
{
  return self->_peopleInPhoto != 0;
}

- (void)setPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_places, a3);
}

- (BOOL)hasPlaces
{
  return self->_places != 0;
}

- (void)setSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerm, a3);
}

- (BOOL)hasSearchTerm
{
  return self->_searchTerm != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForPhotosIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  -[_INPBSearchForPhotosIntent activities](self, "activities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSearchForPhotosIntent activities](self, "activities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent albumName](self, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSearchForPhotosIntent albumName](self, "albumName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent dateCreated](self, "dateCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSearchForPhotosIntent dateCreated](self, "dateCreated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent events](self, "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBSearchForPhotosIntent events](self, "events");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (self->_excludedAttributes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_excludedAttributes.count);
  }
  -[_INPBSearchForPhotosIntent geographicalFeatures](self, "geographicalFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBSearchForPhotosIntent geographicalFeatures](self, "geographicalFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (self->_includedAttributes.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v15;
    }
    while (v15 < self->_includedAttributes.count);
  }
  -[_INPBSearchForPhotosIntent intentMetadata](self, "intentMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBSearchForPhotosIntent intentMetadata](self, "intentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent locationCreated](self, "locationCreated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_INPBSearchForPhotosIntent locationCreated](self, "locationCreated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent memoryName](self, "memoryName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_INPBSearchForPhotosIntent memoryName](self, "memoryName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent peopleInPhoto](self, "peopleInPhoto");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_INPBSearchForPhotosIntent peopleInPhoto](self, "peopleInPhoto");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent places](self, "places");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_INPBSearchForPhotosIntent places](self, "places");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForPhotosIntent searchTerm](self, "searchTerm");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_INPBSearchForPhotosIntent searchTerm](self, "searchTerm");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_INPBSearchForPhotosIntent clearExcludedAttributes](self, "clearExcludedAttributes");
  -[_INPBSearchForPhotosIntent clearIncludedAttributes](self, "clearIncludedAttributes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchForPhotosIntent;
  -[_INPBSearchForPhotosIntent dealloc](&v3, sel_dealloc);
}

- (_INPBSearchForPhotosIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForPhotosIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForPhotosIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForPhotosIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForPhotosIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSearchForPhotosIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForPhotosIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = -[_INPBSearchForPhotosIntent init](+[_INPBSearchForPhotosIntent allocWithZone:](_INPBSearchForPhotosIntent, "allocWithZone:"), "init");
  v6 = -[_INPBActivityList copyWithZone:](self->_activities, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setActivities:](v5, "setActivities:", v6);

  v7 = -[_INPBString copyWithZone:](self->_albumName, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setAlbumName:](v5, "setAlbumName:", v7);

  v8 = -[_INPBDateTimeRange copyWithZone:](self->_dateCreated, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setDateCreated:](v5, "setDateCreated:", v8);

  v9 = -[_INPBEventList copyWithZone:](self->_events, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setEvents:](v5, "setEvents:", v9);

  PBRepeatedInt32Copy();
  v10 = -[_INPBGeographicalFeatureList copyWithZone:](self->_geographicalFeatures, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setGeographicalFeatures:](v5, "setGeographicalFeatures:", v10);

  PBRepeatedInt32Copy();
  v11 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setIntentMetadata:](v5, "setIntentMetadata:", v11);

  v12 = -[_INPBLocation copyWithZone:](self->_locationCreated, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setLocationCreated:](v5, "setLocationCreated:", v12);

  v13 = -[_INPBString copyWithZone:](self->_memoryName, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setMemoryName:](v5, "setMemoryName:", v13);

  v14 = -[_INPBContactList copyWithZone:](self->_peopleInPhoto, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setPeopleInPhoto:](v5, "setPeopleInPhoto:", v14);

  v15 = -[_INPBPlaceList copyWithZone:](self->_places, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setPlaces:](v5, "setPlaces:", v15);

  v16 = -[_INPBStringList copyWithZone:](self->_searchTerm, "copyWithZone:", a3);
  -[_INPBSearchForPhotosIntent setSearchTerm:](v5, "setSearchTerm:", v16);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  BOOL v62;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_59;
  -[_INPBSearchForPhotosIntent activities](self, "activities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent activities](self, "activities");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForPhotosIntent activities](self, "activities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent albumName](self, "albumName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent albumName](self, "albumName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSearchForPhotosIntent albumName](self, "albumName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent dateCreated](self, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent dateCreated](self, "dateCreated");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSearchForPhotosIntent dateCreated](self, "dateCreated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateCreated");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent events](self, "events");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBSearchForPhotosIntent events](self, "events");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "events");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_59;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_59;
  -[_INPBSearchForPhotosIntent geographicalFeatures](self, "geographicalFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geographicalFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent geographicalFeatures](self, "geographicalFeatures");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBSearchForPhotosIntent geographicalFeatures](self, "geographicalFeatures");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geographicalFeatures");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_59;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_59;
  -[_INPBSearchForPhotosIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent intentMetadata](self, "intentMetadata");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBSearchForPhotosIntent intentMetadata](self, "intentMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent locationCreated](self, "locationCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent locationCreated](self, "locationCreated");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBSearchForPhotosIntent locationCreated](self, "locationCreated");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationCreated");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent memoryName](self, "memoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "memoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent memoryName](self, "memoryName");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBSearchForPhotosIntent memoryName](self, "memoryName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memoryName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent peopleInPhoto](self, "peopleInPhoto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peopleInPhoto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent peopleInPhoto](self, "peopleInPhoto");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBSearchForPhotosIntent peopleInPhoto](self, "peopleInPhoto");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peopleInPhoto");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent places](self, "places");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "places");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_58;
  -[_INPBSearchForPhotosIntent places](self, "places");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBSearchForPhotosIntent places](self, "places");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "places");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSearchForPhotosIntent searchTerm](self, "searchTerm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTerm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_58:

    goto LABEL_59;
  }
  -[_INPBSearchForPhotosIntent searchTerm](self, "searchTerm");
  v57 = objc_claimAutoreleasedReturnValue();
  if (!v57)
  {

LABEL_62:
    v62 = 1;
    goto LABEL_60;
  }
  v58 = (void *)v57;
  -[_INPBSearchForPhotosIntent searchTerm](self, "searchTerm");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTerm");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v59, "isEqual:", v60);

  if ((v61 & 1) != 0)
    goto LABEL_62;
LABEL_59:
  v62 = 0;
LABEL_60:

  return v62;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v3 = -[_INPBActivityList hash](self->_activities, "hash");
  v4 = -[_INPBString hash](self->_albumName, "hash") ^ v3;
  v5 = -[_INPBDateTimeRange hash](self->_dateCreated, "hash");
  v6 = v4 ^ v5 ^ -[_INPBEventList hash](self->_events, "hash");
  v7 = PBRepeatedInt32Hash();
  v8 = v7 ^ -[_INPBGeographicalFeatureList hash](self->_geographicalFeatures, "hash");
  v9 = v6 ^ v8 ^ PBRepeatedInt32Hash();
  v10 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v11 = v10 ^ -[_INPBLocation hash](self->_locationCreated, "hash");
  v12 = v11 ^ -[_INPBString hash](self->_memoryName, "hash");
  v13 = v9 ^ v12 ^ -[_INPBContactList hash](self->_peopleInPhoto, "hash");
  v14 = -[_INPBPlaceList hash](self->_places, "hash");
  return v13 ^ v14 ^ -[_INPBStringList hash](self->_searchTerm, "hash");
}

- (id)dictionaryRepresentation
{
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
  unint64_t v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSearchForPhotosIntent activities](self, "activities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activities"));

  -[_INPBSearchForPhotosIntent albumName](self, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("albumName"));

  -[_INPBSearchForPhotosIntent dateCreated](self, "dateCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dateCreated"));

  -[_INPBSearchForPhotosIntent events](self, "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("events"));

  if (self->_excludedAttributes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSearchForPhotosIntent excludedAttributesCount](self, "excludedAttributesCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSearchForPhotosIntent excludedAttributesCount](self, "excludedAttributesCount"))
    {
      v13 = 0;
      do
      {
        v14 = self->_excludedAttributes.list[v13];
        if (v14 <= 49)
        {
          v15 = CFSTR("PHOTO");
          switch(v14)
          {
            case 2:
              break;
            case 3:
              v15 = CFSTR("VIDEO");
              break;
            case 4:
              v15 = CFSTR("GIF");
              break;
            case 10:
              v15 = CFSTR("FLASH");
              break;
            case 11:
              v15 = CFSTR("LANDSCAPE_ORIENTATION");
              break;
            case 12:
              v15 = CFSTR("PORTRAIT_ORIENTATION");
              break;
            case 13:
              v15 = CFSTR("FAVORITE");
              break;
            case 14:
              v15 = CFSTR("SELFIE");
              break;
            case 15:
              v15 = CFSTR("FRONT_FACING_CAMERA");
              break;
            case 16:
              v15 = CFSTR("SCREENSHOT");
              break;
            default:
LABEL_39:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_excludedAttributes.list[v13]);
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else if (v14 > 80)
        {
          switch(v14)
          {
            case 300:
              v15 = CFSTR("NOIR_FILTER");
              break;
            case 301:
              v15 = CFSTR("CHROME_FILTER");
              break;
            case 302:
              v15 = CFSTR("INSTANT_FILTER");
              break;
            case 303:
              v15 = CFSTR("TONAL_FILTER");
              break;
            case 304:
              v15 = CFSTR("TRANSFER_FILTER");
              break;
            case 305:
              v15 = CFSTR("MONO_FILTER");
              break;
            case 306:
              v15 = CFSTR("FADE_FILTER");
              break;
            case 307:
              v15 = CFSTR("PROCESS_FILTER");
              break;
            default:
              if (v14 != 81)
                goto LABEL_39;
              v15 = CFSTR("SLOW_MOTION_VIDEO");
              break;
          }
        }
        else
        {
          switch(v14)
          {
            case '2':
              v15 = CFSTR("BURST_PHOTO");
              break;
            case '3':
              v15 = CFSTR("HDR_PHOTO");
              break;
            case '4':
              v15 = CFSTR("SQUARE_PHOTO");
              break;
            case '5':
              v15 = CFSTR("PANORAMA_PHOTO");
              break;
            case '6':
              v15 = CFSTR("PORTRAIT_PHOTO");
              break;
            case '7':
              v15 = CFSTR("LIVE_PHOTO");
              break;
            case '8':
              v15 = CFSTR("LOOP_PHOTO");
              break;
            case '9':
              v15 = CFSTR("BOUNCE_PHOTO");
              break;
            case ':':
              v15 = CFSTR("LONG_EXPOSURE_PHOTO");
              break;
            default:
              if (v14 != 80)
                goto LABEL_39;
              v15 = CFSTR("TIME_LAPSE_VIDEO");
              break;
          }
        }
        objc_msgSend(v12, "addObject:", v15);

        ++v13;
      }
      while (v13 < -[_INPBSearchForPhotosIntent excludedAttributesCount](self, "excludedAttributesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("excludedAttribute"));

  }
  -[_INPBSearchForPhotosIntent geographicalFeatures](self, "geographicalFeatures");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("geographicalFeatures"));

  if (self->_includedAttributes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSearchForPhotosIntent includedAttributesCount](self, "includedAttributesCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSearchForPhotosIntent includedAttributesCount](self, "includedAttributesCount"))
    {
      v19 = 0;
      do
      {
        v20 = self->_includedAttributes.list[v19];
        if (v20 <= 49)
        {
          v21 = CFSTR("PHOTO");
          switch(v20)
          {
            case 2:
              break;
            case 3:
              v21 = CFSTR("VIDEO");
              break;
            case 4:
              v21 = CFSTR("GIF");
              break;
            case 10:
              v21 = CFSTR("FLASH");
              break;
            case 11:
              v21 = CFSTR("LANDSCAPE_ORIENTATION");
              break;
            case 12:
              v21 = CFSTR("PORTRAIT_ORIENTATION");
              break;
            case 13:
              v21 = CFSTR("FAVORITE");
              break;
            case 14:
              v21 = CFSTR("SELFIE");
              break;
            case 15:
              v21 = CFSTR("FRONT_FACING_CAMERA");
              break;
            case 16:
              v21 = CFSTR("SCREENSHOT");
              break;
            default:
LABEL_80:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_includedAttributes.list[v19]);
              v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else if (v20 > 80)
        {
          switch(v20)
          {
            case 300:
              v21 = CFSTR("NOIR_FILTER");
              break;
            case 301:
              v21 = CFSTR("CHROME_FILTER");
              break;
            case 302:
              v21 = CFSTR("INSTANT_FILTER");
              break;
            case 303:
              v21 = CFSTR("TONAL_FILTER");
              break;
            case 304:
              v21 = CFSTR("TRANSFER_FILTER");
              break;
            case 305:
              v21 = CFSTR("MONO_FILTER");
              break;
            case 306:
              v21 = CFSTR("FADE_FILTER");
              break;
            case 307:
              v21 = CFSTR("PROCESS_FILTER");
              break;
            default:
              if (v20 != 81)
                goto LABEL_80;
              v21 = CFSTR("SLOW_MOTION_VIDEO");
              break;
          }
        }
        else
        {
          switch(v20)
          {
            case '2':
              v21 = CFSTR("BURST_PHOTO");
              break;
            case '3':
              v21 = CFSTR("HDR_PHOTO");
              break;
            case '4':
              v21 = CFSTR("SQUARE_PHOTO");
              break;
            case '5':
              v21 = CFSTR("PANORAMA_PHOTO");
              break;
            case '6':
              v21 = CFSTR("PORTRAIT_PHOTO");
              break;
            case '7':
              v21 = CFSTR("LIVE_PHOTO");
              break;
            case '8':
              v21 = CFSTR("LOOP_PHOTO");
              break;
            case '9':
              v21 = CFSTR("BOUNCE_PHOTO");
              break;
            case ':':
              v21 = CFSTR("LONG_EXPOSURE_PHOTO");
              break;
            default:
              if (v20 != 80)
                goto LABEL_80;
              v21 = CFSTR("TIME_LAPSE_VIDEO");
              break;
          }
        }
        objc_msgSend(v18, "addObject:", v21);

        ++v19;
      }
      while (v19 < -[_INPBSearchForPhotosIntent includedAttributesCount](self, "includedAttributesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("includedAttribute"));

  }
  -[_INPBSearchForPhotosIntent intentMetadata](self, "intentMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("intentMetadata"));

  -[_INPBSearchForPhotosIntent locationCreated](self, "locationCreated");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("locationCreated"));

  -[_INPBSearchForPhotosIntent memoryName](self, "memoryName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("memoryName"));

  -[_INPBSearchForPhotosIntent peopleInPhoto](self, "peopleInPhoto");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("peopleInPhoto"));

  -[_INPBSearchForPhotosIntent places](self, "places");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("places"));

  -[_INPBSearchForPhotosIntent searchTerm](self, "searchTerm");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dictionaryRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("searchTerm"));

  return v3;
}

- (_INPBActivityList)activities
{
  return self->_activities;
}

- (_INPBString)albumName
{
  return self->_albumName;
}

- (_INPBDateTimeRange)dateCreated
{
  return self->_dateCreated;
}

- (_INPBEventList)events
{
  return self->_events;
}

- (_INPBGeographicalFeatureList)geographicalFeatures
{
  return self->_geographicalFeatures;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBLocation)locationCreated
{
  return self->_locationCreated;
}

- (_INPBString)memoryName
{
  return self->_memoryName;
}

- (_INPBContactList)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (_INPBPlaceList)places
{
  return self->_places;
}

- (_INPBStringList)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_memoryName, 0);
  objc_storeStrong((id *)&self->_locationCreated, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_geographicalFeatures, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
