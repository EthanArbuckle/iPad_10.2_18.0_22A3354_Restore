@implementation MIStoreMetadata

- (NSNumber)hasOrEverHasHadIAP
{
  return self->_hasOrEverHasHadIAP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_distributorInfo, 0);
  objc_storeStrong((id *)&self->_hasOrEverHasHadIAP, 0);
  objc_storeStrong((id *)&self->_protectedMetadata, 0);
  objc_storeStrong((id *)&self->_md5, 0);
  objc_storeStrong((id *)&self->_nameTranscriptions, 0);
  objc_storeStrong((id *)&self->_redownloadParams, 0);
  objc_storeStrong((id *)&self->_enterpriseInstallURL, 0);
  objc_storeStrong((id *)&self->_referrerApp, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_subGenres, 0);
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_betaBuildGroupID, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_sourceApp, 0);
  objc_storeStrong((id *)&self->_softwareVersionExternalIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareVersionBundleID, 0);
  objc_storeStrong((id *)&self->_assetToken, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_ratingRank, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_shortItemName, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_purchaserID, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloaderID, 0);
  objc_storeStrong((id *)&self->_DSPersonID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_bundleShortVersionString, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_betaExternalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_iAdImpressionDate, 0);
  objc_storeStrong((id *)&self->_iAdConversionDate, 0);
  objc_storeStrong((id *)&self->_iAdAttribution, 0);
}

- (MIStoreMetadata)initWithDictionary:(id)a3
{
  id v4;
  MIStoreMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  MIStoreMetadataSubGenre *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  MIStoreMetadataDistributor *v94;
  MIStoreMetadataDistributor *distributorInfo;
  void *v96;
  MIStoreMetadata *v97;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  MIStoreMetadata *v110;
  id v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MIStoreMetadata init](self, "init");

  if (!v5)
    goto LABEL_406;
  objc_msgSend(v4, "objectForKeyedSubscript:", iAdAttribution);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIAdAttribution:](v5, "setIAdAttribution:", v6);
  }
  else if (v6 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = iAdAttribution;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", iAdConversionDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIAdConversionDate:](v5, "setIAdConversionDate:", v7);
  }
  else if (v7 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = iAdConversionDate;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", iAdImpressionDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIAdImpressionDate:](v5, "setIAdImpressionDate:", v8);
  }
  else if (v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = iAdImpressionDate;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", artistName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setArtistName:](v5, "setArtistName:", v9);
  }
  else if (v9 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = artistName;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", betaExternalVersionIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBetaExternalVersionIdentifier:](v5, "setBetaExternalVersionIdentifier:", v10);
  }
  else if (v10 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = betaExternalVersionIdentifier;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", bundleVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBundleVersion:](v5, "setBundleVersion:", v11);
  }
  else if (v11 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = bundleVersion;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", bundleShortVersionString);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBundleShortVersionString:](v5, "setBundleShortVersionString:", v12);
  }
  else if (v12 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = bundleShortVersionString;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", downloadInfoDict);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  if (v15)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", purchaseDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadata setPurchaseDate:](v5, "setPurchaseDate:", v16);
    }
    else if (v16 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v99 = purchaseDate;
      MOLogWrite();
    }

    objc_msgSend(v14, "objectForKeyedSubscript:", accountInfoDict);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v18 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    if (v19)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", appleID);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setAppleID:](v5, "setAppleID:", v20);
      }
      else if (v20 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v99 = appleID;
        MOLogWrite();
      }

      objc_msgSend(v18, "objectForKeyedSubscript:", DSPersonID);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setDSPersonID:](v5, "setDSPersonID:", v21);
      }
      else if (v21 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v99 = DSPersonID;
        MOLogWrite();
      }

      objc_msgSend(v18, "objectForKeyedSubscript:", downloaderID);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setDownloaderID:](v5, "setDownloaderID:", v22);
      }
      else if (v22 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v99 = downloaderID;
        MOLogWrite();
      }

      objc_msgSend(v18, "objectForKeyedSubscript:", familyID);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setFamilyID:](v5, "setFamilyID:", v23);
      }
      else if (v23 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v99 = familyID;
        MOLogWrite();
      }

      objc_msgSend(v18, "objectForKeyedSubscript:", purchaserID);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setPurchaserID:](v5, "setPurchaserID:", v24);
      }
      else if (v24 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v99 = purchaserID;
        MOLogWrite();
      }

      objc_msgSend(v18, "objectForKeyedSubscript:", altDSID);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setAltDSID:](v5, "setAltDSID:", v25);
      }
      else if (v25 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v99 = altDSID;
        MOLogWrite();
      }

    }
    else if (v18 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v99 = accountInfoDict;
      v105 = downloadInfoDict;
      MOLogWrite();
    }

  }
  else if (v14 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v99 = downloadInfoDict;
    MOLogWrite();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", hasMessagesExtension, v99, v105);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setHasMessagesExtension:](v5, "setHasMessagesExtension:", objc_msgSend(v26, "BOOLValue"));
  }
  else if (v26 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = hasMessagesExtension;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", initialODRSize);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setInitialODRSize:](v5, "setInitialODRSize:", v27);
  }
  else if (v27 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = initialODRSize;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", purchasedRedownload);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setPurchasedRedownload:](v5, "setPurchasedRedownload:", objc_msgSend(v28, "BOOLValue"));
  }
  else if (v28 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = purchasedRedownload;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", itemID);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setItemID:](v5, "setItemID:", v29);
  }
  else if (v29 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = itemID;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", itemName);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setItemName:](v5, "setItemName:", v30);
  }
  else if (v30 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = itemName;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", shortItemName);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setShortItemName:](v5, "setShortItemName:", v31);
  }
  else if (v31 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = shortItemName;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", kind);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setKind:](v5, "setKind:", v32);
  }
  else if (v32 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = kind;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", label);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setLabel:](v5, "setLabel:", v33);
  }
  else if (v33 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = label;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", launchProhibited);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setLaunchProhibited:](v5, "setLaunchProhibited:", objc_msgSend(v34, "BOOLValue"));
  }
  else if (v34 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = launchProhibited;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", ratingDict);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v36 = v35;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v37 = v36;
  else
    v37 = 0;

  if (v37)
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", ratingLabel);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadata setRatingLabel:](v5, "setRatingLabel:", v38);
    }
    else if (v38 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v100 = ratingLabel;
      MOLogWrite();
    }

    objc_msgSend(v36, "objectForKeyedSubscript:", ratingRank);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadata setRatingRank:](v5, "setRatingRank:", v39);
    }
    else if (v39 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v100 = ratingRank;
      MOLogWrite();
    }

  }
  else if (v36 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v100 = ratingDict;
    MOLogWrite();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", releaseDate, v100);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setReleaseDate:](v5, "setReleaseDate:", v40);
  }
  else if (v40 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = releaseDate;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", softwareVersionBundleID);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSoftwareVersionBundleID:](v5, "setSoftwareVersionBundleID:", v41);
  }
  else if (v41 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = softwareVersionBundleID;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", softwareVersionExternalIdentifier);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSoftwareVersionExternalIdentifier:](v5, "setSoftwareVersionExternalIdentifier:", v42);
  }
  else if (v42 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = softwareVersionExternalIdentifier;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", sourceApp);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSourceApp:](v5, "setSourceApp:", v43);
  }
  else if (v43 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = sourceApp;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", storeCohort);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setStoreCohort:](v5, "setStoreCohort:", v44);
  }
  else if (v44 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = storeCohort;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", storefront);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setStorefront:](v5, "setStorefront:", v45);
  }
  else if (v45 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = storefront;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", storefrontCountryCode);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setStorefrontCountryCode:](v5, "setStorefrontCountryCode:", v46);
  }
  else if (v46 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = storefrontCountryCode;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", assetToken);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setAssetToken:](v5, "setAssetToken:", v47);
  }
  else if (v47 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = assetToken;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", variantID);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setVariantID:](v5, "setVariantID:", v48);
  }
  else if (v48 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = variantID;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", betaBuildGroupID);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBetaBuildGroupID:](v5, "setBetaBuildGroupID:", v49);
  }
  else if (v49 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = betaBuildGroupID;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", genre);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGenre:](v5, "setGenre:", v50);
  }
  else if (v50 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = genre;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", genreID);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGenreID:](v5, "setGenreID:", v51);
  }
  else if (v51 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v101 = genreID;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", subGenres);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subgenre"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  v53 = v52;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v54 = v53;
  else
    v54 = 0;

  if (v54)
  {
    v108 = v36;
    v109 = v14;
    v110 = v5;
    v111 = v4;
    v112 = (void *)objc_opt_new();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v55 = v53;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v114;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v114 != v58)
            objc_enumerationMutation(v55);
          v60 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
          objc_opt_class();
          v61 = v60;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v62 = v61;
          else
            v62 = 0;

          if (v62)
          {
            objc_msgSend(v61, "objectForKeyedSubscript:", genre);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v64 = v63;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v65 = v64;
            else
              v65 = 0;

            objc_msgSend(v61, "objectForKeyedSubscript:", genreID);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v67 = v66;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v68 = v67;
            else
              v68 = 0;

            if (v65 && v68)
            {
              v69 = -[MIStoreMetadataSubGenre initWithGenre:genreID:]([MIStoreMetadataSubGenre alloc], "initWithGenre:genreID:", v65, v68);
              if (v69)
              {
                objc_msgSend(v112, "addObject:", v69);
              }
              else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
                MOLogWrite();
              }

            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v106 = genreID;
              v107 = v61;
              v101 = genre;
              MOLogWrite();
            }

          }
          else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v101 = (uint64_t)v61;
            MOLogWrite();
          }
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
      }
      while (v57);
    }

    v5 = v110;
    if (objc_msgSend(v112, "count"))
    {
      v70 = (void *)objc_msgSend(v112, "copy");
      -[MIStoreMetadata setSubGenres:](v110, "setSubGenres:", v70);

    }
    v4 = v111;
    v36 = v108;
    v14 = v109;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", categories, v101, v106, v107);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    objc_opt_class();
    v72 = v71;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = v72;

      objc_opt_class();
      v74 = MIArrayContainsOnlyClass(v73);

      if (v74)
      {
        -[MIStoreMetadata setCategories:](v5, "setCategories:", v73);
        goto LABEL_300;
      }
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v102 = v72;
      MOLogWrite();
    }
  }
