@implementation GKAppMetadata

- (GKAppMetadata)initWithBundleID:(id)a3 adamID:(id)a4 name:(id)a5 shortName:(id)a6 artwork:(id)a7 supportsArcade:(BOOL)a8 supportsGameController:(BOOL)a9 deviceFamilies:(id)a10 latestVersionReleaseDate:(id)a11 genreDisplayName:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  GKAppMetadata *v24;
  GKAppMetadata *v25;
  id obj;
  id v28;
  id v29;
  id v31;
  id v32;
  objc_super v33;

  v18 = a3;
  obj = a4;
  v19 = a4;
  v28 = a5;
  v20 = a5;
  v32 = a6;
  v29 = a7;
  v31 = a7;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v33.receiver = self;
  v33.super_class = (Class)GKAppMetadata;
  v24 = -[GKAppMetadata init](&v33, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_bundleID, a3);
    objc_storeStrong((id *)&v25->_adamID, obj);
    objc_storeStrong((id *)&v25->_name, v28);
    objc_storeStrong((id *)&v25->_shortName, a6);
    objc_storeStrong((id *)&v25->_artwork, v29);
    v25->_supportsArcade = a8;
    v25->_supportsGameController = a9;
    objc_storeStrong((id *)&v25->_deviceFamilies, a10);
    objc_storeStrong((id *)&v25->_latestVersionReleaseDate, a11);
    objc_storeStrong((id *)&v25->_genreDisplayName, a12);
  }

  return v25;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_59 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_59, &__block_literal_global_60_1);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_58;
}

void __40__GKAppMetadata_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[10];
  _QWORD v6[11];

  v6[10] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("bundleID");
  v6[0] = objc_opt_class();
  v5[1] = CFSTR("adamID");
  v6[1] = objc_opt_class();
  v5[2] = CFSTR("name");
  v6[2] = objc_opt_class();
  v5[3] = CFSTR("shortName");
  v6[3] = objc_opt_class();
  v5[4] = CFSTR("artwork");
  v6[4] = objc_opt_class();
  v5[5] = CFSTR("genreDisplayName");
  v6[5] = objc_opt_class();
  v5[6] = CFSTR("supportsArcade");
  v6[6] = objc_opt_class();
  v5[7] = CFSTR("supportsGameController");
  v6[7] = objc_opt_class();
  v5[8] = CFSTR("deviceFamilies");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[8] = v2;
  v5[9] = CFSTR("latestVersionReleaseDate");
  v6[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_58;
  secureCodedPropertyKeys_sSecureCodedKeys_58 = v3;

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (GKAppMetadataArtwork)artwork
{
  return self->_artwork;
}

- (BOOL)supportsArcade
{
  return self->_supportsArcade;
}

- (BOOL)supportsGameController
{
  return self->_supportsGameController;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (NSDate)latestVersionReleaseDate
{
  return self->_latestVersionReleaseDate;
}

- (NSString)genreDisplayName
{
  return self->_genreDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreDisplayName, 0);
  objc_storeStrong((id *)&self->_latestVersionReleaseDate, 0);
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
