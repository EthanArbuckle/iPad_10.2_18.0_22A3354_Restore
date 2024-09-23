@implementation GTReplayFetchTexture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayFetchTexture)initWithCoder:(id)a3
{
  id v4;
  GTReplayFetchTexture *v5;
  GTReplayFetchTexture *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayFetchTexture;
  v5 = -[GTReplayRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_plane = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("plane"));
    v5->_slice = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("slice"));
    v5->_level = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("level"));
    v5->_depth = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("depth"));
    v5->_size.width = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size.width"));
    v5->_size.height = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size.height"));
    v5->_size.depth = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size.depth"));
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, CFSTR("dispatchUID"));
    v5->_resolveMultisampleTexture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resolveMultisampleTexture"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayFetchTexture;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_plane, CFSTR("plane"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_slice, CFSTR("slice"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_level, CFSTR("level"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_depth, CFSTR("depth"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_size.width, CFSTR("size.width"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_size.height, CFSTR("size.height"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_size.depth, CFSTR("size.depth"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_resolveMultisampleTexture, CFSTR("resolveMultisampleTexture"));
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, CFSTR("dispatchUID"));

}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (unsigned)plane
{
  return self->_plane;
}

- (void)setPlane:(unsigned int)a3
{
  self->_plane = a3;
}

- (unsigned)slice
{
  return self->_slice;
}

- (void)setSlice:(unsigned int)a3
{
  self->_slice = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (unsigned)depth
{
  return self->_depth;
}

- (void)setDepth:(unsigned int)a3
{
  self->_depth = a3;
}

- (GTSize)size
{
  *retstr = *(GTSize *)((char *)self + 56);
  return self;
}

- (void)setSize:(GTSize *)a3
{
  unint64_t depth;

  depth = a3->depth;
  *(_OWORD *)&self->_size.width = *(_OWORD *)&a3->width;
  self->_size.depth = depth;
}

- (GTRegion)region
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].origin.x;
  *(_OWORD *)&retstr->origin.x = *(_OWORD *)&self[1].size.height;
  *(_OWORD *)&retstr->origin.z = v3;
  *(_OWORD *)&retstr->size.height = *(_OWORD *)&self[2].origin.z;
  return self;
}

- (void)setRegion:(GTRegion *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->origin.z;
  v3 = *(_OWORD *)&a3->size.height;
  *(_OWORD *)&self->_region.origin.x = *(_OWORD *)&a3->origin.x;
  *(_OWORD *)&self->_region.origin.z = v4;
  *(_OWORD *)&self->_region.size.height = v3;
}

- (BOOL)resolveMultisampleTexture
{
  return self->_resolveMultisampleTexture;
}

- (void)setResolveMultisampleTexture:(BOOL)a3
{
  self->_resolveMultisampleTexture = a3;
}

@end
