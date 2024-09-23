@implementation _ATXModePosterCandidate

- (_ATXModePosterCandidate)initWithDescriptor:(id)a3 fontName:(id)a4 isPreferredForGallery:(BOOL)a5
{
  id v9;
  id v10;
  _ATXModePosterCandidate *v11;
  _ATXModePosterCandidate *v12;
  uint64_t v13;
  NSString *fontName;
  _ATXModePosterCandidate *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_ATXModePosterCandidate;
  v11 = -[_ATXModePosterCandidate init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_descriptor, a3);
    v13 = objc_msgSend(v10, "copy");
    fontName = v12->_fontName;
    v12->_fontName = (NSString *)v13;

    v12->_isPreferredForGallery = a5;
    v15 = v12;
  }

  return v12;
}

- (ATXPosterDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (BOOL)isPreferredForGallery
{
  return self->_isPreferredForGallery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