LABEL_300:
  objc_msgSend(v4, "objectForKeyedSubscript:", gameCenterEnabled, v102);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGameCenterEnabled:](v5, "setGameCenterEnabled:", objc_msgSend(v75, "BOOLValue"));
  }
  else if (v75 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = gameCenterEnabled;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", gameCenterEverEnabled);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGameCenterEverEnabled:](v5, "setGameCenterEverEnabled:", objc_msgSend(v76, "BOOLValue"));
  }
  else if (v76 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = gameCenterEverEnabled;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", isAutoDownload);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIsAutoDownload:](v5, "setIsAutoDownload:", objc_msgSend(v77, "BOOLValue"));
  }
  else if (v77 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = isAutoDownload;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", referrerURL);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setReferrerURL:](v5, "setReferrerURL:", v78);
  }
  else if (v78 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = referrerURL;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", referrerApp);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setReferrerApp:](v5, "setReferrerApp:", v79);
  }
  else if (v79 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = referrerApp;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", sideLoadedDeviceBasedVPP);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSideLoadedDeviceBasedVPP:](v5, "setSideLoadedDeviceBasedVPP:", objc_msgSend(v80, "BOOLValue"));
  }
  else if (v80 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = sideLoadedDeviceBasedVPP;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", deviceBasedVPP);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setDeviceBasedVPP:](v5, "setDeviceBasedVPP:", objc_msgSend(v81, "BOOLValue"));
  }
  else if (v81 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = deviceBasedVPP;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", isB2BCustomApp);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIsB2BCustomApp:](v5, "setIsB2BCustomApp:", objc_msgSend(v82, "BOOLValue"));
  }
  else if (v82 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = isB2BCustomApp;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", enterpriseInstallURL);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setEnterpriseInstallURL:](v5, "setEnterpriseInstallURL:", v83);
  }
  else if (v83 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = enterpriseInstallURL;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", redownloadParams);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setRedownloadParams:](v5, "setRedownloadParams:", v84);
  }
  else if (v84 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = redownloadParams;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", factoryInstall);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setFactoryInstall:](v5, "setFactoryInstall:", objc_msgSend(v85, "BOOLValue"));
  }
  else if (v85 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = factoryInstall;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", md5);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setMd5:](v5, "setMd5:", v86);
  }
  else if (v86 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = md5;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", protectedMetadata);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setProtectedMetadata:](v5, "setProtectedMetadata:", v87);
  }
  else if (v87 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = protectedMetadata;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", hasOrEverHasHadIAP);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setHasOrEverHasHadIAP:](v5, "setHasOrEverHasHadIAP:", v88);
  }
  else if (v88 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v103 = hasOrEverHasHadIAP;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", nameTranscriptions);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v89;
  if (v89)
  {
    if (_IsDictionaryWithKeyStringAndValueArrayOfString(v89))
    {
      -[MIStoreMetadata setNameTranscriptions:](v5, "setNameTranscriptions:", v90);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", ::distributorInfo, v103);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v92 = v91;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v93 = v92;
  else
    v93 = 0;

  if (v93)
  {
    v94 = -[MIStoreMetadataDistributor initWithDictionary:]([MIStoreMetadataDistributor alloc], "initWithDictionary:", v92);
    distributorInfo = v5->_distributorInfo;
    v5->_distributorInfo = v94;

  }
  else if (v92 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v104 = v92;
    MOLogWrite();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", managementDeclarationIdentifier, v104);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setManagementDeclarationIdentifier:](v5, "setManagementDeclarationIdentifier:", v96);
  }
  else if (v96 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MOLogWrite();
  }

LABEL_406:
  v97 = v5;

  return v97;
}

- (void)setRatingRank:(id)a3
{
  objc_storeStrong((id *)&self->_ratingRank, a3);
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setStorefrontCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setStorefront:(id)a3
{
  objc_storeStrong((id *)&self->_storefront, a3);
}

- (void)setStoreCohort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setSourceApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setSoftwareVersionExternalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_softwareVersionExternalIdentifier, a3);
}

- (void)setSoftwareVersionBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setSideLoadedDeviceBasedVPP:(BOOL)a3
{
  self->_sideLoadedDeviceBasedVPP = a3;
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setRedownloadParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setRatingLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setPurchaserID:(id)a3
{
  objc_storeStrong((id *)&self->_purchaserID, a3);
}

- (void)setPurchasedRedownload:(BOOL)a3
{
  self->_purchasedRedownload = a3;
}

- (void)setPurchaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (void)setIsB2BCustomApp:(BOOL)a3
{
  self->_isB2BCustomApp = a3;
}

- (void)setIsAutoDownload:(BOOL)a3
{
  self->_isAutoDownload = a3;
}

- (void)setIAdAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasOrEverHasHadIAP:(id)a3
{
  objc_storeStrong((id *)&self->_hasOrEverHasHadIAP, a3);
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (void)setGenreID:(id)a3
{
  objc_storeStrong((id *)&self->_genreID, a3);
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setGameCenterEverEnabled:(BOOL)a3
{
  self->_gameCenterEverEnabled = a3;
}

- (void)setGameCenterEnabled:(BOOL)a3
{
  self->_gameCenterEnabled = a3;
}

- (void)setFamilyID:(id)a3
{
  objc_storeStrong((id *)&self->_familyID, a3);
}

- (void)setFactoryInstall:(BOOL)a3
{
  self->_factoryInstall = a3;
}

- (void)setDownloaderID:(id)a3
{
  objc_storeStrong((id *)&self->_downloaderID, a3);
}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  self->_deviceBasedVPP = a3;
}

- (void)setDSPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_DSPersonID, a3);
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setBundleShortVersionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

+ (id)metadataFromPlistAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  id v14;

  v5 = a3;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 3, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    v13 = v7;
    objc_msgSend((id)objc_opt_class(), "metadataFromPlistData:error:", v6, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
  }
  else
  {
    objc_msgSend(v5, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[MIStoreMetadata metadataFromPlistAtURL:error:]", 934, CFSTR("MIInstallerErrorDomain"), 78, v7, &unk_1E6CD4798, CFSTR("Failed to read iTunesMetadata.plist from %@"), v11, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v7 = (id)v10;
  }

  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

+ (id)metadataFromPlistData:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  id v17;

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "metadataFromDictionary:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_10;
    }
    else
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"+[MIStoreMetadata metadataFromPlistData:error:]", 915, CFSTR("MIInstallerErrorDomain"), 78, 0, &unk_1E6CD4770, CFSTR("iTunesMetadata.plist was not a dictionary; found class %@"),
        v13,
        (uint64_t)v12);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
      v8 = (id)v14;
      if (!a4)
        goto LABEL_10;
    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"+[MIStoreMetadata metadataFromPlistData:error:]", 910, CFSTR("MIInstallerErrorDomain"), 78, v8, &unk_1E6CD4748, CFSTR("Unable to deserialize iTunesMetadata.plist data"), v7, v16);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
    v8 = (id)v10;
    if (!a4)
      goto LABEL_10;
  }
  if (!v9)
    *a4 = objc_retainAutorelease(v8);
