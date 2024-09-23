@implementation DYCaptureSessionInfo

+ (unsigned)graphicsAPIOfCaptureStore:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392C0]);
  if (v3)
    LODWORD(v3) = objc_msgSend(v3, "unsignedIntValue");
  return v3;
}

+ (id)symbolicatorSignatureFromCaptureStore:(id)a3
{
  return (id)objc_msgSend(a3, "copyAdjunctDataForFilename:error:", CFSTR("(cs-sig)"), 0);
}

+ (int)platformOfCaptureStore:(id)a3
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", CFSTR("(device info)"), 0), "decodeArchivedObject"), "platform");
}

- (DYCaptureSessionInfo)init
{
  -[DYCaptureSessionInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYCaptureSessionInfo)initWithCaptureStore:(id)a3
{
  DYCaptureSessionInfo *v4;
  void *v5;
  char *v6;
  NSString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  DYDeviceInfo *deviceInfo;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DYCaptureSessionInfo;
  v4 = -[DYCaptureSessionInfo init](&v16, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392B0]);
    if (!v5)
      v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", CFSTR("kDYCaptureArchiveCaptureSessionInfoMetadataKey")), "objectForKey:", CFSTR("kDysonCapturedFrameCountKey"));
    v4->_launchDictionary = (NSDictionary *)(id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392D8]);
    v4->_configurationDictionary = (NSDictionary *)(id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392B8]);
    v4->_capturedFramesCount = objc_msgSend(v5, "unsignedIntegerValue");
    v4->_guestAppWasLinkedOnApexOrLater = objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392E0]), "BOOLValue");
    v4->_guestAppInfoPlist = (NSDictionary *)(id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392E8]);
    v4->_libraryLinkTimeVersions = (NSDictionary *)(id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392F0]);
    v4->_graphicsApi = +[DYCaptureSessionInfo graphicsAPIOfCaptureStore:](DYCaptureSessionInfo, "graphicsAPIOfCaptureStore:", a3);
    v6 = (char *)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392C8]);
    if (v6)
    {
      v4->_version.version = objc_msgSend(v6, "intValue");
      v7 = (NSString *)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392D0]);
      v4->_patchVersion = v7;
      v6 = -[NSString UTF8String](v7, "UTF8String");
    }
    else
    {
      v4->_version.version = 0;
    }
    v4->_version.patch = v6;
    v4->_interposerVersion = &v4->_version;
    v8 = (void *)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392F8]);
    if (v8)
      v9 = objc_msgSend(v8, "unsignedIntValue");
    else
      v9 = +[DYDeviceInfo defaultNativePointerSize](DYDeviceInfo, "defaultNativePointerSize");
    v4->_nativePointerSize = v9;
    v10 = (void *)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE392A8]);
    if (v10)
      v4->_isBoundaryLess = objc_msgSend(v10, "BOOLValue");
    if (objc_msgSend(a3, "resolveFilename:error:", CFSTR("(control device info)"), 0))
      v4->_controlDeviceInfo = (DYDeviceInfo *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", CFSTR("(control device info)"), 0), "decodeArchivedObject");
    if (objc_msgSend(a3, "resolveFilename:error:", CFSTR("is_almond"), 0))
      v4->_isAlmond = 1;
    v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", CFSTR("(queue/thread labels)"), 0), "decodeArchivedObject");
    v4->_queueLabels = (NSDictionary *)(id)objc_msgSend(v11, "objectForKey:", CFSTR("queues"));
    v4->_threadLabels = (NSDictionary *)(id)objc_msgSend(v11, "objectForKey:", CFSTR("threads"));
    if (!objc_msgSend(a3, "resolveFilename:error:", CFSTR("(device info)"), 0))
    {
      v4->_deviceInfo = objc_alloc_init(DYDeviceInfo);
      v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", CFSTR("kDYCaptureArchiveCaptureSessionInfoMetadataKey")), "objectForKey:", CFSTR("kDYPArchiveType"));
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("kDYEmbeddedArchiveType")))
      {
        deviceInfo = v4->_deviceInfo;
        v14 = 2;
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("kDYDesktopArchiveType")))
          return v4;
        deviceInfo = v4->_deviceInfo;
        v14 = 1;
      }
      -[DYDeviceInfo setPlatform:](deviceInfo, "setPlatform:", v14);
      return v4;
    }
    v4->_deviceInfo = (DYDeviceInfo *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", CFSTR("(device info)"), 0), "decodeArchivedObject");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYCaptureSessionInfo;
  -[DYCaptureSessionInfo dealloc](&v3, sel_dealloc);
}

