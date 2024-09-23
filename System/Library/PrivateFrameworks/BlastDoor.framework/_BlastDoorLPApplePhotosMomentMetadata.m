@implementation _BlastDoorLPApplePhotosMomentMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPApplePhotosMomentMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPApplePhotosMomentMetadata *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  _BlastDoorLPImage *keyPhoto;
  uint64_t v10;
  NSDate *expirationDate;
  uint64_t v12;
  NSDate *earliestAssetDate;
  uint64_t v14;
  NSDate *latestAssetDate;
  _BlastDoorLPApplePhotosMomentMetadata *v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BlastDoorLPApplePhotosMomentMetadata;
  v5 = -[_BlastDoorLPApplePhotosMomentMetadata init](&v18, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_photoCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoCount"));
    v5->_videoCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("videoCount"));
    v5->_otherItemCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("otherItemCount"));
    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("keyPhoto"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyPhoto = v5->_keyPhoto;
    v5->_keyPhoto = (_BlastDoorLPImage *)v8;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestAssetDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    earliestAssetDate = v5->_earliestAssetDate;
    v5->_earliestAssetDate = (NSDate *)v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestAssetDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    latestAssetDate = v5->_latestAssetDate;
    v5->_latestAssetDate = (NSDate *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_photoCount, CFSTR("photoCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_videoCount, CFSTR("videoCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_otherItemCount, CFSTR("otherItemCount"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_keyPhoto, CFSTR("keyPhoto"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_earliestAssetDate, CFSTR("earliestAssetDate"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_latestAssetDate, CFSTR("latestAssetDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPApplePhotosMomentMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BlastDoorLPApplePhotosMomentMetadata *v10;

  v4 = +[_BlastDoorLPApplePhotosMomentMetadata allocWithZone:](_BlastDoorLPApplePhotosMomentMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPApplePhotosMomentMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosMomentMetadata setTitle:](v4, "setTitle:", v5);

    -[_BlastDoorLPApplePhotosMomentMetadata setPhotoCount:](v4, "setPhotoCount:", -[_BlastDoorLPApplePhotosMomentMetadata photoCount](self, "photoCount"));
    -[_BlastDoorLPApplePhotosMomentMetadata setVideoCount:](v4, "setVideoCount:", -[_BlastDoorLPApplePhotosMomentMetadata videoCount](self, "videoCount"));
    -[_BlastDoorLPApplePhotosMomentMetadata setOtherItemCount:](v4, "setOtherItemCount:", -[_BlastDoorLPApplePhotosMomentMetadata otherItemCount](self, "otherItemCount"));
    -[_BlastDoorLPApplePhotosMomentMetadata keyPhoto](self, "keyPhoto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosMomentMetadata setKeyPhoto:](v4, "setKeyPhoto:", v6);

    -[_BlastDoorLPApplePhotosMomentMetadata expirationDate](self, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosMomentMetadata setExpirationDate:](v4, "setExpirationDate:", v7);

    -[_BlastDoorLPApplePhotosMomentMetadata earliestAssetDate](self, "earliestAssetDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosMomentMetadata setEarliestAssetDate:](v4, "setEarliestAssetDate:", v8);

    -[_BlastDoorLPApplePhotosMomentMetadata latestAssetDate](self, "latestAssetDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosMomentMetadata setLatestAssetDate:](v4, "setLatestAssetDate:", v9);

    v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPApplePhotosMomentMetadata;
  if (-[_BlastDoorLPApplePhotosMomentMetadata isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if ((!(v7 | (unint64_t)self->_title) || objc_msgSend((id)v7, "isEqual:"))
        && v6[3] == self->_photoCount
        && v6[4] == self->_videoCount
        && v6[5] == self->_otherItemCount
        && ((v8 = v6[6], !(v8 | (unint64_t)self->_keyPhoto)) || objc_msgSend((id)v8, "isEqual:"))
        && ((v9 = v6[7], !(v9 | (unint64_t)self->_expirationDate))
         || objc_msgSend((id)v9, "isEqual:"))
        && ((v10 = v6[8], !(v10 | (unint64_t)self->_earliestAssetDate))
         || objc_msgSend((id)v10, "isEqual:")))
      {
        v11 = v6[9];
        if (v11 | (unint64_t)self->_latestAssetDate)
          v5 = objc_msgSend((id)v11, "isEqual:");
        else
          v5 = 1;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("keyPhoto"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("photoCount"), CFSTR("videoCount"), CFSTR("otherItemCount"), CFSTR("keyPhoto"), CFSTR("expirationDate"), CFSTR("earliestAssetDate"), CFSTR("latestAssetDate"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)photoCount
{
  return self->_photoCount;
}

- (void)setPhotoCount:(unint64_t)a3
{
  self->_photoCount = a3;
}

- (unint64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(unint64_t)a3
{
  self->_videoCount = a3;
}

- (unint64_t)otherItemCount
{
  return self->_otherItemCount;
}

- (void)setOtherItemCount:(unint64_t)a3
{
  self->_otherItemCount = a3;
}

- (_BlastDoorLPImage)keyPhoto
{
  return self->_keyPhoto;
}

- (void)setKeyPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_keyPhoto, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)earliestAssetDate
{
  return self->_earliestAssetDate;
}

- (void)setEarliestAssetDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)latestAssetDate
{
  return self->_latestAssetDate;
}

- (void)setLatestAssetDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAssetDate, 0);
  objc_storeStrong((id *)&self->_earliestAssetDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keyPhoto, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
