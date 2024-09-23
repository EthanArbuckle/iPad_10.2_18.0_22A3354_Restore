@implementation IMWallpaper_SwiftImpl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fileName
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_fileName);
}

- (NSString)filePath
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_filePath);
}

- (NSString)lowResFileName
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_lowResFileName);
}

- (NSString)lowResFilePath
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_lowResFilePath);
}

- (int64_t)dataVersion
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaper_SwiftImpl_dataVersion);
}

- (IMWallpaperMetadata)metadata
{
  return (IMWallpaperMetadata *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___IMWallpaper_SwiftImpl_metadata));
}

- (BOOL)contentIsSensitive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMWallpaper_SwiftImpl_contentIsSensitive);
}

- (IMWallpaper_SwiftImpl)initWithFileName:(id)a3 filePath:(id)a4 lowResFileName:(id)a5 lowResFilePath:(id)a6 metadata:(id)a7 contentIsSensitive:(BOOL)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v12 = (uint64_t)a4;
  if (a3)
  {
    v13 = sub_19E36F888();
    v15 = v14;
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v13 = 0;
    v15 = 0;
    if (a4)
    {
LABEL_3:
      v12 = sub_19E36F888();
      v17 = v16;
      if (a5)
        goto LABEL_4;
LABEL_8:
      v19 = 0;
      if (a6)
        goto LABEL_5;
LABEL_9:
      v21 = 0;
      return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:)(v13, v15, v12, v17, (uint64_t)a5, v19, (uint64_t)a6, v21, (uint64_t)a7, a8);
    }
  }
  v17 = 0;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  a5 = (id)sub_19E36F888();
  v19 = v18;
  if (!a6)
    goto LABEL_9;
LABEL_5:
  a6 = (id)sub_19E36F888();
  v21 = v20;
  return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:)(v13, v15, v12, v17, (uint64_t)a5, v19, (uint64_t)a6, v21, (uint64_t)a7, a8);
}

- (IMWallpaper_SwiftImpl)initWithFileName:(id)a3 filePath:(id)a4 data:(id)a5 lowResFileName:(id)a6 lowResFilePath:(id)a7 lowResData:(id)a8 metadata:(id)a9 contentIsSensitive:(BOOL)a10 error:(id *)a11
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t v42;

  if (a3)
  {
    v16 = sub_19E36F888();
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v41 = v17;
  v42 = v16;
  if (a4)
  {
    v18 = sub_19E36F888();
    v39 = v19;
    v40 = (id *)v18;
  }
  else
  {
    v39 = 0;
    v40 = 0;
  }
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  if (a5)
  {
    v24 = a5;
    v38 = sub_19E36F60C();
    v26 = v25;

    if (v20)
      goto LABEL_9;
  }
  else
  {
    v38 = 0;
    v26 = 0xF000000000000000;
    if (v20)
    {
LABEL_9:
      v27 = sub_19E36F888();
      v29 = v28;

      if (v21)
        goto LABEL_10;
LABEL_14:
      v30 = 0;
      v32 = 0;
      v33 = a10;
      if (v22)
        goto LABEL_11;
LABEL_15:
      v34 = 0;
      v36 = 0xF000000000000000;
      return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:)(v42, v41, v40, v39, v38, v26, v27, v29, v30, v32, v34, v36, a9, v33);
    }
  }
  v27 = 0;
  v29 = 0;
  if (!v21)
    goto LABEL_14;
LABEL_10:
  v30 = sub_19E36F888();
  v32 = v31;

  v33 = a10;
  if (!v22)
    goto LABEL_15;
LABEL_11:
  v34 = sub_19E36F60C();
  v36 = v35;

  return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:)(v42, v41, v40, v39, v38, v26, v27, v29, v30, v32, v34, v36, a9, v33);
}

- (IMWallpaper_SwiftImpl)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMWallpaper_SwiftImpl *)Wallpaper.init(dictionaryRepresentation:)(v3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  IMWallpaper_SwiftImpl *v5;

  v4 = a3;
  v5 = self;
  sub_19E35DD08(v4);

}

- (IMWallpaper_SwiftImpl)initWithCoder:(id)a3
{
  return (IMWallpaper_SwiftImpl *)Wallpaper.init(coder:)(a3);
}

- (BOOL)wallpaperExists
{
  IMWallpaper_SwiftImpl *v2;
  char v3;

  v2 = self;
  v3 = sub_19E35E508();

  return v3 & 1;
}

- (BOOL)lowResWallpaperExists
{
  IMWallpaper_SwiftImpl *v2;
  char v3;

  v2 = self;
  v3 = sub_19E35E544();

  return v3 & 1;
}

- (id)fetchWallpaperDataAndReturnError:(id *)a3
{
  return sub_19E35E768((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___IMWallpaper_SwiftImpl_filePath);
}

- (id)fetchLowResWallpaperDataAndReturnError:(id *)a3
{
  return sub_19E35E768((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___IMWallpaper_SwiftImpl_lowResFilePath);
}

- (BOOL)isEqual:(id)a3
{
  IMWallpaper_SwiftImpl *v4;
  IMWallpaper_SwiftImpl *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_19E35E8F4((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (NSDictionary)publicDictionaryRepresentation
{
  return (NSDictionary *)sub_19E35EE4C(self, (uint64_t)a2, (void (*)(void))sub_19E35EBC4);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)sub_19E35EE4C(self, (uint64_t)a2, (void (*)(void))sub_19E35EEB0);
}

- (IMWallpaper_SwiftImpl)init
{
  IMWallpaper_SwiftImpl *result;

  result = (IMWallpaper_SwiftImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