LABEL_10:

  return v9;
}

+ (id)metadataFromDictionary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", v3);

  return v4;
}

- (void)setSubGenres:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIAdAttribution:", v6);

  -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setIAdConversionDate:", v8);

  -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setIAdImpressionDate:", v10);

  -[MIStoreMetadata artistName](self, "artistName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setArtistName:", v12);

  -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBetaExternalVersionIdentifier:", v14);

  -[MIStoreMetadata bundleVersion](self, "bundleVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setBundleVersion:", v16);

  -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setBundleShortVersionString:", v18);

  -[MIStoreMetadata purchaseDate](self, "purchaseDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setPurchaseDate:", v20);

  -[MIStoreMetadata appleID](self, "appleID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setAppleID:", v22);

  -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setDSPersonID:", v24);

  -[MIStoreMetadata downloaderID](self, "downloaderID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setDownloaderID:", v26);

  -[MIStoreMetadata familyID](self, "familyID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setFamilyID:", v28);

  -[MIStoreMetadata purchaserID](self, "purchaserID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setPurchaserID:", v30);

  -[MIStoreMetadata altDSID](self, "altDSID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setAltDSID:", v32);

  objc_msgSend(v4, "setHasMessagesExtension:", -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension"));
  -[MIStoreMetadata initialODRSize](self, "initialODRSize");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setInitialODRSize:", v34);

  objc_msgSend(v4, "setPurchasedRedownload:", -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload"));
  -[MIStoreMetadata itemID](self, "itemID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setItemID:", v36);

  -[MIStoreMetadata itemName](self, "itemName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setItemName:", v38);

  -[MIStoreMetadata shortItemName](self, "shortItemName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setShortItemName:", v40);

  -[MIStoreMetadata kind](self, "kind");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setKind:", v42);

  -[MIStoreMetadata label](self, "label");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v4, "setLabel:", v44);

  objc_msgSend(v4, "setLaunchProhibited:", -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited"));
  -[MIStoreMetadata ratingLabel](self, "ratingLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  objc_msgSend(v4, "setRatingLabel:", v46);

  -[MIStoreMetadata ratingRank](self, "ratingRank");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v4, "setRatingRank:", v48);

  -[MIStoreMetadata releaseDate](self, "releaseDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  objc_msgSend(v4, "setReleaseDate:", v50);

  -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  objc_msgSend(v4, "setSoftwareVersionBundleID:", v52);

  -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copy");
  objc_msgSend(v4, "setSoftwareVersionExternalIdentifier:", v54);

  -[MIStoreMetadata sourceApp](self, "sourceApp");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "copy");
  objc_msgSend(v4, "setSourceApp:", v56);

  -[MIStoreMetadata storeCohort](self, "storeCohort");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copy");
  objc_msgSend(v4, "setStoreCohort:", v58);

  -[MIStoreMetadata storefront](self, "storefront");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "copy");
  objc_msgSend(v4, "setStorefront:", v60);

  -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v61, "copy");
  objc_msgSend(v4, "setStorefrontCountryCode:", v62);

  -[MIStoreMetadata assetToken](self, "assetToken");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "copy");
  objc_msgSend(v4, "setAssetToken:", v64);

  -[MIStoreMetadata variantID](self, "variantID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "copy");
  objc_msgSend(v4, "setVariantID:", v66);

  -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "copy");
  objc_msgSend(v4, "setBetaBuildGroupID:", v68);

  -[MIStoreMetadata genre](self, "genre");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "copy");
  objc_msgSend(v4, "setGenre:", v70);

  -[MIStoreMetadata genreID](self, "genreID");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copy");
  objc_msgSend(v4, "setGenreID:", v72);

  -[MIStoreMetadata subGenres](self, "subGenres");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v73, "copy");
  objc_msgSend(v4, "setSubGenres:", v74);

  -[MIStoreMetadata categories](self, "categories");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v75, "copy");
  objc_msgSend(v4, "setCategories:", v76);

  objc_msgSend(v4, "setGameCenterEnabled:", -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled"));
  objc_msgSend(v4, "setGameCenterEverEnabled:", -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled"));
  objc_msgSend(v4, "setIsAutoDownload:", -[MIStoreMetadata isAutoDownload](self, "isAutoDownload"));
  -[MIStoreMetadata referrerURL](self, "referrerURL");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v77, "copy");
  objc_msgSend(v4, "setReferrerURL:", v78);

  -[MIStoreMetadata referrerApp](self, "referrerApp");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v79, "copy");
  objc_msgSend(v4, "setReferrerApp:", v80);

  objc_msgSend(v4, "setSideLoadedDeviceBasedVPP:", -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP"));
  objc_msgSend(v4, "setDeviceBasedVPP:", -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP"));
  objc_msgSend(v4, "setIsB2BCustomApp:", -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp"));
  -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v81, "copy");
  objc_msgSend(v4, "setEnterpriseInstallURL:", v82);

  -[MIStoreMetadata redownloadParams](self, "redownloadParams");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v83, "copy");
  objc_msgSend(v4, "setRedownloadParams:", v84);

  -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v85, "copy");
  objc_msgSend(v4, "setNameTranscriptions:", v86);

  objc_msgSend(v4, "setFactoryInstall:", -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall"));
  -[MIStoreMetadata md5](self, "md5");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v87, "copy");
  objc_msgSend(v4, "setMd5:", v88);

  -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v89, "copy");
  objc_msgSend(v4, "setProtectedMetadata:", v90);

  -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v91, "copy");
  objc_msgSend(v4, "setHasOrEverHasHadIAP:", v92);

  -[MIStoreMetadata distributorInfo](self, "distributorInfo");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend(v93, "copy");
  objc_msgSend(v4, "setDistributorInfo:", v94);

  -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v95, "copy");
  objc_msgSend(v4, "setManagementDeclarationIdentifier:", v96);

  return v4;
}

