@implementation LiveFSClientServiceSource

- (LiveFSClientServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4
{
  id v7;
  id v8;
  LiveFSClientServiceSource *v9;
  LiveFSClientServiceSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LiveFSClientServiceSource;
  v9 = -[LiveFSClientServiceSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->ex, a3);
    objc_storeStrong((id *)&v10->ident, a4);
  }

  return v10;
}

- (NSString)serviceName
{
  return (NSString *)CFSTR("com.apple.filesystems.LiveFSVolumeCore");
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  return -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnError:](self->ex, "makeVolumeListenerEndpointAndReturnError:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ident, 0);
  objc_storeStrong((id *)&self->ex, 0);
}

@end
