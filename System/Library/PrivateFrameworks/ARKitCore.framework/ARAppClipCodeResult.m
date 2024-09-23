@implementation ARAppClipCodeResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  double v5;
  id v6;

  url = self->_url;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", CFSTR("codeToWorldVisionTransform"), *(double *)&self[1].super.isa, *(double *)&self[1]._url, *(double *)&self[1]._urlEncodingVersion, self[1]._size.height);
  *(float *)&v5 = self->_confidence;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("confidence"), v5);
  objc_msgSend(v6, "encodeBool:forKey:", self->_isScaleReliable, CFSTR("isScaleReliable"));
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_urlDecodingStateInternal, CFSTR("urlDecodingState"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_urlEncodingVersion, CFSTR("urlEncodingVersion"));

}

- (ARAppClipCodeResult)initWithCoder:(id)a3
{
  id v4;
  ARAppClipCodeResult *v5;
  uint64_t v6;
  NSURL *url;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  float v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARAppClipCodeResult;
  v5 = -[ARAppClipCodeResult init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("codeToWorldVisionTransform"));
    *(_OWORD *)&v5[1].super.isa = v8;
    *(_OWORD *)&v5[1]._url = v9;
    *(_OWORD *)&v5[1]._urlEncodingVersion = v10;
    *(_OWORD *)&v5[1]._size.height = v11;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidence"));
    v5->_confidence = v12;
    v5->_isScaleReliable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isScaleReliable"));
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
    v5->_size.width = v13;
    v5->_size.height = v14;
    v5->_urlDecodingStateInternal = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("urlDecodingState"));
    v5->_urlEncodingVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("urlEncodingVersion"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_url);
  v5 = *(_OWORD *)&self[1].super.isa;
  v6 = *(_OWORD *)&self[1]._url;
  v7 = *(_OWORD *)&self[1]._size.height;
  *(_OWORD *)(v4 + 96) = *(_OWORD *)&self[1]._urlEncodingVersion;
  *(_OWORD *)(v4 + 112) = v7;
  *(_OWORD *)(v4 + 64) = v5;
  *(_OWORD *)(v4 + 80) = v6;
  *(float *)(v4 + 12) = self->_confidence;
  *(_BYTE *)(v4 + 8) = self->_isScaleReliable;
  *(CGSize *)(v4 + 40) = self->_size;
  *(_QWORD *)(v4 + 24) = self->_urlDecodingStateInternal;
  *(_QWORD *)(v4 + 32) = self->_urlEncodingVersion;
  return (id)v4;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (__n128)codeToWorldVisionTransform
{
  return a1[4];
}

- (__n128)setCodeToWorldVisionTransform:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (BOOL)isScaleReliable
{
  return self->_isScaleReliable;
}

- (void)setIsScaleReliable:(BOOL)a3
{
  self->_isScaleReliable = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)urlDecodingStateInternal
{
  return self->_urlDecodingStateInternal;
}

- (void)setUrlDecodingStateInternal:(int64_t)a3
{
  self->_urlDecodingStateInternal = a3;
}

- (unint64_t)urlEncodingVersion
{
  return self->_urlEncodingVersion;
}

- (void)setUrlEncodingVersion:(unint64_t)a3
{
  self->_urlEncodingVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