- (MIStoreMetadata)initWithCoder:(id)a3
{
  id v4;
  MIStoreMetadata *v5;
  uint64_t v6;
  NSString *iAdAttribution;
  uint64_t v8;
  NSString *iAdConversionDate;
  uint64_t v10;
  NSString *iAdImpressionDate;
  uint64_t v12;
  NSString *artistName;
  uint64_t v14;
  NSNumber *betaExternalVersionIdentifier;
  uint64_t v16;
  NSString *bundleVersion;
  uint64_t v18;
  NSString *bundleShortVersionString;
  uint64_t v20;
  NSString *purchaseDate;
  uint64_t v22;
  NSString *appleID;
  uint64_t v24;
  NSNumber *DSPersonID;
  uint64_t v26;
  NSNumber *downloaderID;
  uint64_t v28;
  NSNumber *familyID;
  uint64_t v30;
  NSNumber *purchaserID;
  uint64_t v32;
  NSString *altDSID;
  uint64_t v34;
  NSNumber *initialODRSize;
  uint64_t v36;
  NSNumber *itemID;
  uint64_t v38;
  NSString *itemName;
  uint64_t v40;
  NSString *shortItemName;
  uint64_t v42;
  NSString *kind;
  uint64_t v44;
  NSString *label;
  uint64_t v46;
  NSString *ratingLabel;
  uint64_t v48;
  NSNumber *ratingRank;
  uint64_t v50;
  NSString *releaseDate;
  uint64_t v52;
  NSString *softwareVersionBundleID;
  uint64_t v54;
  NSNumber *softwareVersionExternalIdentifier;
  uint64_t v56;
  NSString *sourceApp;
  uint64_t v58;
  NSString *storeCohort;
  uint64_t v60;
  NSNumber *storefront;
  uint64_t v62;
  NSString *storefrontCountryCode;
  uint64_t v64;
  NSString *assetToken;
  uint64_t v66;
  NSString *variantID;
  uint64_t v68;
  NSString *betaBuildGroupID;
  uint64_t v70;
  NSString *genre;
  uint64_t v72;
  NSNumber *genreID;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSArray *subGenres;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSArray *categories;
  uint64_t v84;
  NSString *referrerURL;
  uint64_t v86;
  NSString *referrerApp;
  uint64_t v88;
  NSString *enterpriseInstallURL;
  uint64_t v90;
  NSString *redownloadParams;
  uint64_t v92;
  NSString *md5;
  uint64_t v94;
  NSData *protectedMetadata;
  uint64_t v96;
  NSNumber *hasOrEverHasHadIAP;
  uint64_t v98;
  MIStoreMetadataDistributor *distributorInfo;
  uint64_t v100;
  NSString *managementDeclarationIdentifier;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;

  v4 = a3;
  v5 = -[MIStoreMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iAdAttribution"));
    v6 = objc_claimAutoreleasedReturnValue();
    iAdAttribution = v5->_iAdAttribution;
    v5->_iAdAttribution = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iAdConversionDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    iAdConversionDate = v5->_iAdConversionDate;
    v5->_iAdConversionDate = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iAdImpressionDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    iAdImpressionDate = v5->_iAdImpressionDate;
    v5->_iAdImpressionDate = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artistName"));
    v12 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("betaExternalVersionIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
    v5->_betaExternalVersionIdentifier = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleShortVersionString"));
    v18 = objc_claimAutoreleasedReturnValue();
    bundleShortVersionString = v5->_bundleShortVersionString;
    v5->_bundleShortVersionString = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v22 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DSPersonID"));
    v24 = objc_claimAutoreleasedReturnValue();
    DSPersonID = v5->_DSPersonID;
    v5->_DSPersonID = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloaderID"));
    v26 = objc_claimAutoreleasedReturnValue();
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyID"));
    v28 = objc_claimAutoreleasedReturnValue();
    familyID = v5->_familyID;
    v5->_familyID = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaserID"));
    v30 = objc_claimAutoreleasedReturnValue();
    purchaserID = v5->_purchaserID;
    v5->_purchaserID = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v32 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v32;

    v5->_hasMessagesExtension = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMessagesExtension"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialODRSize"));
    v34 = objc_claimAutoreleasedReturnValue();
    initialODRSize = v5->_initialODRSize;
    v5->_initialODRSize = (NSNumber *)v34;

    v5->_purchasedRedownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("purchasedRedownload"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v36 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemName"));
    v38 = objc_claimAutoreleasedReturnValue();
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortItemName"));
    v40 = objc_claimAutoreleasedReturnValue();
    shortItemName = v5->_shortItemName;
    v5->_shortItemName = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v42 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v44 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v44;

    v5->_launchProhibited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("launchProhibited"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ratingLabel"));
    v46 = objc_claimAutoreleasedReturnValue();
    ratingLabel = v5->_ratingLabel;
    v5->_ratingLabel = (NSString *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ratingRank"));
    v48 = objc_claimAutoreleasedReturnValue();
    ratingRank = v5->_ratingRank;
    v5->_ratingRank = (NSNumber *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v50 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("softwareVersionBundleID"));
    v52 = objc_claimAutoreleasedReturnValue();
    softwareVersionBundleID = v5->_softwareVersionBundleID;
    v5->_softwareVersionBundleID = (NSString *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("softwareVersionExternalIdentifier"));
    v54 = objc_claimAutoreleasedReturnValue();
    softwareVersionExternalIdentifier = v5->_softwareVersionExternalIdentifier;
    v5->_softwareVersionExternalIdentifier = (NSNumber *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApp"));
    v56 = objc_claimAutoreleasedReturnValue();
    sourceApp = v5->_sourceApp;
    v5->_sourceApp = (NSString *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeCohort"));
    v58 = objc_claimAutoreleasedReturnValue();
    storeCohort = v5->_storeCohort;
    v5->_storeCohort = (NSString *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefront"));
    v60 = objc_claimAutoreleasedReturnValue();
    storefront = v5->_storefront;
    v5->_storefront = (NSNumber *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefrontCountryCode"));
    v62 = objc_claimAutoreleasedReturnValue();
    storefrontCountryCode = v5->_storefrontCountryCode;
    v5->_storefrontCountryCode = (NSString *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetToken"));
    v64 = objc_claimAutoreleasedReturnValue();
    assetToken = v5->_assetToken;
    v5->_assetToken = (NSString *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variantID"));
    v66 = objc_claimAutoreleasedReturnValue();
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v66;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("betaBuildGroupID"));
    v68 = objc_claimAutoreleasedReturnValue();
    betaBuildGroupID = v5->_betaBuildGroupID;
    v5->_betaBuildGroupID = (NSString *)v68;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre"));
    v70 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v70;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genreID"));
    v72 = objc_claimAutoreleasedReturnValue();
    genreID = v5->_genreID;
    v5->_genreID = (NSNumber *)v72;

    v74 = (void *)MEMORY[0x1E0C99E60];
    v75 = objc_opt_class();
    objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v76, CFSTR("subGenres"));
    v77 = objc_claimAutoreleasedReturnValue();
    subGenres = v5->_subGenres;
    v5->_subGenres = (NSArray *)v77;

    v79 = (void *)MEMORY[0x1E0C99E60];
    v80 = objc_opt_class();
    objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v81, CFSTR("categories"));
    v82 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v82;

    v5->_gameCenterEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("gameCenterEnabled"));
    v5->_gameCenterEverEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("gameCenterEverEnabled"));
    v5->_isAutoDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoDownload"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerURL"));
    v84 = objc_claimAutoreleasedReturnValue();
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSString *)v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerApp"));
    v86 = objc_claimAutoreleasedReturnValue();
    referrerApp = v5->_referrerApp;
    v5->_referrerApp = (NSString *)v86;

    v5->_sideLoadedDeviceBasedVPP = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sideLoadedDeviceBasedVPP"));
    v5->_deviceBasedVPP = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceBasedVPP"));
    v5->_isB2BCustomApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isB2BCustomApp"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enterpriseInstallURL"));
    v88 = objc_claimAutoreleasedReturnValue();
    enterpriseInstallURL = v5->_enterpriseInstallURL;
    v5->_enterpriseInstallURL = (NSString *)v88;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redownloadParams"));
    v90 = objc_claimAutoreleasedReturnValue();
    redownloadParams = v5->_redownloadParams;
    v5->_redownloadParams = (NSString *)v90;

    v5->_factoryInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("factoryInstall"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("md5"));
    v92 = objc_claimAutoreleasedReturnValue();
    md5 = v5->_md5;
    v5->_md5 = (NSString *)v92;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protectedMetadata"));
    v94 = objc_claimAutoreleasedReturnValue();
    protectedMetadata = v5->_protectedMetadata;
    v5->_protectedMetadata = (NSData *)v94;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasOrEverHasHadIAP"));
    v96 = objc_claimAutoreleasedReturnValue();
    hasOrEverHasHadIAP = v5->_hasOrEverHasHadIAP;
    v5->_hasOrEverHasHadIAP = (NSNumber *)v96;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distributorInfo"));
    v98 = objc_claimAutoreleasedReturnValue();
    distributorInfo = v5->_distributorInfo;
    v5->_distributorInfo = (MIStoreMetadataDistributor *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managementDeclarationIdentifier"));
    v100 = objc_claimAutoreleasedReturnValue();
    managementDeclarationIdentifier = v5->_managementDeclarationIdentifier;
    v5->_managementDeclarationIdentifier = (NSString *)v100;

    v102 = (void *)MEMORY[0x1E0C99E60];
    v103 = objc_opt_class();
    v104 = objc_opt_class();
    objc_msgSend(v102, "setWithObjects:", v103, v104, objc_opt_class(), 0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v105, CFSTR("nameTranscriptions"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106 && !_IsDictionaryWithKeyStringAndValueArrayOfString(v106))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
    }
    else
    {
      -[MIStoreMetadata setNameTranscriptions:](v5, "setNameTranscriptions:", v106);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v4 = a3;
  -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("iAdAttribution"));

  -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("iAdConversionDate"));

  -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("iAdImpressionDate"));

  -[MIStoreMetadata artistName](self, "artistName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("artistName"));

  -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("betaExternalVersionIdentifier"));

  -[MIStoreMetadata bundleVersion](self, "bundleVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("bundleVersion"));

  -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("bundleShortVersionString"));

  -[MIStoreMetadata purchaseDate](self, "purchaseDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("purchaseDate"));

  -[MIStoreMetadata appleID](self, "appleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("appleID"));

  -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("DSPersonID"));

  -[MIStoreMetadata downloaderID](self, "downloaderID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("downloaderID"));

  -[MIStoreMetadata familyID](self, "familyID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("familyID"));

  -[MIStoreMetadata purchaserID](self, "purchaserID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("purchaserID"));

  -[MIStoreMetadata altDSID](self, "altDSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("altDSID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension"), CFSTR("hasMessagesExtension"));
  -[MIStoreMetadata initialODRSize](self, "initialODRSize");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("initialODRSize"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload"), CFSTR("purchasedRedownload"));
  -[MIStoreMetadata itemID](self, "itemID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("itemID"));

  -[MIStoreMetadata itemName](self, "itemName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("itemName"));

  -[MIStoreMetadata shortItemName](self, "shortItemName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("shortItemName"));

  -[MIStoreMetadata kind](self, "kind");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("kind"));

  -[MIStoreMetadata label](self, "label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("label"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited"), CFSTR("launchProhibited"));
  -[MIStoreMetadata ratingLabel](self, "ratingLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("ratingLabel"));

  -[MIStoreMetadata ratingRank](self, "ratingRank");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("ratingRank"));

  -[MIStoreMetadata releaseDate](self, "releaseDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("releaseDate"));

  -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("softwareVersionBundleID"));

  -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("softwareVersionExternalIdentifier"));

  -[MIStoreMetadata sourceApp](self, "sourceApp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("sourceApp"));

  -[MIStoreMetadata storeCohort](self, "storeCohort");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("storeCohort"));

  -[MIStoreMetadata storefront](self, "storefront");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("storefront"));

  -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("storefrontCountryCode"));

  -[MIStoreMetadata assetToken](self, "assetToken");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("assetToken"));

  -[MIStoreMetadata variantID](self, "variantID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("variantID"));

  -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("betaBuildGroupID"));

  -[MIStoreMetadata genre](self, "genre");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("genre"));

  -[MIStoreMetadata genreID](self, "genreID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("genreID"));

  -[MIStoreMetadata subGenres](self, "subGenres");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("subGenres"));

  -[MIStoreMetadata categories](self, "categories");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("categories"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled"), CFSTR("gameCenterEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled"), CFSTR("gameCenterEverEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata isAutoDownload](self, "isAutoDownload"), CFSTR("isAutoDownload"));
  -[MIStoreMetadata referrerURL](self, "referrerURL");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("referrerURL"));

  -[MIStoreMetadata referrerApp](self, "referrerApp");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("referrerApp"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP"), CFSTR("sideLoadedDeviceBasedVPP"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP"), CFSTR("deviceBasedVPP"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp"), CFSTR("isB2BCustomApp"));
  -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("enterpriseInstallURL"));

  -[MIStoreMetadata redownloadParams](self, "redownloadParams");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("redownloadParams"));

  -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, CFSTR("nameTranscriptions"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall"), CFSTR("factoryInstall"));
  -[MIStoreMetadata md5](self, "md5");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v46, CFSTR("md5"));

  -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, CFSTR("protectedMetadata"));

  -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v48, CFSTR("hasOrEverHasHadIAP"));

  -[MIStoreMetadata distributorInfo](self, "distributorInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v49, CFSTR("distributorInfo"));

  -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, CFSTR("managementDeclarationIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)metadataForBundleContainerURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesMetadata.plist"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadataFromPlistAtURL:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, iAdAttribution);

  -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, iAdConversionDate);

  -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, iAdImpressionDate);

  -[MIStoreMetadata artistName](self, "artistName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, artistName);

  -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, betaExternalVersionIdentifier);

  -[MIStoreMetadata bundleVersion](self, "bundleVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, bundleVersion);

  -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, bundleShortVersionString);

  v11 = (void *)objc_opt_new();
  -[MIStoreMetadata purchaseDate](self, "purchaseDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MIStoreMetadata purchaseDate](self, "purchaseDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, purchaseDate);

  }
  -[MIStoreMetadata appleID](self, "appleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_22;
  -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    || (-[MIStoreMetadata downloaderID](self, "downloaderID"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[MIStoreMetadata familyID](self, "familyID"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[MIStoreMetadata purchaserID](self, "purchaserID"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_22:

  }
  else
  {
    -[MIStoreMetadata altDSID](self, "altDSID");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v87)
      goto LABEL_36;
  }
  v15 = (void *)objc_opt_new();
  -[MIStoreMetadata appleID](self, "appleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MIStoreMetadata appleID](self, "appleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, appleID);

  }
  -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MIStoreMetadata DSPersonID](self, "DSPersonID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, DSPersonID);

  }
  -[MIStoreMetadata downloaderID](self, "downloaderID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[MIStoreMetadata downloaderID](self, "downloaderID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, downloaderID);

  }
  -[MIStoreMetadata familyID](self, "familyID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MIStoreMetadata familyID](self, "familyID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, familyID);

  }
  -[MIStoreMetadata purchaserID](self, "purchaserID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MIStoreMetadata purchaserID](self, "purchaserID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, purchaserID);

  }
  -[MIStoreMetadata altDSID](self, "altDSID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MIStoreMetadata altDSID](self, "altDSID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, altDSID);

  }
  v28 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, accountInfoDict);

