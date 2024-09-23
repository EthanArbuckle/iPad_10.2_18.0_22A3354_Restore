@implementation _INPBStartPhotoPlaybackIntent

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

- (void)setPeopleInPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_peopleInPhoto, a3);
}

- (BOOL)hasPeopleInPhoto
{
  return self->_peopleInPhoto != 0;
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
  return _INPBStartPhotoPlaybackIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[_INPBStartPhotoPlaybackIntent albumName](self, "albumName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBStartPhotoPlaybackIntent albumName](self, "albumName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartPhotoPlaybackIntent dateCreated](self, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBStartPhotoPlaybackIntent dateCreated](self, "dateCreated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (self->_excludedAttributes.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_excludedAttributes.count);
  }
  if (self->_includedAttributes.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_includedAttributes.count);
  }
  -[_INPBStartPhotoPlaybackIntent intentMetadata](self, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBStartPhotoPlaybackIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartPhotoPlaybackIntent locationCreated](self, "locationCreated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBStartPhotoPlaybackIntent locationCreated](self, "locationCreated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartPhotoPlaybackIntent peopleInPhoto](self, "peopleInPhoto");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBStartPhotoPlaybackIntent peopleInPhoto](self, "peopleInPhoto");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartPhotoPlaybackIntent searchTerm](self, "searchTerm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBStartPhotoPlaybackIntent searchTerm](self, "searchTerm");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_INPBStartPhotoPlaybackIntent clearExcludedAttributes](self, "clearExcludedAttributes");
  -[_INPBStartPhotoPlaybackIntent clearIncludedAttributes](self, "clearIncludedAttributes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBStartPhotoPlaybackIntent;
  -[_INPBStartPhotoPlaybackIntent dealloc](&v3, sel_dealloc);
}

- (_INPBStartPhotoPlaybackIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartPhotoPlaybackIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartPhotoPlaybackIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartPhotoPlaybackIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartPhotoPlaybackIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartPhotoPlaybackIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartPhotoPlaybackIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = -[_INPBStartPhotoPlaybackIntent init](+[_INPBStartPhotoPlaybackIntent allocWithZone:](_INPBStartPhotoPlaybackIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_albumName, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntent setAlbumName:](v5, "setAlbumName:", v6);

  v7 = -[_INPBDateTimeRange copyWithZone:](self->_dateCreated, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntent setDateCreated:](v5, "setDateCreated:", v7);

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = -[_INPBLocation copyWithZone:](self->_locationCreated, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntent setLocationCreated:](v5, "setLocationCreated:", v9);

  v10 = -[_INPBContactList copyWithZone:](self->_peopleInPhoto, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntent setPeopleInPhoto:](v5, "setPeopleInPhoto:", v10);

  v11 = -[_INPBStringList copyWithZone:](self->_searchTerm, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntent setSearchTerm:](v5, "setSearchTerm:", v11);

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
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[_INPBStartPhotoPlaybackIntent albumName](self, "albumName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBStartPhotoPlaybackIntent albumName](self, "albumName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBStartPhotoPlaybackIntent albumName](self, "albumName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  -[_INPBStartPhotoPlaybackIntent dateCreated](self, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBStartPhotoPlaybackIntent dateCreated](self, "dateCreated");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBStartPhotoPlaybackIntent dateCreated](self, "dateCreated");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateCreated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_34;
  -[_INPBStartPhotoPlaybackIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBStartPhotoPlaybackIntent intentMetadata](self, "intentMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBStartPhotoPlaybackIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_34;
  }
  else
  {

  }
  -[_INPBStartPhotoPlaybackIntent locationCreated](self, "locationCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBStartPhotoPlaybackIntent locationCreated](self, "locationCreated");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBStartPhotoPlaybackIntent locationCreated](self, "locationCreated");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationCreated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_34;
  }
  else
  {

  }
  -[_INPBStartPhotoPlaybackIntent peopleInPhoto](self, "peopleInPhoto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peopleInPhoto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBStartPhotoPlaybackIntent peopleInPhoto](self, "peopleInPhoto");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBStartPhotoPlaybackIntent peopleInPhoto](self, "peopleInPhoto");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peopleInPhoto");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_34;
  }
  else
  {

  }
  -[_INPBStartPhotoPlaybackIntent searchTerm](self, "searchTerm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTerm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBStartPhotoPlaybackIntent searchTerm](self, "searchTerm");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_37:
      v37 = 1;
      goto LABEL_35;
    }
    v33 = (void *)v32;
    -[_INPBStartPhotoPlaybackIntent searchTerm](self, "searchTerm");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchTerm");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
LABEL_33:

  }
LABEL_34:
  v37 = 0;
LABEL_35:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[_INPBString hash](self->_albumName, "hash");
  v4 = -[_INPBDateTimeRange hash](self->_dateCreated, "hash") ^ v3;
  v5 = PBRepeatedInt32Hash();
  v6 = v5 ^ PBRepeatedInt32Hash();
  v7 = v4 ^ v6 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v8 = -[_INPBLocation hash](self->_locationCreated, "hash");
  v9 = v8 ^ -[_INPBContactList hash](self->_peopleInPhoto, "hash");
  return v7 ^ v9 ^ -[_INPBStringList hash](self->_searchTerm, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  __CFString *v11;
  void *v12;
  unint64_t v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBStartPhotoPlaybackIntent albumName](self, "albumName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("albumName"));

  -[_INPBStartPhotoPlaybackIntent dateCreated](self, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dateCreated"));

  if (self->_excludedAttributes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBStartPhotoPlaybackIntent excludedAttributesCount](self, "excludedAttributesCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBStartPhotoPlaybackIntent excludedAttributesCount](self, "excludedAttributesCount"))
    {
      v9 = 0;
      do
      {
        v10 = self->_excludedAttributes.list[v9];
        if (v10 <= 49)
        {
          v11 = CFSTR("PHOTO");
          switch(v10)
          {
            case 2:
              break;
            case 3:
              v11 = CFSTR("VIDEO");
              break;
            case 4:
              v11 = CFSTR("GIF");
              break;
            case 10:
              v11 = CFSTR("FLASH");
              break;
            case 11:
              v11 = CFSTR("LANDSCAPE_ORIENTATION");
              break;
            case 12:
              v11 = CFSTR("PORTRAIT_ORIENTATION");
              break;
            case 13:
              v11 = CFSTR("FAVORITE");
              break;
            case 14:
              v11 = CFSTR("SELFIE");
              break;
            case 15:
              v11 = CFSTR("FRONT_FACING_CAMERA");
              break;
            case 16:
              v11 = CFSTR("SCREENSHOT");
              break;
            default:
LABEL_39:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_excludedAttributes.list[v9]);
              v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else if (v10 > 80)
        {
          switch(v10)
          {
            case 300:
              v11 = CFSTR("NOIR_FILTER");
              break;
            case 301:
              v11 = CFSTR("CHROME_FILTER");
              break;
            case 302:
              v11 = CFSTR("INSTANT_FILTER");
              break;
            case 303:
              v11 = CFSTR("TONAL_FILTER");
              break;
            case 304:
              v11 = CFSTR("TRANSFER_FILTER");
              break;
            case 305:
              v11 = CFSTR("MONO_FILTER");
              break;
            case 306:
              v11 = CFSTR("FADE_FILTER");
              break;
            case 307:
              v11 = CFSTR("PROCESS_FILTER");
              break;
            default:
              if (v10 != 81)
                goto LABEL_39;
              v11 = CFSTR("SLOW_MOTION_VIDEO");
              break;
          }
        }
        else
        {
          switch(v10)
          {
            case '2':
              v11 = CFSTR("BURST_PHOTO");
              break;
            case '3':
              v11 = CFSTR("HDR_PHOTO");
              break;
            case '4':
              v11 = CFSTR("SQUARE_PHOTO");
              break;
            case '5':
              v11 = CFSTR("PANORAMA_PHOTO");
              break;
            case '6':
              v11 = CFSTR("PORTRAIT_PHOTO");
              break;
            case '7':
              v11 = CFSTR("LIVE_PHOTO");
              break;
            case '8':
              v11 = CFSTR("LOOP_PHOTO");
              break;
            case '9':
              v11 = CFSTR("BOUNCE_PHOTO");
              break;
            case ':':
              v11 = CFSTR("LONG_EXPOSURE_PHOTO");
              break;
            default:
              if (v10 != 80)
                goto LABEL_39;
              v11 = CFSTR("TIME_LAPSE_VIDEO");
              break;
          }
        }
        objc_msgSend(v8, "addObject:", v11);

        ++v9;
      }
      while (v9 < -[_INPBStartPhotoPlaybackIntent excludedAttributesCount](self, "excludedAttributesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("excludedAttribute"));

  }
  if (self->_includedAttributes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBStartPhotoPlaybackIntent includedAttributesCount](self, "includedAttributesCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBStartPhotoPlaybackIntent includedAttributesCount](self, "includedAttributesCount"))
    {
      v13 = 0;
      do
      {
        v14 = self->_includedAttributes.list[v13];
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
LABEL_80:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_includedAttributes.list[v13]);
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
                goto LABEL_80;
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
                goto LABEL_80;
              v15 = CFSTR("TIME_LAPSE_VIDEO");
              break;
          }
        }
        objc_msgSend(v12, "addObject:", v15);

        ++v13;
      }
      while (v13 < -[_INPBStartPhotoPlaybackIntent includedAttributesCount](self, "includedAttributesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("includedAttribute"));

  }
  -[_INPBStartPhotoPlaybackIntent intentMetadata](self, "intentMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("intentMetadata"));

  -[_INPBStartPhotoPlaybackIntent locationCreated](self, "locationCreated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("locationCreated"));

  -[_INPBStartPhotoPlaybackIntent peopleInPhoto](self, "peopleInPhoto");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("peopleInPhoto"));

  -[_INPBStartPhotoPlaybackIntent searchTerm](self, "searchTerm");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("searchTerm"));

  return v3;
}

- (_INPBString)albumName
{
  return self->_albumName;
}

- (_INPBDateTimeRange)dateCreated
{
  return self->_dateCreated;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBLocation)locationCreated
{
  return self->_locationCreated;
}

- (_INPBContactList)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (_INPBStringList)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_locationCreated, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