- (NSString)guestAppTitle
{
  return (NSString *)-[NSDictionary objectForKey:](self->_launchDictionary, "objectForKey:", *MEMORY[0x24BE39450]);
}

- (NSString)guestAppBundleIdentifier
{
  return (NSString *)-[NSDictionary objectForKey:](self->_launchDictionary, "objectForKey:", *MEMORY[0x24BE39418]);
}

- (NSString)guestAppPath
{
  return (NSString *)-[NSDictionary objectForKey:](self->_launchDictionary, "objectForKey:", *MEMORY[0x24BE39440]);
}

- (NSString)guestAppCurrentDirectory
{
  return (NSString *)-[NSDictionary objectForKey:](self->_launchDictionary, "objectForKey:", *MEMORY[0x24BE39428]);
}

- (NSArray)guestAppArguments
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_launchDictionary, "objectForKey:", *MEMORY[0x24BE39410]);
}

- (NSDictionary)guestAppEnvironment
{
  return (NSDictionary *)-[NSDictionary objectForKey:](self->_launchDictionary, "objectForKey:", *MEMORY[0x24BE39438]);
}

- (unsigned)triggerFrame
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("TriggerFrame")), "unsignedIntValue");
}

- (unsigned)frameLimit
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("FrameLimit")), "unsignedIntValue");
}

- (BOOL)triggerOnNextGraphicsCommand
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("TriggerOnNextGLCommand")), "BOOLValue");
}

- (BOOL)harvestStateAtEnd
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("HarvestStateAtEnd")), "BOOLValue");
}

- (BOOL)suspendAfterCompletion
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("SuspendAfterCompletion")), "BOOLValue");
}

- (BOOL)lockGraphicsAfterCompletion
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("LockOpenGLAfterCompletion")), "BOOLValue");
}

- (int)linkTimeVersionForLibrary:(id)a3
{
  id v3;

  v3 = -[NSDictionary objectForKey:](self->_libraryLinkTimeVersions, "objectForKey:", a3);
  if (v3)
    return objc_msgSend(v3, "intValue");
  else
    return -1;
}

- (id)labelForQueueID:(unint64_t)a3
{
  return -[NSDictionary objectForKey:](self->_queueLabels, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3));
}

- (id)labelForThreadID:(unint64_t)a3
{
  return -[NSDictionary objectForKey:](self->_threadLabels, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3));
}

- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5 withBlock:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL4 v11;

  v7 = a5;
  v8 = a4;
  if (objc_msgSend((id)objc_msgSend(a3, "supportedGraphicsAPIInfos"), "count"))
  {
    if (((*((uint64_t (**)(id))a6 + 2))(a6) & 1) == 0)
    {
      LOBYTE(v11) = 0;
      return v11;
    }
LABEL_6:
    LOBYTE(v11) = 1;
    return v11;
  }
  if (!v8)
    goto LABEL_6;
  v11 = -[DYCaptureSessionInfo _isBackwardsCompatible:isInternal:](self, "_isBackwardsCompatible:isInternal:", a3, v7);
  if (v11)
    goto LABEL_6;
  return v11;
}

- (BOOL)_isBackwardsCompatible:(id)a3 isInternal:(BOOL)a4
{
  DYDeviceInfo *deviceInfo;

  deviceInfo = self->_deviceInfo;
  return objc_msgSend((id)objc_msgSend(a3, "version"), "compare:options:", -[DYDeviceInfo version](deviceInfo, "version"), 64) != -1&& objc_msgSend((id)objc_msgSend(a3, "build"), "compare:options:", -[DYDeviceInfo build](deviceInfo, "build"), 64) != -1;
}

- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5
{
  -[DYCaptureSessionInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (DYDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (DYDeviceInfo)controlDeviceInfo
{
  return self->_controlDeviceInfo;
}

- (DYInterposeVersion)interposerVersion
{
  return self->_interposerVersion;
}

- (void)setInterposerVersion:(DYInterposeVersion *)a3
{
  self->_interposerVersion = a3;
}

- (unsigned)nativePointerSize
{
  return self->_nativePointerSize;
}

- (BOOL)isAlmond
{
  return self->_isAlmond;
}

- (unint64_t)capturedFramesCount
{
  return self->_capturedFramesCount;
}

- (BOOL)guestAppWasLinkedOnApexOrLater
{
  return self->_guestAppWasLinkedOnApexOrLater;
}

- (NSDictionary)guestAppInfoPlist
{
  return self->_guestAppInfoPlist;
}

- (NSDictionary)launchDictionary
{
  return self->_launchDictionary;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (unsigned)isBoundaryLess
{
  return self->_isBoundaryLess;
}

- (unsigned)graphicsApi
{
  return self->_graphicsApi;
}

@end