LABEL_36:
  if (objc_msgSend(v11, "count"))
  {
    v29 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, downloadInfoDict);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, hasMessagesExtension);

  -[MIStoreMetadata initialODRSize](self, "initialODRSize");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, initialODRSize);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, purchasedRedownload);

  -[MIStoreMetadata itemID](self, "itemID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, itemID);

  -[MIStoreMetadata itemName](self, "itemName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, itemName);

  -[MIStoreMetadata shortItemName](self, "shortItemName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, shortItemName);

  -[MIStoreMetadata kind](self, "kind");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, kind);

  -[MIStoreMetadata label](self, "label");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, label);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, launchProhibited);

  v39 = (void *)objc_opt_new();
  -[MIStoreMetadata ratingLabel](self, "ratingLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[MIStoreMetadata ratingLabel](self, "ratingLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, ratingLabel);

  }
  -[MIStoreMetadata ratingRank](self, "ratingRank");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[MIStoreMetadata ratingRank](self, "ratingRank");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, ratingRank);

  }
  if (objc_msgSend(v39, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, ratingDict);
  -[MIStoreMetadata releaseDate](self, "releaseDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, releaseDate);

  -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, softwareVersionBundleID);

  -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, softwareVersionExternalIdentifier);

  -[MIStoreMetadata sourceApp](self, "sourceApp");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, sourceApp);

  -[MIStoreMetadata storeCohort](self, "storeCohort");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, storeCohort);

  -[MIStoreMetadata storefront](self, "storefront");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, storefront);

  -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, storefrontCountryCode);

  -[MIStoreMetadata assetToken](self, "assetToken");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, assetToken);

  -[MIStoreMetadata variantID](self, "variantID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, variantID);

  -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, betaBuildGroupID);
  v54 = v11;

  -[MIStoreMetadata genre](self, "genre");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, genre);

  -[MIStoreMetadata genreID](self, "genreID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, genreID);

  v57 = (void *)objc_opt_new();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[MIStoreMetadata subGenres](self, "subGenres", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v89;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v89 != v61)
          objc_enumerationMutation(v58);
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v62), "dictionaryRepresentation");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObject:", v63);

        ++v62;
      }
      while (v60 != v62);
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
    }
    while (v60);
  }

  v64 = (void *)objc_msgSend(v57, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, subGenres);

  -[MIStoreMetadata categories](self, "categories");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, categories);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, gameCenterEnabled);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, gameCenterEverEnabled);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata isAutoDownload](self, "isAutoDownload"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, isAutoDownload);

  -[MIStoreMetadata referrerURL](self, "referrerURL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, referrerURL);

  -[MIStoreMetadata referrerApp](self, "referrerApp");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, referrerApp);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, sideLoadedDeviceBasedVPP);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, deviceBasedVPP);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, isB2BCustomApp);

  -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, enterpriseInstallURL);

  -[MIStoreMetadata redownloadParams](self, "redownloadParams");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, redownloadParams);

  -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, nameTranscriptions);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, factoryInstall);

  -[MIStoreMetadata md5](self, "md5");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, md5);

  -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, protectedMetadata);

  -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, hasOrEverHasHadIAP);

  -[MIStoreMetadata distributorInfo](self, "distributorInfo");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (v81)
  {
    objc_msgSend(v81, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, distributorInfo);

  }
  -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, managementDeclarationIdentifier);

  v85 = (void *)objc_msgSend(v3, "copy");
  return v85;
}

