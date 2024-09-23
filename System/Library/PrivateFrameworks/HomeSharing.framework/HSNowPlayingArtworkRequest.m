@implementation HSNowPlayingArtworkRequest

- (HSNowPlayingArtworkRequest)initWithInterfaceID:(unsigned int)a3 maximumSize:(CGSize)a4 playQueueIndex:(unsigned int)a5
{
  uint64_t v5;
  double height;
  double width;
  void *v10;
  HSNowPlayingArtworkRequest *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/%u/%s"), "ctrl-int", *(_QWORD *)&a3, "nowplayingartwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HSNowPlayingArtworkRequest;
  v11 = -[HSRequest initWithAction:](&v18, sel_initWithAction_, v10);

  if (v11)
  {
    HIDWORD(v12) = 1048576000;
    if (width > 0.00000011920929 || height > 0.00000011920929)
    {
      LODWORD(v12) = vcvtpd_s64_f64(width);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HSRequest setValue:forArgument:](v11, "setValue:forArgument:", v13, CFSTR("mw"));

      LODWORD(v14) = vcvtpd_s64_f64(height);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HSRequest setValue:forArgument:](v11, "setValue:forArgument:", v15, CFSTR("mh"));

    }
    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HSRequest setValue:forArgument:](v11, "setValue:forArgument:", v16, CFSTR("index"));

    }
    v11->_interfaceID = a3;
    v11->_maximumSize.width = width;
    v11->_maximumSize.height = height;
    v11->_playQueueIndex = v5;
  }
  return v11;
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[HSResponse responseWithResponse:](HSNowPlayingArtworkResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "MIMEType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setArtworkMIMEType:", v5);

    objc_msgSend(v3, "responseData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setArtworkData:", v6);

  }
  return v3;
}

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)playQueueIndex
{
  return self->_playQueueIndex;
}

@end