- (id)propertyListDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  -[MIStoreMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MIStoreMetadata *v4;
  MIStoreMetadata *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  _BOOL4 v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  void *v102;
  void *v103;
  _BOOL4 v104;
  void *v105;
  void *v106;
  _BOOL4 v107;
  void *v108;
  void *v109;
  _BOOL4 v110;
  void *v111;
  void *v112;
  _BOOL4 v113;
  void *v114;
  void *v115;
  _BOOL4 v116;
  _BOOL4 v117;
  _BOOL4 v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  _BOOL4 v122;
  void *v123;
  void *v124;
  _BOOL4 v125;
  _BOOL4 v126;
  _BOOL4 v127;
  _BOOL4 v128;
  void *v129;
  void *v130;
  _BOOL4 v131;
  void *v132;
  void *v133;
  _BOOL4 v134;
  void *v135;
  void *v136;
  _BOOL4 v137;
  _BOOL4 v138;
  void *v139;
  void *v140;
  _BOOL4 v141;
  void *v142;
  void *v143;
  _BOOL4 v144;
  void *v145;
  void *v146;
  _BOOL4 v147;
  void *v148;
  void *v149;
  _BOOL4 v150;
  void *v151;
  void *v152;
  BOOL v153;

  v4 = (MIStoreMetadata *)a3;
  if (v4 == self)
  {
    v153 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata iAdAttribution](v5, "iAdAttribution");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (!v8)
        goto LABEL_61;
      -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata iAdConversionDate](v5, "iAdConversionDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MICompareObjects(v9, v10);

      if (!v11)
        goto LABEL_61;
      -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata iAdImpressionDate](v5, "iAdImpressionDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MICompareObjects(v12, v13);

      if (!v14)
        goto LABEL_61;
      -[MIStoreMetadata artistName](self, "artistName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata artistName](v5, "artistName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MICompareObjects(v15, v16);

      if (!v17)
        goto LABEL_61;
      -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata betaExternalVersionIdentifier](v5, "betaExternalVersionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MICompareObjects(v18, v19);

      if (!v20)
        goto LABEL_61;
      -[MIStoreMetadata bundleVersion](self, "bundleVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata bundleVersion](v5, "bundleVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MICompareObjects(v21, v22);

      if (!v23)
        goto LABEL_61;
      -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata bundleShortVersionString](v5, "bundleShortVersionString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MICompareObjects(v24, v25);

      if (!v26)
        goto LABEL_61;
      -[MIStoreMetadata purchaseDate](self, "purchaseDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata purchaseDate](v5, "purchaseDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MICompareObjects(v27, v28);

      if (!v29)
        goto LABEL_61;
      -[MIStoreMetadata appleID](self, "appleID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata appleID](v5, "appleID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = MICompareObjects(v30, v31);

      if (!v32)
        goto LABEL_61;
      -[MIStoreMetadata DSPersonID](self, "DSPersonID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata DSPersonID](v5, "DSPersonID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = MICompareObjects(v33, v34);

      if (!v35)
        goto LABEL_61;
      -[MIStoreMetadata downloaderID](self, "downloaderID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata downloaderID](v5, "downloaderID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = MICompareObjects(v36, v37);

      if (!v38)
        goto LABEL_61;
      -[MIStoreMetadata familyID](self, "familyID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata familyID](v5, "familyID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = MICompareObjects(v39, v40);

      if (!v41)
        goto LABEL_61;
      -[MIStoreMetadata purchaserID](self, "purchaserID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata purchaserID](v5, "purchaserID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = MICompareObjects(v42, v43);

      if (!v44)
        goto LABEL_61;
      -[MIStoreMetadata altDSID](self, "altDSID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata altDSID](v5, "altDSID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = MICompareObjects(v45, v46);

      if (!v47)
        goto LABEL_61;
      v48 = -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension");
      if (v48 != -[MIStoreMetadata hasMessagesExtension](v5, "hasMessagesExtension"))
        goto LABEL_61;
      -[MIStoreMetadata initialODRSize](self, "initialODRSize");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata initialODRSize](v5, "initialODRSize");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = MICompareObjects(v49, v50);

      if (!v51)
        goto LABEL_61;
      v52 = -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload");
      if (v52 != -[MIStoreMetadata isPurchasedRedownload](v5, "isPurchasedRedownload"))
        goto LABEL_61;
      -[MIStoreMetadata itemID](self, "itemID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata itemID](v5, "itemID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = MICompareObjects(v53, v54);

      if (!v55)
        goto LABEL_61;
      -[MIStoreMetadata itemName](self, "itemName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata itemName](v5, "itemName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = MICompareObjects(v56, v57);

      if (!v58)
        goto LABEL_61;
      -[MIStoreMetadata shortItemName](self, "shortItemName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata shortItemName](v5, "shortItemName");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = MICompareObjects(v59, v60);

      if (!v61)
        goto LABEL_61;
      -[MIStoreMetadata kind](self, "kind");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata kind](v5, "kind");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = MICompareObjects(v62, v63);

      if (!v64)
        goto LABEL_61;
      -[MIStoreMetadata label](self, "label");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata label](v5, "label");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = MICompareObjects(v65, v66);

      if (!v67)
        goto LABEL_61;
      v68 = -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited");
      if (v68 != -[MIStoreMetadata isLaunchProhibited](v5, "isLaunchProhibited"))
        goto LABEL_61;
      -[MIStoreMetadata ratingLabel](self, "ratingLabel");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata ratingLabel](v5, "ratingLabel");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = MICompareObjects(v69, v70);

      if (!v71)
        goto LABEL_61;
      -[MIStoreMetadata ratingRank](self, "ratingRank");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata ratingRank](v5, "ratingRank");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = MICompareObjects(v72, v73);

      if (!v74)
        goto LABEL_61;
      -[MIStoreMetadata releaseDate](self, "releaseDate");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata releaseDate](v5, "releaseDate");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = MICompareObjects(v75, v76);

      if (!v77)
        goto LABEL_61;
      -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata softwareVersionBundleID](v5, "softwareVersionBundleID");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = MICompareObjects(v78, v79);

      if (!v80)
        goto LABEL_61;
      -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata softwareVersionExternalIdentifier](v5, "softwareVersionExternalIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = MICompareObjects(v81, v82);

      if (!v83)
        goto LABEL_61;
      -[MIStoreMetadata sourceApp](self, "sourceApp");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata sourceApp](v5, "sourceApp");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = MICompareObjects(v84, v85);

      if (!v86)
        goto LABEL_61;
      -[MIStoreMetadata storeCohort](self, "storeCohort");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata storeCohort](v5, "storeCohort");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = MICompareObjects(v87, v88);

      if (!v89)
        goto LABEL_61;
      -[MIStoreMetadata storefront](self, "storefront");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata storefront](v5, "storefront");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = MICompareObjects(v90, v91);

      if (!v92)
        goto LABEL_61;
      -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata storefrontCountryCode](v5, "storefrontCountryCode");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = MICompareObjects(v93, v94);

      if (!v95)
        goto LABEL_61;
      -[MIStoreMetadata assetToken](self, "assetToken");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata assetToken](v5, "assetToken");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = MICompareObjects(v96, v97);

      if (!v98)
        goto LABEL_61;
      -[MIStoreMetadata variantID](self, "variantID");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata variantID](v5, "variantID");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = MICompareObjects(v99, v100);

      if (!v101)
        goto LABEL_61;
      -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata betaBuildGroupID](v5, "betaBuildGroupID");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = MICompareObjects(v102, v103);

      if (!v104)
        goto LABEL_61;
      -[MIStoreMetadata genre](self, "genre");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata genre](v5, "genre");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = MICompareObjects(v105, v106);

      if (!v107)
        goto LABEL_61;
      -[MIStoreMetadata genreID](self, "genreID");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata genreID](v5, "genreID");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = MICompareObjects(v108, v109);

      if (!v110)
        goto LABEL_61;
      -[MIStoreMetadata subGenres](self, "subGenres");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata subGenres](v5, "subGenres");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = MICompareObjects(v111, v112);

      if (!v113)
        goto LABEL_61;
      -[MIStoreMetadata categories](self, "categories");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata categories](v5, "categories");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = MICompareObjects(v114, v115);

      if (!v116)
        goto LABEL_61;
      v117 = -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled");
      if (v117 != -[MIStoreMetadata isGameCenterEnabled](v5, "isGameCenterEnabled"))
        goto LABEL_61;
      v118 = -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled");
      if (v118 != -[MIStoreMetadata gameCenterEverEnabled](v5, "gameCenterEverEnabled"))
        goto LABEL_61;
      v119 = -[MIStoreMetadata isAutoDownload](self, "isAutoDownload");
      if (v119 != -[MIStoreMetadata isAutoDownload](v5, "isAutoDownload"))
        goto LABEL_61;
      -[MIStoreMetadata referrerURL](self, "referrerURL");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata referrerURL](v5, "referrerURL");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = MICompareObjects(v120, v121);

      if (!v122)
        goto LABEL_61;
      -[MIStoreMetadata referrerApp](self, "referrerApp");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata referrerApp](v5, "referrerApp");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = MICompareObjects(v123, v124);

      if (!v125)
        goto LABEL_61;
      v126 = -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP");
      if (v126 != -[MIStoreMetadata sideLoadedDeviceBasedVPP](v5, "sideLoadedDeviceBasedVPP"))
        goto LABEL_61;
      v127 = -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP");
      if (v127 != -[MIStoreMetadata deviceBasedVPP](v5, "deviceBasedVPP"))
        goto LABEL_61;
      v128 = -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp");
      if (v128 != -[MIStoreMetadata isB2BCustomApp](v5, "isB2BCustomApp"))
        goto LABEL_61;
      -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata enterpriseInstallURL](v5, "enterpriseInstallURL");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = MICompareObjects(v129, v130);

      if (!v131)
        goto LABEL_61;
      -[MIStoreMetadata redownloadParams](self, "redownloadParams");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata redownloadParams](v5, "redownloadParams");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = MICompareObjects(v132, v133);

      if (!v134)
        goto LABEL_61;
      -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata nameTranscriptions](v5, "nameTranscriptions");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = MICompareObjects(v135, v136);

      if (!v137)
        goto LABEL_61;
      v138 = -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall");
      if (v138 != -[MIStoreMetadata isFactoryInstall](v5, "isFactoryInstall"))
        goto LABEL_61;
      -[MIStoreMetadata md5](self, "md5");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata md5](v5, "md5");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = MICompareObjects(v139, v140);

      if (!v141)
        goto LABEL_61;
      -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata protectedMetadata](v5, "protectedMetadata");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = MICompareObjects(v142, v143);

      if (!v144)
        goto LABEL_61;
      -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata hasOrEverHasHadIAP](v5, "hasOrEverHasHadIAP");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = MICompareObjects(v145, v146);

      if (!v147)
        goto LABEL_61;
      -[MIStoreMetadata distributorInfo](self, "distributorInfo");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata distributorInfo](v5, "distributorInfo");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = MICompareObjects(v148, v149);

      if (v150)
      {
        -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIStoreMetadata managementDeclarationIdentifier](v5, "managementDeclarationIdentifier");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = MICompareObjects(v151, v152);

      }
      else
      {
LABEL_61:
        v153 = 0;
      }

    }
    else
    {
      v153 = 0;
    }
  }

  return v153;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MIStoreMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEligibleForWatchAppInstall
{
  void *v2;
  void *v3;
  char v4;

  -[MIStoreMetadata distributorInfo](self, "distributorInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distributorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "distributorIsFirstPartyApple");
  else
    v4 = 1;

  return v4;
}

- (NSString)iAdAttribution
{
  return self->_iAdAttribution;
}

- (NSString)iAdConversionDate
{
  return self->_iAdConversionDate;
}

- (void)setIAdConversionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)iAdImpressionDate
{
  return self->_iAdImpressionDate;
}

- (void)setIAdImpressionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSNumber)betaExternalVersionIdentifier
{
  return self->_betaExternalVersionIdentifier;
}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_betaExternalVersionIdentifier, a3);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)bundleShortVersionString
{
  return self->_bundleShortVersionString;
}

- (NSString)purchaseDate
{
  return self->_purchaseDate;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSNumber)DSPersonID
{
  return self->_DSPersonID;
}

- (NSNumber)downloaderID
{
  return self->_downloaderID;
}

- (NSNumber)familyID
{
  return self->_familyID;
}

- (NSNumber)purchaserID
{
  return self->_purchaserID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (NSNumber)initialODRSize
{
  return self->_initialODRSize;
}

- (void)setInitialODRSize:(id)a3
{
  objc_storeStrong((id *)&self->_initialODRSize, a3);
}

- (BOOL)isPurchasedRedownload
{
  return self->_purchasedRedownload;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (NSString)itemName
{
  return self->_itemName;
}

- (NSString)shortItemName
{
  return self->_shortItemName;
}

- (void)setShortItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)isLaunchProhibited
{
  return self->_launchProhibited;
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (NSNumber)ratingRank
{
  return self->_ratingRank;
}

- (NSString)releaseDate
{
  return self->_releaseDate;
}

- (NSString)assetToken
{
  return self->_assetToken;
}

- (void)setAssetToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)softwareVersionBundleID
{
  return self->_softwareVersionBundleID;
}

- (NSNumber)softwareVersionExternalIdentifier
{
  return self->_softwareVersionExternalIdentifier;
}

- (NSString)sourceApp
{
  return self->_sourceApp;
}

- (NSString)storeCohort
{
  return self->_storeCohort;
}

- (NSNumber)storefront
{
  return self->_storefront;
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (NSString)variantID
{
  return self->_variantID;
}

- (NSString)betaBuildGroupID
{
  return self->_betaBuildGroupID;
}

- (void)setBetaBuildGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)genre
{
  return self->_genre;
}

- (NSNumber)genreID
{
  return self->_genreID;
}

- (NSArray)subGenres
{
  return self->_subGenres;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)isGameCenterEnabled
{
  return self->_gameCenterEnabled;
}

- (BOOL)gameCenterEverEnabled
{
  return self->_gameCenterEverEnabled;
}

- (BOOL)isAutoDownload
{
  return self->_isAutoDownload;
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)referrerApp
{
  return self->_referrerApp;
}

- (void)setReferrerApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (BOOL)sideLoadedDeviceBasedVPP
{
  return self->_sideLoadedDeviceBasedVPP;
}

- (BOOL)deviceBasedVPP
{
  return self->_deviceBasedVPP;
}

- (BOOL)isB2BCustomApp
{
  return self->_isB2BCustomApp;
}

- (NSString)enterpriseInstallURL
{
  return self->_enterpriseInstallURL;
}

- (void)setEnterpriseInstallURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)redownloadParams
{
  return self->_redownloadParams;
}

- (NSDictionary)nameTranscriptions
{
  return self->_nameTranscriptions;
}

- (void)setNameTranscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)isFactoryInstall
{
  return self->_factoryInstall;
}

- (NSString)md5
{
  return self->_md5;
}

- (void)setMd5:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSData)protectedMetadata
{
  return self->_protectedMetadata;
}

- (void)setProtectedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (MIStoreMetadataDistributor)distributorInfo
{
  return self->_distributorInfo;
}

- (void)setDistributorInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)managementDeclarationIdentifier
{
  return self->_managementDeclarationIdentifier;
}

- (void)setManagementDeclarationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

@end
