@implementation BMAppLocationActivity

- (BMAppLocationActivity)initWithBundleID:(id)a3 activityType:(id)a4 beginningOfActivity:(id)a5 contentDescription:(id)a6 expirationDate:(id)a7 isEligibleForPrediction:(id)a8 isPubliclyIndexable:(id)a9 itemIdentifier:(id)a10 itemRelatedContentURL:(id)a11 itemRelatedUniqueIdentifier:(id)a12 shortcutAvailability:(id)a13 suggestedInvocationPhrase:(id)a14 title:(id)a15 userActivityRequiredString:(id)a16 userActivityUUID:(id)a17 sourceID:(id)a18 sourceBundleID:(id)a19 sourceItemID:(id)a20 sourceGroupID:(id)a21 calendarUserActivityDate:(id)a22 calendarUserActivityExternalID:(id)a23 calendarUserActivityEndDate:(id)a24 locationName:(id)a25 latitude:(id)a26 longitude:(id)a27 city:(id)a28 stateOrProvince:(id)a29 country:(id)a30 thoroughfare:(id)a31 fullyFormattedAddress:(id)a32 subThoroughfare:(id)a33 postalCode:(id)a34 phoneNumbers:(id)a35 displayName:(id)a36 URL:(id)a37
{
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  BMAppLocationActivity *v48;
  double v49;
  uint64_t v50;
  NSString *raw_itemRelatedContentURL;
  int v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  NSString *raw_URL;
  id v61;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v88;
  id v89;
  id v91;
  objc_super v92;

  v79 = a3;
  v61 = a4;
  v78 = a4;
  v89 = a5;
  v77 = a6;
  v88 = a7;
  v91 = a8;
  v85 = a9;
  v76 = a10;
  v84 = a11;
  v75 = a12;
  v82 = a13;
  v74 = a14;
  v73 = a15;
  v72 = a16;
  v71 = a17;
  v70 = a18;
  v69 = a19;
  v68 = a20;
  v67 = a21;
  v83 = a22;
  v66 = a23;
  v81 = a24;
  v65 = a25;
  v86 = a26;
  v80 = a27;
  v64 = a28;
  v63 = a29;
  v40 = a30;
  v41 = a31;
  v42 = a32;
  v43 = a33;
  v44 = a34;
  v45 = a35;
  v46 = a36;
  v47 = a37;
  v92.receiver = self;
  v92.super_class = (Class)BMAppLocationActivity;
  v48 = -[BMEventBase init](&v92, sel_init);
  if (v48)
  {
    v48->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v48->_bundleID, a3);
    objc_storeStrong((id *)&v48->_activityType, v61);
    if (v89)
    {
      v48->_hasBeginningOfActivity = 1;
      v48->_beginningOfActivity = objc_msgSend(v89, "BOOLValue");
    }
    else
    {
      v48->_hasBeginningOfActivity = 0;
      v48->_beginningOfActivity = 0;
    }
    objc_storeStrong((id *)&v48->_contentDescription, a6);
    if (v88)
    {
      v48->_hasRaw_expirationDate = 1;
      objc_msgSend(v88, "timeIntervalSince1970");
    }
    else
    {
      v48->_hasRaw_expirationDate = 0;
      v49 = -1.0;
    }
    v48->_raw_expirationDate = v49;
    if (v91)
    {
      v48->_hasIsEligibleForPrediction = 1;
      v48->_isEligibleForPrediction = objc_msgSend(v91, "BOOLValue");
    }
    else
    {
      v48->_hasIsEligibleForPrediction = 0;
      v48->_isEligibleForPrediction = 0;
    }
    if (v85)
    {
      v48->_hasIsPubliclyIndexable = 1;
      v48->_isPubliclyIndexable = objc_msgSend(v85, "BOOLValue");
    }
    else
    {
      v48->_hasIsPubliclyIndexable = 0;
      v48->_isPubliclyIndexable = 0;
    }
    objc_storeStrong((id *)&v48->_itemIdentifier, a10);
    if (v84)
    {
      objc_msgSend(v84, "absoluteString");
      v50 = objc_claimAutoreleasedReturnValue();
      raw_itemRelatedContentURL = v48->_raw_itemRelatedContentURL;
      v48->_raw_itemRelatedContentURL = (NSString *)v50;
    }
    else
    {
      raw_itemRelatedContentURL = v48->_raw_itemRelatedContentURL;
      v48->_raw_itemRelatedContentURL = 0;
    }

    objc_storeStrong((id *)&v48->_itemRelatedUniqueIdentifier, a12);
    if (v82)
    {
      v48->_hasShortcutAvailability = 1;
      v52 = objc_msgSend(v82, "intValue");
    }
    else
    {
      v48->_hasShortcutAvailability = 0;
      v52 = -1;
    }
    v48->_shortcutAvailability = v52;
    objc_storeStrong((id *)&v48->_suggestedInvocationPhrase, a14);
    objc_storeStrong((id *)&v48->_title, a15);
    objc_storeStrong((id *)&v48->_userActivityRequiredString, a16);
    objc_storeStrong((id *)&v48->_userActivityUUID, a17);
    objc_storeStrong((id *)&v48->_sourceID, a18);
    objc_storeStrong((id *)&v48->_sourceBundleID, a19);
    objc_storeStrong((id *)&v48->_sourceItemID, a20);
    objc_storeStrong((id *)&v48->_sourceGroupID, a21);
    if (v83)
    {
      v48->_hasRaw_calendarUserActivityDate = 1;
      objc_msgSend(v83, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v48->_hasRaw_calendarUserActivityDate = 0;
      v53 = -1.0;
    }
    v48->_raw_calendarUserActivityDate = v53;
    objc_storeStrong((id *)&v48->_calendarUserActivityExternalID, a23);
    if (v81)
    {
      v48->_hasRaw_calendarUserActivityEndDate = 1;
      objc_msgSend(v81, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v48->_hasRaw_calendarUserActivityEndDate = 0;
      v54 = -1.0;
    }
    v48->_raw_calendarUserActivityEndDate = v54;
    objc_storeStrong((id *)&v48->_locationName, a25);
    if (v86)
    {
      v48->_hasLatitude = 1;
      objc_msgSend(v86, "doubleValue");
    }
    else
    {
      v48->_hasLatitude = 0;
      v55 = -1.0;
    }
    v48->_latitude = v55;
    if (v80)
    {
      v48->_hasLongitude = 1;
      objc_msgSend(v80, "doubleValue");
    }
    else
    {
      v48->_hasLongitude = 0;
      v56 = -1.0;
    }
    v48->_longitude = v56;
    objc_storeStrong((id *)&v48->_city, a28);
    objc_storeStrong((id *)&v48->_stateOrProvince, a29);
    objc_storeStrong((id *)&v48->_country, a30);
    objc_storeStrong((id *)&v48->_thoroughfare, a31);
    objc_storeStrong((id *)&v48->_fullyFormattedAddress, a32);
    objc_storeStrong((id *)&v48->_subThoroughfare, a33);
    objc_storeStrong((id *)&v48->_postalCode, a34);
    objc_storeStrong((id *)&v48->_phoneNumbers, a35);
    objc_storeStrong((id *)&v48->_displayName, a36);
    if (v47)
    {
      objc_msgSend(v47, "absoluteString");
      v57 = objc_claimAutoreleasedReturnValue();
      raw_URL = v48->_raw_URL;
      v48->_raw_URL = (NSString *)v57;
    }
    else
    {
      raw_URL = v48->_raw_URL;
      v48->_raw_URL = 0;
    }

  }
  return v48;
}

- (NSString)description
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
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

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppLocationActivity bundleID](self, "bundleID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity activityType](self, "activityType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLocationActivity beginningOfActivity](self, "beginningOfActivity"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity contentDescription](self, "contentDescription");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity expirationDate](self, "expirationDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLocationActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLocationActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity itemIdentifier](self, "itemIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity itemRelatedContentURL](self, "itemRelatedContentURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppLocationActivity shortcutAvailability](self, "shortcutAvailability"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity title](self, "title");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity userActivityRequiredString](self, "userActivityRequiredString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity userActivityUUID](self, "userActivityUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceID](self, "sourceID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceBundleID](self, "sourceBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceItemID](self, "sourceItemID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceGroupID](self, "sourceGroupID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity calendarUserActivityDate](self, "calendarUserActivityDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity locationName](self, "locationName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAppLocationActivity latitude](self, "latitude");
  objc_msgSend(v3, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAppLocationActivity longitude](self, "longitude");
  objc_msgSend(v4, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity city](self, "city");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity stateOrProvince](self, "stateOrProvince");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity country](self, "country");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity thoroughfare](self, "thoroughfare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity fullyFormattedAddress](self, "fullyFormattedAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity subThoroughfare](self, "subThoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity postalCode](self, "postalCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity phoneNumbers](self, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity URL](self, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v19, "initWithFormat:", CFSTR("BMAppLocationActivity with bundleID: %@, activityType: %@, beginningOfActivity: %@, contentDescription: %@, expirationDate: %@, isEligibleForPrediction: %@, isPubliclyIndexable: %@, itemIdentifier: %@, itemRelatedContentURL: %@, itemRelatedUniqueIdentifier: %@, shortcutAvailability: %@, suggestedInvocationPhrase: %@, title: %@, userActivityRequiredString: %@, userActivityUUID: %@, sourceID: %@, sourceBundleID: %@, sourceItemID: %@, sourceGroupID: %@, calendarUserActivityDate: %@, calendarUserActivityExternalID: %@, calendarUserActivityEndDate: %@, locationName: %@, latitude: %@, longitude: %@, city: %@, stateOrProvince: %@, country: %@, thoroughfare: %@, fullyFormattedAddress: %@, subThoroughfare: %@, postalCode: %@, phoneNumbers: %@, displayName: %@, URL: %@"), v42, v41, v40, v39, v38, v37, v36, v35, v32, v34, v33, v29, v31, v25, v30, v28,
              v18,
              v27,
              v17,
              v26,
              v24,
              v23,
              v16,
              v22,
              v21,
              v14,
              v15,
              v5,
              v6,
              v13,
              v7,
              v8,
              v9,
              v10,
              v11);

  return (NSString *)v20;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppLocationActivity *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  objc_class *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSArray *phoneNumbers;
  int v70;
  BMAppLocationActivity *v71;
  objc_super v73;

  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)BMAppLocationActivity;
  v5 = -[BMEventBase init](&v73, sel_init);
  if (!v5)
    goto LABEL_125;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 104;
          goto LABEL_90;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 112;
          goto LABEL_90;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasBeginningOfActivity = 1;
          while (2)
          {
            v26 = *v7;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v18 = v24++ >= 9;
                if (v18)
                {
                  v25 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v25 = 0;
LABEL_98:
          v65 = v25 != 0;
          v66 = 80;
          goto LABEL_107;
        case 4u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 120;
          goto LABEL_90;
        case 5u:
          v5->_hasRaw_expirationDate = 1;
          v30 = *v7;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v32 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v32 = 0;
          }
          v67 = 24;
          goto LABEL_122;
        case 6u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasIsEligibleForPrediction = 1;
          while (2)
          {
            v36 = *v7;
            v37 = *(_QWORD *)&v4[v36];
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v37);
              *(_QWORD *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                v18 = v34++ >= 9;
                if (v18)
                {
                  v35 = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v35 = 0;
LABEL_102:
          v65 = v35 != 0;
          v66 = 82;
          goto LABEL_107;
        case 7u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasIsPubliclyIndexable = 1;
          while (2)
          {
            v43 = *v7;
            v44 = *(_QWORD *)&v4[v43];
            v45 = v44 + 1;
            if (v44 == -1 || v45 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v44);
              *(_QWORD *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                v18 = v41++ >= 9;
                if (v18)
                {
                  v42 = 0;
                  goto LABEL_106;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v42 = 0;
LABEL_106:
          v65 = v42 != 0;
          v66 = 84;
LABEL_107:
          *((_BYTE *)&v5->super.super.isa + v66) = v65;
          continue;
        case 8u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 128;
          goto LABEL_90;
        case 9u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
          goto LABEL_90;
        case 0xAu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 136;
          goto LABEL_90;
        case 0xBu:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          v5->_hasShortcutAvailability = 1;
          break;
        case 0xCu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 144;
          goto LABEL_90;
        case 0xDu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 152;
          goto LABEL_90;
        case 0xEu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 160;
          goto LABEL_90;
        case 0xFu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 168;
          goto LABEL_90;
        case 0x10u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 176;
          goto LABEL_90;
        case 0x11u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 184;
          goto LABEL_90;
        case 0x12u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 192;
          goto LABEL_90;
        case 0x13u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 200;
          goto LABEL_90;
        case 0x14u:
          v5->_hasRaw_calendarUserActivityDate = 1;
          v54 = *v7;
          v55 = *(_QWORD *)&v4[v54];
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v32 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v55);
            *(_QWORD *)&v4[v54] = v55 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v32 = 0;
          }
          v67 = 48;
          goto LABEL_122;
        case 0x15u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 208;
          goto LABEL_90;
        case 0x16u:
          v5->_hasRaw_calendarUserActivityEndDate = 1;
          v56 = *v7;
          v57 = *(_QWORD *)&v4[v56];
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v32 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v57);
            *(_QWORD *)&v4[v56] = v57 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v32 = 0;
          }
          v67 = 64;
          goto LABEL_122;
        case 0x17u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 216;
          goto LABEL_90;
        case 0x18u:
          v5->_hasLatitude = 1;
          v58 = *v7;
          v59 = *(_QWORD *)&v4[v58];
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v32 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v59);
            *(_QWORD *)&v4[v58] = v59 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v32 = 0;
          }
          v67 = 224;
          goto LABEL_122;
        case 0x19u:
          v5->_hasLongitude = 1;
          v60 = *v7;
          v61 = *(_QWORD *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v32 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v61);
            *(_QWORD *)&v4[v60] = v61 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v32 = 0;
          }
          v67 = 232;
LABEL_122:
          *(Class *)((char *)&v5->super.super.isa + v67) = v32;
          continue;
        case 0x1Au:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 240;
          goto LABEL_90;
        case 0x1Bu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 248;
          goto LABEL_90;
        case 0x1Cu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 256;
          goto LABEL_90;
        case 0x1Du:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 264;
          goto LABEL_90;
        case 0x1Eu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 272;
          goto LABEL_90;
        case 0x1Fu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 280;
          goto LABEL_90;
        case 0x20u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 288;
          goto LABEL_90;
        case 0x21u:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          if (!v62)
            goto LABEL_127;
          v63 = (void *)v62;
          objc_msgSend(v6, "addObject:", v62);

          continue;
        case 0x22u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 304;
          goto LABEL_90;
        case 0x23u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 72;
LABEL_90:
          v64 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_127:

          goto LABEL_124;
      }
      while (1)
      {
        v50 = *v7;
        v51 = *(_QWORD *)&v4[v50];
        v52 = v51 + 1;
        if (v51 == -1 || v52 > *(_QWORD *)&v4[*v8])
          break;
        v53 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v51);
        *(_QWORD *)&v4[v50] = v52;
        v49 |= (unint64_t)(v53 & 0x7F) << v47;
        if ((v53 & 0x80) == 0)
          goto LABEL_109;
        v47 += 7;
        v18 = v48++ >= 9;
        if (v18)
        {
          LODWORD(v49) = 0;
          goto LABEL_111;
        }
      }
      v4[*v9] = 1;
LABEL_109:
      if (v4[*v9])
        LODWORD(v49) = 0;
LABEL_111:
      v5->_shortcutAvailability = v49;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v68 = objc_msgSend(v6, "copy");
  phoneNumbers = v5->_phoneNumbers;
  v5->_phoneNumbers = (NSArray *)v68;

  v70 = v4[*v9];
  if (v70)
LABEL_124:
    v71 = 0;
  else
LABEL_125:
    v71 = v5;

  return v71;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_activityType)
    PBDataWriterWriteStringField();
  if (self->_hasBeginningOfActivity)
    PBDataWriterWriteBOOLField();
  if (self->_contentDescription)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_expirationDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasIsEligibleForPrediction)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsPubliclyIndexable)
    PBDataWriterWriteBOOLField();
  if (self->_itemIdentifier)
    PBDataWriterWriteStringField();
  if (self->_raw_itemRelatedContentURL)
    PBDataWriterWriteStringField();
  if (self->_itemRelatedUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasShortcutAvailability)
    PBDataWriterWriteInt32Field();
  if (self->_suggestedInvocationPhrase)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_userActivityRequiredString)
    PBDataWriterWriteStringField();
  if (self->_userActivityUUID)
    PBDataWriterWriteStringField();
  if (self->_sourceID)
    PBDataWriterWriteStringField();
  if (self->_sourceBundleID)
    PBDataWriterWriteStringField();
  if (self->_sourceItemID)
    PBDataWriterWriteStringField();
  if (self->_sourceGroupID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_calendarUserActivityDate)
    PBDataWriterWriteDoubleField();
  if (self->_calendarUserActivityExternalID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_calendarUserActivityEndDate)
    PBDataWriterWriteDoubleField();
  if (self->_locationName)
    PBDataWriterWriteStringField();
  if (self->_hasLatitude)
    PBDataWriterWriteDoubleField();
  if (self->_hasLongitude)
    PBDataWriterWriteDoubleField();
  if (self->_city)
    PBDataWriterWriteStringField();
  if (self->_stateOrProvince)
    PBDataWriterWriteStringField();
  if (self->_country)
    PBDataWriterWriteStringField();
  if (self->_thoroughfare)
    PBDataWriterWriteStringField();
  if (self->_fullyFormattedAddress)
    PBDataWriterWriteStringField();
  if (self->_subThoroughfare)
    PBDataWriterWriteStringField();
  if (self->_postalCode)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_phoneNumbers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_raw_URL)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppLocationActivity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppLocationActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  BMAppLocationActivity *v37;
  id v38;
  uint64_t v39;
  id *v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  BMAppLocationActivity *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  BMAppLocationActivity *v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  void *v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  id v128;
  id v129;
  uint64_t v130;
  id v131;
  id v132;
  id v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  id v137;
  id v138;
  id v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  id v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  uint64_t v148;
  id v149;
  id v150;
  id v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  id v155;
  void *v156;
  id v157;
  uint64_t v158;
  id v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *v165;
  int v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  id v173;
  uint64_t v174;
  void *v175;
  void *v176;
  id v177;
  uint64_t v178;
  id v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  id v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  id v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  void *v196;
  id v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  id v202;
  void *v203;
  id v204;
  uint64_t v205;
  BMAppLocationActivity *v206;
  id v208;
  uint64_t v209;
  void *v210;
  id v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  void *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  id v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  void *v234;
  id v235;
  void *v236;
  id v237;
  id obj;
  void *v239;
  id v240;
  id v241;
  void *v242;
  id v243;
  void *v244;
  id v245;
  id v246;
  void *v247;
  id v248;
  void *v249;
  id v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  id v255;
  void *v256;
  id v257;
  void *v258;
  id v259;
  void *v260;
  void *v261;
  id v262;
  void *v263;
  void *v264;
  id v265;
  void *v266;
  id v267;
  void *v268;
  id v269;
  void *v270;
  id v271;
  void *v272;
  id v273;
  void *v274;
  id v275;
  id v276;
  void *v277;
  id v278;
  void *v279;
  id *v280;
  id v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  BMAppLocationActivity *v288;
  void *v289;
  id v290;
  void *v291;
  id v292;
  void *v293;
  id v294;
  id v295;
  void *v296;
  id *v297;
  id v298;
  void *v299;
  id v300;
  id v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  uint64_t v306;
  void *v307;
  uint64_t v308;
  void *v309;
  uint64_t v310;
  void *v311;
  uint64_t v312;
  void *v313;
  uint64_t v314;
  void *v315;
  _BYTE v316[128];
  uint64_t v317;
  void *v318;
  uint64_t v319;
  id v320;
  uint64_t v321;
  void *v322;
  uint64_t v323;
  id v324;
  uint64_t v325;
  id v326;
  uint64_t v327;
  id v328;
  uint64_t v329;
  id v330;
  uint64_t v331;
  id v332;
  uint64_t v333;
  id v334;
  uint64_t v335;
  id v336;
  uint64_t v337;
  void *v338;
  uint64_t v339;
  id v340;
  uint64_t v341;
  id v342;
  uint64_t v343;
  id v344;
  uint64_t v345;
  id v346;
  uint64_t v347;
  void *v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  id v352;
  uint64_t v353;
  id v354;
  uint64_t v355;
  id v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  id v362;
  uint64_t v363;
  id v364;
  uint64_t v365;
  void *v366;
  uint64_t v367;
  void *v368;
  uint64_t v369;
  void *v370;
  uint64_t v371;
  void *v372;
  uint64_t v373;
  id v374;
  uint64_t v375;
  id v376;
  uint64_t v377;
  id v378;
  uint64_t v379;
  id v380;
  uint64_t v381;
  id *v382;
  uint64_t v383;
  _QWORD v384[3];

  v384[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v301 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v301 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v300 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v300 = v8;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("beginningOfActivity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v297 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v297 = v9;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentDescription"));
        v10 = objc_claimAutoreleasedReturnValue();
        v299 = (void *)v10;
        if (!v10 || (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v298 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v298 = v11;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("expirationDate"));
          v12 = objc_claimAutoreleasedReturnValue();
          v296 = (void *)v12;
          if (!v12 || (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v294 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = v13;
            v31 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v30, "doubleValue");
            v294 = (id)objc_msgSend(v31, "initWithTimeIntervalSince1970:");

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            v55 = v13;
            objc_msgSend(v54, "dateFromString:", v55);
            v294 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v294 = v13;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isEligibleForPrediction"));
            v14 = objc_claimAutoreleasedReturnValue();
            v293 = (void *)v14;
            if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v292 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v292 = v15;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPubliclyIndexable"));
              v16 = objc_claimAutoreleasedReturnValue();
              v288 = self;
              v291 = (void *)v16;
              if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v284 = v7;
                v18 = v8;
                v290 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v284 = v7;
                v18 = v8;
                v290 = v17;
LABEL_22:
                v19 = v9;
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v289 = v20;
                v21 = a4;
                if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v22 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v22 = v20;
LABEL_25:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemRelatedContentURL"));
                  v23 = objc_claimAutoreleasedReturnValue();
                  v287 = v22;
                  v286 = (void *)v23;
                  if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v25 = 0;
LABEL_28:
                    v283 = v25;
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemRelatedUniqueIdentifier"));
                    v26 = objc_claimAutoreleasedReturnValue();
                    v282 = (void *)v26;
                    v280 = v21;
                    if (v26 && (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      v9 = v19;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v8 = v18;
                        if (!v280)
                        {
                          v281 = 0;
                          v37 = 0;
                          v36 = v301;
                          v34 = v300;
                          a4 = v297;
                          v7 = v284;
LABEL_355:

                          goto LABEL_356;
                        }
                        v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v87 = *MEMORY[0x1E0D025B8];
                        v363 = *MEMORY[0x1E0CB2D50];
                        v278 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemRelatedUniqueIdentifier"));
                        v364 = v278;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v364, &v363, 1);
                        v279 = (void *)objc_claimAutoreleasedReturnValue();
                        v281 = 0;
                        v37 = 0;
                        *v280 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2);
                        v36 = v301;
                        v34 = v300;
                        a4 = v297;
                        v7 = v284;
                        goto LABEL_354;
                      }
                      v281 = v27;
                    }
                    else
                    {
                      v281 = 0;
                      v9 = v19;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortcutAvailability"));
                    v28 = objc_claimAutoreleasedReturnValue();
                    v279 = (void *)v28;
                    if (!v28)
                    {
                      v278 = 0;
                      v8 = v18;
                      goto LABEL_67;
                    }
                    v29 = (void *)v28;
                    objc_opt_class();
                    v8 = v18;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v278 = 0;
LABEL_67:
                      v7 = v284;
                      goto LABEL_68;
                    }
                    objc_opt_class();
                    v7 = v284;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v278 = v29;
LABEL_68:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestedInvocationPhrase"));
                      v62 = objc_claimAutoreleasedReturnValue();
                      v277 = (void *)v62;
                      if (!v62 || (v63 = (void *)v62, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v276 = 0;
                        goto LABEL_71;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v276 = v63;
LABEL_71:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
                        v64 = objc_claimAutoreleasedReturnValue();
                        v285 = (void *)v64;
                        if (!v64 || (v65 = (void *)v64, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v275 = 0;
                          goto LABEL_74;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v275 = v65;
LABEL_74:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userActivityRequiredString"));
                          v66 = objc_claimAutoreleasedReturnValue();
                          v274 = (void *)v66;
                          if (!v66 || (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v273 = 0;
                            goto LABEL_77;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v273 = v67;
LABEL_77:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userActivityUUID"));
                            v68 = objc_claimAutoreleasedReturnValue();
                            v272 = (void *)v68;
                            if (!v68 || (v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v271 = 0;
                              goto LABEL_80;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v271 = v69;
LABEL_80:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceID"));
                              v70 = objc_claimAutoreleasedReturnValue();
                              v270 = (void *)v70;
                              if (!v70 || (v71 = (void *)v70, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v269 = 0;
                                goto LABEL_83;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v269 = v71;
LABEL_83:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceBundleID"));
                                v72 = objc_claimAutoreleasedReturnValue();
                                v268 = (void *)v72;
                                if (!v72 || (v73 = (void *)v72, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v267 = 0;
                                  goto LABEL_86;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v267 = v73;
LABEL_86:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceItemID"));
                                  v74 = objc_claimAutoreleasedReturnValue();
                                  v266 = (void *)v74;
                                  if (!v74
                                    || (v75 = (void *)v74, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v265 = 0;
LABEL_89:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceGroupID"));
                                    v76 = (id)objc_claimAutoreleasedReturnValue();
                                    v264 = v76;
                                    if (!v76)
                                      goto LABEL_147;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v76 = 0;
                                      goto LABEL_147;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v76 = v76;
LABEL_147:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calendarUserActivityDate"));
                                      v104 = objc_claimAutoreleasedReturnValue();
                                      v263 = v76;
                                      v261 = (void *)v104;
                                      if (!v104
                                        || (v105 = (void *)v104, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v262 = 0;
                                        goto LABEL_150;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v131 = v105;
                                        v132 = objc_alloc(MEMORY[0x1E0C99D68]);
                                        objc_msgSend(v131, "doubleValue");
                                        v262 = (id)objc_msgSend(v132, "initWithTimeIntervalSinceReferenceDate:");

                                        goto LABEL_150;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v143 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                        v144 = v105;
                                        v145 = v143;
                                        v146 = v144;
                                        objc_msgSend(v145, "dateFromString:", v146);
                                        v262 = (id)objc_claimAutoreleasedReturnValue();

                                        goto LABEL_150;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v262 = v105;
LABEL_150:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calendarUserActivityExternalID"));
                                        v106 = objc_claimAutoreleasedReturnValue();
                                        v260 = (void *)v106;
                                        if (!v106
                                          || (v107 = (void *)v106, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v259 = 0;
                                          goto LABEL_153;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v259 = v107;
LABEL_153:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calendarUserActivityEndDate"));
                                          v108 = objc_claimAutoreleasedReturnValue();
                                          v258 = (void *)v108;
                                          if (!v108
                                            || (v109 = (void *)v108,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v257 = 0;
                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v137 = v109;
                                            v138 = objc_alloc(MEMORY[0x1E0C99D68]);
                                            objc_msgSend(v137, "doubleValue");
                                            v257 = (id)objc_msgSend(v138, "initWithTimeIntervalSinceReferenceDate:");

                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v149 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                            v150 = v258;
                                            objc_msgSend(v149, "dateFromString:", v150);
                                            v257 = (id)objc_claimAutoreleasedReturnValue();

                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v257 = v109;
LABEL_156:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locationName"));
                                            v110 = objc_claimAutoreleasedReturnValue();
                                            v256 = (void *)v110;
                                            if (!v110
                                              || (v111 = (void *)v110,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v255 = 0;
                                              goto LABEL_159;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v255 = v111;
LABEL_159:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latitude"));
                                              v112 = objc_claimAutoreleasedReturnValue();
                                              v254 = (void *)v112;
                                              if (!v112
                                                || (v113 = (void *)v112,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v114 = 0;
                                                goto LABEL_162;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v114 = v113;
LABEL_162:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude"));
                                                v115 = objc_claimAutoreleasedReturnValue();
                                                v253 = v114;
                                                v249 = (void *)v115;
                                                if (!v115
                                                  || (v116 = (void *)v115,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v248 = 0;
                                                  goto LABEL_165;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v248 = v116;
LABEL_165:
                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("city"));
                                                  v117 = objc_claimAutoreleasedReturnValue();
                                                  v247 = (void *)v117;
                                                  if (!v117
                                                    || (v118 = (void *)v117,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v246 = 0;
                                                    goto LABEL_168;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v246 = v118;
LABEL_168:
                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOrProvince"));
                                                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v244 = v119;
                                                    if (!v119
                                                      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v243 = 0;
                                                      goto LABEL_171;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v243 = v119;
LABEL_171:
                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("country"));
                                                      v120 = objc_claimAutoreleasedReturnValue();
                                                      v242 = (void *)v120;
                                                      if (!v120
                                                        || (v121 = (void *)v120,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v241 = 0;
                                                        goto LABEL_174;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v241 = v121;
LABEL_174:
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thoroughfare"));
                                                        v122 = objc_claimAutoreleasedReturnValue();
                                                        v239 = (void *)v122;
                                                        if (!v122
                                                          || (v123 = (void *)v122,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v240 = 0;
                                                          goto LABEL_177;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v240 = v123;
LABEL_177:
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullyFormattedAddress"));
                                                          v124 = objc_claimAutoreleasedReturnValue();
                                                          v236 = (void *)v124;
                                                          if (!v124
                                                            || (v125 = (void *)v124,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v237 = 0;
                                                            goto LABEL_180;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v237 = v125;
LABEL_180:
                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subThoroughfare"));
                                                            v126 = objc_claimAutoreleasedReturnValue();
                                                            v234 = (void *)v126;
                                                            if (!v126
                                                              || (v127 = (void *)v126,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v235 = 0;
LABEL_183:
                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalCode"));
                                                              v128 = (id)objc_claimAutoreleasedReturnValue();
                                                              v233 = v128;
                                                              if (!v128)
                                                              {
LABEL_263:
                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneNumbers"));
                                                                v164 = (void *)objc_claimAutoreleasedReturnValue();
                                                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                v165 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v166 = objc_msgSend(v164, "isEqual:", v165);

                                                                v232 = v128;
                                                                if (v166)
                                                                {

LABEL_268:
                                                                  v167 = 0;
                                                                  goto LABEL_269;
                                                                }
                                                                if (!v164)
                                                                  goto LABEL_268;
                                                                objc_opt_class();
                                                                obj = v164;
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v167 = v164;
LABEL_269:
                                                                  v251 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v167, "count"));
                                                                  v302 = 0u;
                                                                  v303 = 0u;
                                                                  v304 = 0u;
                                                                  v305 = 0u;
                                                                  obj = v167;
                                                                  v168 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v302, v316, 16);
                                                                  if (!v168)
                                                                    goto LABEL_278;
                                                                  v169 = v168;
                                                                  v170 = *(_QWORD *)v303;
LABEL_271:
                                                                  v171 = 0;
                                                                  while (1)
                                                                  {
                                                                    if (*(_QWORD *)v303 != v170)
                                                                      objc_enumerationMutation(obj);
                                                                    v172 = *(void **)(*((_QWORD *)&v302 + 1) + 8 * v171);
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      break;
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                    {
                                                                      if (v280)
                                                                      {
                                                                        v190 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v191 = *MEMORY[0x1E0D025B8];
                                                                        v312 = *MEMORY[0x1E0CB2D50];
                                                                        v230 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("phoneNumbers"));
                                                                        v313 = v230;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v313, &v312, 1);
                                                                        v185 = objc_claimAutoreleasedReturnValue();
                                                                        v186 = v190;
                                                                        v187 = v191;
                                                                        goto LABEL_296;
                                                                      }
                                                                      goto LABEL_305;
                                                                    }
                                                                    v173 = v172;
                                                                    objc_msgSend(v251, "addObject:", v173);

                                                                    if (v169 == ++v171)
                                                                    {
                                                                      v169 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v302, v316, 16);
                                                                      v20 = v289;
                                                                      v119 = v244;
                                                                      if (v169)
                                                                        goto LABEL_271;
LABEL_278:

                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayName"));
                                                                      v174 = objc_claimAutoreleasedReturnValue();
                                                                      v230 = (void *)v174;
                                                                      if (!v174)
                                                                      {
                                                                        v231 = 0;
                                                                        v176 = v287;
                                                                        goto LABEL_319;
                                                                      }
                                                                      v175 = (void *)v174;
                                                                      objc_opt_class();
                                                                      v176 = v287;
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v231 = 0;
                                                                        goto LABEL_319;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v231 = v175;
                                                                        v20 = v289;
                                                                        v119 = v244;
LABEL_319:
                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("URL"));
                                                                        v203 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v228 = v203;
                                                                        if (v203)
                                                                        {
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v203 = 0;
                                                                            goto LABEL_327;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v204 = v203;
                                                                            v205 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v204);
                                                                            if (v205)
                                                                            {
                                                                              v203 = (void *)v205;

                                                                              goto LABEL_327;
                                                                            }
                                                                            v215 = v204;
                                                                            if (v280)
                                                                            {
                                                                              v245 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v216 = *MEMORY[0x1E0D025B8];
                                                                              v308 = *MEMORY[0x1E0CB2D50];
                                                                              v217 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithString: for %@ returned nil"), CFSTR("URL"));
                                                                              v309 = v217;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v309, &v308, 1);
                                                                              v218 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              *v280 = (id)objc_msgSend(v245, "initWithDomain:code:userInfo:", v216, 2, v218);

                                                                            }
                                                                            v219 = v215;

                                                                            v37 = 0;
                                                                            v229 = v219;
                                                                            v36 = v301;
                                                                            v34 = v300;
                                                                            a4 = v297;
                                                                            v20 = v289;

LABEL_330:
                                                                            v196 = v231;
LABEL_331:

                                                                            goto LABEL_332;
                                                                          }
                                                                          if (v280)
                                                                          {
                                                                            v211 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v212 = *MEMORY[0x1E0D025B8];
                                                                            v306 = *MEMORY[0x1E0CB2D50];
                                                                            v213 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("URL"));
                                                                            v307 = v213;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v307, &v306, 1);
                                                                            v214 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            *v280 = (id)objc_msgSend(v211, "initWithDomain:code:userInfo:", v212, 2, v214);

                                                                            v20 = v289;
                                                                          }
                                                                          v37 = 0;
                                                                          v36 = v301;
                                                                          v34 = v300;
LABEL_297:
                                                                          a4 = v297;
LABEL_329:

                                                                          goto LABEL_330;
                                                                        }
LABEL_327:
                                                                        v227 = v128;
                                                                        v226 = v176;
                                                                        v36 = v301;
                                                                        v34 = v300;
                                                                        a4 = v297;
                                                                        v206 = objc_retain(-[BMAppLocationActivity initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:](v288, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:", v301,
                                                                                   v300,
                                                                                   v297,
                                                                                   v298,
                                                                                   v294,
                                                                                   v292,
                                                                                   v290,
                                                                                   v226,
                                                                                   v283,
                                                                                   v281,
                                                                                   v278,
                                                                                   v276,
                                                                                   v275,
                                                                                   v273,
                                                                                   v271,
                                                                                   v269,
                                                                                   v267,
                                                                                   v265,
                                                                                   v263,
                                                                                   v262,
                                                                                   v259,
                                                                                   v257,
                                                                                   v255,
                                                                                   v253,
                                                                                   v248,
                                                                                   v246,
                                                                                   v243,
                                                                                   v241,
                                                                                   v240,
                                                                                   v237,
                                                                                   v235,
                                                                                   v227,
                                                                                   v251,
                                                                                   v231,
                                                                                   v203));

                                                                        v288 = v206;
                                                                        v37 = v206;
                                                                      }
                                                                      else
                                                                      {
                                                                        if (!v280)
                                                                        {
                                                                          v231 = 0;
                                                                          v37 = 0;
                                                                          v36 = v301;
                                                                          v34 = v300;
                                                                          a4 = v297;
                                                                          v20 = v289;
                                                                          v119 = v244;
                                                                          goto LABEL_330;
                                                                        }
                                                                        v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v209 = *MEMORY[0x1E0D025B8];
                                                                        v310 = *MEMORY[0x1E0CB2D50];
                                                                        v228 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("displayName"));
                                                                        v311 = v228;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v311, &v310, 1);
                                                                        v210 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        *v280 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v209, 2, v210);

                                                                        v231 = 0;
                                                                        v37 = 0;
                                                                        v36 = v301;
                                                                        v34 = v300;
                                                                        a4 = v297;
                                                                        v20 = v289;
                                                                      }
                                                                      v119 = v244;
                                                                      goto LABEL_329;
                                                                    }
                                                                  }
                                                                  if (v280)
                                                                  {
                                                                    v183 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v184 = *MEMORY[0x1E0D025B8];
                                                                    v314 = *MEMORY[0x1E0CB2D50];
                                                                    v230 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("phoneNumbers"));
                                                                    v315 = v230;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v315, &v314, 1);
                                                                    v185 = objc_claimAutoreleasedReturnValue();
                                                                    v186 = v183;
                                                                    v187 = v184;
LABEL_296:
                                                                    v228 = (void *)v185;
                                                                    v36 = v301;
                                                                    v34 = v300;
                                                                    v20 = v289;
                                                                    v119 = v244;
                                                                    v37 = 0;
                                                                    *v280 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v187, 2);
                                                                    v231 = obj;
                                                                    goto LABEL_297;
                                                                  }
LABEL_305:
                                                                  v37 = 0;
                                                                  v196 = obj;
                                                                  v36 = v301;
                                                                  v34 = v300;
                                                                  a4 = v297;
                                                                  v20 = v289;
                                                                  v119 = v244;
                                                                  goto LABEL_331;
                                                                }
                                                                if (v280)
                                                                {
                                                                  v199 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v200 = *MEMORY[0x1E0D025B8];
                                                                  v317 = *MEMORY[0x1E0CB2D50];
                                                                  v251 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("phoneNumbers"));
                                                                  v318 = v251;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v318, &v317, 1);
                                                                  v201 = objc_claimAutoreleasedReturnValue();
                                                                  v202 = (id)objc_msgSend(v199, "initWithDomain:code:userInfo:", v200, 2, v201);
                                                                  v37 = 0;
                                                                  *v280 = v202;
                                                                  v196 = (void *)v201;
                                                                  v36 = v301;
                                                                  v34 = v300;
                                                                  a4 = v297;
                                                                  goto LABEL_331;
                                                                }
                                                                v37 = 0;
                                                                v36 = v301;
                                                                v34 = v300;
                                                                a4 = v297;
LABEL_332:

                                                                goto LABEL_333;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v128 = 0;
                                                                goto LABEL_263;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v128 = v128;
                                                                goto LABEL_263;
                                                              }
                                                              if (v280)
                                                              {
                                                                v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v198 = *MEMORY[0x1E0D025B8];
                                                                v319 = *MEMORY[0x1E0CB2D50];
                                                                obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("postalCode"));
                                                                v320 = obj;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v320, &v319, 1);
                                                                v252 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v232 = 0;
                                                                v37 = 0;
                                                                *v280 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v198, 2);
                                                                v36 = v301;
                                                                v34 = v300;
                                                                a4 = v297;

                                                                goto LABEL_332;
                                                              }
                                                              v232 = 0;
                                                              v37 = 0;
LABEL_370:
                                                              v36 = v301;
                                                              v34 = v300;
                                                              a4 = v297;
LABEL_333:

LABEL_334:
                                                              goto LABEL_335;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v235 = v127;
                                                              goto LABEL_183;
                                                            }
                                                            if (v280)
                                                            {
                                                              v194 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v195 = *MEMORY[0x1E0D025B8];
                                                              v321 = *MEMORY[0x1E0CB2D50];
                                                              v232 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subThoroughfare"));
                                                              v322 = v232;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v322, &v321, 1);
                                                              v233 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v235 = 0;
                                                              v37 = 0;
                                                              *v280 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v195, 2);
                                                              goto LABEL_370;
                                                            }
                                                            v235 = 0;
                                                            v37 = 0;
LABEL_368:
                                                            v36 = v301;
                                                            v34 = v300;
                                                            a4 = v297;
                                                            goto LABEL_334;
                                                          }
                                                          if (v280)
                                                          {
                                                            v188 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v189 = *MEMORY[0x1E0D025B8];
                                                            v323 = *MEMORY[0x1E0CB2D50];
                                                            v235 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fullyFormattedAddress"));
                                                            v324 = v235;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v324, &v323, 1);
                                                            v234 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v237 = 0;
                                                            v37 = 0;
                                                            *v280 = (id)objc_msgSend(v188, "initWithDomain:code:userInfo:", v189, 2);
                                                            goto LABEL_368;
                                                          }
                                                          v237 = 0;
                                                          v37 = 0;
LABEL_323:
                                                          v36 = v301;
                                                          v34 = v300;
                                                          a4 = v297;
LABEL_335:

                                                          goto LABEL_336;
                                                        }
                                                        if (v280)
                                                        {
                                                          v179 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v180 = *MEMORY[0x1E0D025B8];
                                                          v325 = *MEMORY[0x1E0CB2D50];
                                                          v237 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("thoroughfare"));
                                                          v326 = v237;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v326, &v325, 1);
                                                          v236 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v240 = 0;
                                                          v37 = 0;
                                                          *v280 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v180, 2);
                                                          goto LABEL_323;
                                                        }
                                                        v240 = 0;
                                                        v37 = 0;
LABEL_315:
                                                        v36 = v301;
                                                        v34 = v300;
                                                        a4 = v297;
LABEL_336:

                                                        goto LABEL_337;
                                                      }
                                                      if (v280)
                                                      {
                                                        v177 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v178 = *MEMORY[0x1E0D025B8];
                                                        v327 = *MEMORY[0x1E0CB2D50];
                                                        v240 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("country"));
                                                        v328 = v240;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v328, &v327, 1);
                                                        v239 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v241 = 0;
                                                        v37 = 0;
                                                        *v280 = (id)objc_msgSend(v177, "initWithDomain:code:userInfo:", v178, 2);
                                                        goto LABEL_315;
                                                      }
                                                      v241 = 0;
                                                      v37 = 0;
                                                      v36 = v301;
                                                      v34 = v300;
                                                      a4 = v297;
LABEL_337:

                                                      goto LABEL_338;
                                                    }
                                                    if (v280)
                                                    {
                                                      v250 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v163 = *MEMORY[0x1E0D025B8];
                                                      v329 = *MEMORY[0x1E0CB2D50];
                                                      v241 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("stateOrProvince"));
                                                      v330 = v241;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
                                                      v242 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v243 = 0;
                                                      v37 = 0;
                                                      *v280 = (id)objc_msgSend(v250, "initWithDomain:code:userInfo:", v163, 2);
                                                      v36 = v301;
                                                      v34 = v300;
                                                      a4 = v297;
                                                      goto LABEL_337;
                                                    }
                                                    v243 = 0;
                                                    v37 = 0;
                                                    v36 = v301;
                                                    v34 = v300;
                                                    a4 = v297;
LABEL_338:

                                                    goto LABEL_339;
                                                  }
                                                  if (v280)
                                                  {
                                                    v161 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v162 = *MEMORY[0x1E0D025B8];
                                                    v331 = *MEMORY[0x1E0CB2D50];
                                                    v243 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("city"));
                                                    v332 = v243;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v332, &v331, 1);
                                                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v246 = 0;
                                                    v37 = 0;
                                                    *v280 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v162, 2, v119);
                                                    v36 = v301;
                                                    v34 = v300;
                                                    a4 = v297;
                                                    goto LABEL_338;
                                                  }
                                                  v246 = 0;
                                                  v37 = 0;
                                                  v36 = v301;
                                                  v34 = v300;
                                                  a4 = v297;
LABEL_339:

                                                  goto LABEL_340;
                                                }
                                                if (v280)
                                                {
                                                  v157 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v158 = *MEMORY[0x1E0D025B8];
                                                  v333 = *MEMORY[0x1E0CB2D50];
                                                  v159 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v225 = objc_opt_class();
                                                  v160 = v159;
                                                  v20 = v289;
                                                  v246 = (id)objc_msgSend(v160, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v225, CFSTR("longitude"));
                                                  v334 = v246;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v334, &v333, 1);
                                                  v247 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v248 = 0;
                                                  v37 = 0;
                                                  *v280 = (id)objc_msgSend(v157, "initWithDomain:code:userInfo:", v158, 2);
                                                  v36 = v301;
                                                  v34 = v300;
                                                  a4 = v297;
                                                  goto LABEL_339;
                                                }
                                                v248 = 0;
                                                v37 = 0;
LABEL_299:
                                                v36 = v301;
                                                v34 = v300;
                                                a4 = v297;
LABEL_340:

                                                goto LABEL_341;
                                              }
                                              if (v280)
                                              {
                                                v153 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v154 = *MEMORY[0x1E0D025B8];
                                                v335 = *MEMORY[0x1E0CB2D50];
                                                v155 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v224 = objc_opt_class();
                                                v156 = v155;
                                                v20 = v289;
                                                v248 = (id)objc_msgSend(v156, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v224, CFSTR("latitude"));
                                                v336 = v248;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v336, &v335, 1);
                                                v249 = (void *)objc_claimAutoreleasedReturnValue();
                                                v253 = 0;
                                                v37 = 0;
                                                *v280 = (id)objc_msgSend(v153, "initWithDomain:code:userInfo:", v154, 2);
                                                goto LABEL_299;
                                              }
                                              v253 = 0;
                                              v37 = 0;
                                              v36 = v301;
                                              v34 = v300;
                                              a4 = v297;
LABEL_341:

                                              goto LABEL_342;
                                            }
                                            if (v280)
                                            {
                                              v151 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v152 = *MEMORY[0x1E0D025B8];
                                              v337 = *MEMORY[0x1E0CB2D50];
                                              v253 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("locationName"));
                                              v338 = v253;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v338, &v337, 1);
                                              v254 = (void *)objc_claimAutoreleasedReturnValue();
                                              v255 = 0;
                                              v37 = 0;
                                              *v280 = (id)objc_msgSend(v151, "initWithDomain:code:userInfo:", v152, 2);
                                              v36 = v301;
                                              v34 = v300;
                                              a4 = v297;
                                              goto LABEL_341;
                                            }
                                            v255 = 0;
                                            v37 = 0;
LABEL_302:
                                            v36 = v301;
                                            v34 = v300;
                                            a4 = v297;
LABEL_342:

                                            goto LABEL_343;
                                          }
                                          if (v280)
                                          {
                                            v192 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v193 = *MEMORY[0x1E0D025B8];
                                            v339 = *MEMORY[0x1E0CB2D50];
                                            v255 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("calendarUserActivityEndDate"));
                                            v340 = v255;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v340, &v339, 1);
                                            v256 = (void *)objc_claimAutoreleasedReturnValue();
                                            v257 = 0;
                                            v37 = 0;
                                            *v280 = (id)objc_msgSend(v192, "initWithDomain:code:userInfo:", v193, 2);
                                            goto LABEL_302;
                                          }
                                          v257 = 0;
                                          v37 = 0;
LABEL_221:
                                          v36 = v301;
                                          v34 = v300;
                                          a4 = v297;
LABEL_343:

                                          goto LABEL_344;
                                        }
                                        if (v280)
                                        {
                                          v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v148 = *MEMORY[0x1E0D025B8];
                                          v341 = *MEMORY[0x1E0CB2D50];
                                          v257 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("calendarUserActivityExternalID"));
                                          v342 = v257;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v342, &v341, 1);
                                          v258 = (void *)objc_claimAutoreleasedReturnValue();
                                          v259 = 0;
                                          v37 = 0;
                                          *v280 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v148, 2);
                                          goto LABEL_221;
                                        }
                                        v259 = 0;
                                        v37 = 0;
LABEL_288:
                                        v36 = v301;
                                        v34 = v300;
                                        a4 = v297;
LABEL_344:

                                        goto LABEL_345;
                                      }
                                      if (v280)
                                      {
                                        v181 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v182 = *MEMORY[0x1E0D025B8];
                                        v343 = *MEMORY[0x1E0CB2D50];
                                        v259 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("calendarUserActivityDate"));
                                        v344 = v259;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v344, &v343, 1);
                                        v260 = (void *)objc_claimAutoreleasedReturnValue();
                                        v262 = 0;
                                        v37 = 0;
                                        *v280 = (id)objc_msgSend(v181, "initWithDomain:code:userInfo:", v182, 2);
                                        goto LABEL_288;
                                      }
                                      v262 = 0;
                                      v37 = 0;
LABEL_211:
                                      v36 = v301;
                                      v34 = v300;
                                      a4 = v297;
LABEL_345:

                                      goto LABEL_346;
                                    }
                                    if (v280)
                                    {
                                      v141 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v142 = *MEMORY[0x1E0D025B8];
                                      v345 = *MEMORY[0x1E0CB2D50];
                                      v262 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceGroupID"));
                                      v346 = v262;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v346, &v345, 1);
                                      v261 = (void *)objc_claimAutoreleasedReturnValue();
                                      v263 = 0;
                                      v37 = 0;
                                      *v280 = (id)objc_msgSend(v141, "initWithDomain:code:userInfo:", v142, 2);
                                      goto LABEL_211;
                                    }
                                    v263 = 0;
                                    v37 = 0;
LABEL_253:
                                    v36 = v301;
                                    v34 = v300;
                                    a4 = v297;
LABEL_346:

                                    goto LABEL_347;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v265 = v75;
                                    goto LABEL_89;
                                  }
                                  if (v280)
                                  {
                                    v139 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v140 = *MEMORY[0x1E0D025B8];
                                    v347 = *MEMORY[0x1E0CB2D50];
                                    v263 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceItemID"));
                                    v348 = v263;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v348, &v347, 1);
                                    v264 = (void *)objc_claimAutoreleasedReturnValue();
                                    v265 = 0;
                                    v37 = 0;
                                    *v280 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v140, 2);
                                    goto LABEL_253;
                                  }
                                  v265 = 0;
                                  v37 = 0;
LABEL_245:
                                  v36 = v301;
                                  v34 = v300;
                                  a4 = v297;
LABEL_347:

                                  goto LABEL_348;
                                }
                                if (v280)
                                {
                                  v135 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v136 = *MEMORY[0x1E0D025B8];
                                  v349 = *MEMORY[0x1E0CB2D50];
                                  v265 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceBundleID"));
                                  v350 = v265;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v350, &v349, 1);
                                  v266 = (void *)objc_claimAutoreleasedReturnValue();
                                  v267 = 0;
                                  v37 = 0;
                                  *v280 = (id)objc_msgSend(v135, "initWithDomain:code:userInfo:", v136, 2);
                                  goto LABEL_245;
                                }
                                v267 = 0;
                                v37 = 0;
LABEL_239:
                                v36 = v301;
                                v34 = v300;
                                a4 = v297;
LABEL_348:

                                goto LABEL_349;
                              }
                              if (v280)
                              {
                                v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v134 = *MEMORY[0x1E0D025B8];
                                v351 = *MEMORY[0x1E0CB2D50];
                                v267 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceID"));
                                v352 = v267;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v352, &v351, 1);
                                v268 = (void *)objc_claimAutoreleasedReturnValue();
                                v269 = 0;
                                v37 = 0;
                                *v280 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v134, 2);
                                goto LABEL_239;
                              }
                              v269 = 0;
                              v37 = 0;
LABEL_233:
                              v36 = v301;
                              v34 = v300;
                              a4 = v297;
LABEL_349:

                              goto LABEL_350;
                            }
                            if (v280)
                            {
                              v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v130 = *MEMORY[0x1E0D025B8];
                              v353 = *MEMORY[0x1E0CB2D50];
                              v269 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userActivityUUID"));
                              v354 = v269;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v354, &v353, 1);
                              v270 = (void *)objc_claimAutoreleasedReturnValue();
                              v271 = 0;
                              v37 = 0;
                              *v280 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
                              goto LABEL_233;
                            }
                            v271 = 0;
                            v37 = 0;
LABEL_225:
                            v36 = v301;
                            v34 = v300;
                            a4 = v297;
LABEL_350:

                            goto LABEL_351;
                          }
                          if (v280)
                          {
                            v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v99 = *MEMORY[0x1E0D025B8];
                            v355 = *MEMORY[0x1E0CB2D50];
                            v271 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userActivityRequiredString"));
                            v356 = v271;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v356, &v355, 1);
                            v272 = (void *)objc_claimAutoreleasedReturnValue();
                            v273 = 0;
                            v37 = 0;
                            *v280 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2);
                            goto LABEL_225;
                          }
                          v273 = 0;
                          v37 = 0;
LABEL_216:
                          v36 = v301;
                          v34 = v300;
                          a4 = v297;
LABEL_351:

                          goto LABEL_352;
                        }
                        if (v280)
                        {
                          v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v95 = *MEMORY[0x1E0D025B8];
                          v357 = *MEMORY[0x1E0CB2D50];
                          v273 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
                          v358 = v273;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v358, &v357, 1);
                          v274 = (void *)objc_claimAutoreleasedReturnValue();
                          v275 = 0;
                          v37 = 0;
                          *v280 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v95, 2);
                          goto LABEL_216;
                        }
                        v275 = 0;
                        v37 = 0;
LABEL_208:
                        v36 = v301;
                        v34 = v300;
                        a4 = v297;
LABEL_352:

                        goto LABEL_353;
                      }
                      if (v280)
                      {
                        v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v93 = *MEMORY[0x1E0D025B8];
                        v359 = *MEMORY[0x1E0CB2D50];
                        v275 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestedInvocationPhrase"));
                        v360 = v275;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v360, &v359, 1);
                        v285 = (void *)objc_claimAutoreleasedReturnValue();
                        v276 = 0;
                        v37 = 0;
                        *v280 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v93, 2);
                        goto LABEL_208;
                      }
                      v276 = 0;
                      v37 = 0;
                      v36 = v301;
                      v34 = v300;
                      a4 = v297;
LABEL_353:

                      goto LABEL_354;
                    }
                    if (v280)
                    {
                      v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v89 = *MEMORY[0x1E0D025B8];
                      v361 = *MEMORY[0x1E0CB2D50];
                      v90 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v223 = objc_opt_class();
                      v91 = v90;
                      v20 = v289;
                      v276 = (id)objc_msgSend(v91, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v223, CFSTR("shortcutAvailability"));
                      v362 = v276;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v362, &v361, 1);
                      v277 = (void *)objc_claimAutoreleasedReturnValue();
                      v278 = 0;
                      v37 = 0;
                      *v280 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                      v36 = v301;
                      v34 = v300;
                      a4 = v297;
                      goto LABEL_353;
                    }
                    v278 = 0;
                    v37 = 0;
                    v36 = v301;
                    v34 = v300;
                    a4 = v297;
LABEL_354:

                    goto LABEL_355;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v51 = v24;
                    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v51);
                    if (v52)
                    {
                      v53 = v52;

                      v25 = (void *)v53;
                      goto LABEL_28;
                    }
                    v283 = v51;
                    if (v21)
                    {
                      v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v101 = *MEMORY[0x1E0D025B8];
                      v367 = *MEMORY[0x1E0CB2D50];
                      v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithString: for %@ returned nil"), CFSTR("itemRelatedContentURL"));
                      v368 = v102;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v368, &v367, 1);
                      v103 = (void *)objc_claimAutoreleasedReturnValue();
                      *v21 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v101, 2, v103);

                    }
                    v37 = 0;
                    v286 = v51;
                  }
                  else
                  {
                    if (!v21)
                    {
                      v37 = 0;
                      v36 = v301;
                      v34 = v300;
                      a4 = v297;
                      v9 = v19;
                      v8 = v18;
                      v7 = v284;
LABEL_357:

                      goto LABEL_358;
                    }
                    v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v84 = *MEMORY[0x1E0D025B8];
                    v365 = *MEMORY[0x1E0CB2D50];
                    v283 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemRelatedContentURL"));
                    v366 = v283;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v366, &v365, 1);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    *v21 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2, v85);

                    v37 = 0;
                  }
                  v36 = v301;
                  v34 = v300;
                  a4 = v297;
                  v20 = v289;
LABEL_143:
                  v9 = v19;
                  v8 = v18;
                  v7 = v284;
LABEL_356:

                  goto LABEL_357;
                }
                if (a4)
                {
                  v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v80 = *MEMORY[0x1E0D025B8];
                  v369 = *MEMORY[0x1E0CB2D50];
                  v81 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v222 = objc_opt_class();
                  v82 = v81;
                  v20 = v289;
                  v286 = (void *)objc_msgSend(v82, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v222, CFSTR("itemIdentifier"));
                  v370 = v286;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v370, &v369, 1);
                  v283 = (void *)objc_claimAutoreleasedReturnValue();
                  v287 = 0;
                  v37 = 0;
                  *a4 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2);
                  v36 = v301;
                  v34 = v300;
                  a4 = v297;
                  goto LABEL_143;
                }
                v287 = 0;
                v37 = 0;
                v36 = v301;
                v34 = v300;
                a4 = v297;
                v9 = v19;
                v8 = v18;
                v7 = v284;
LABEL_358:

                self = v288;
                goto LABEL_359;
              }
              if (a4)
              {
                v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v78 = *MEMORY[0x1E0D025B8];
                v371 = *MEMORY[0x1E0CB2D50];
                v287 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isPubliclyIndexable"));
                v372 = v287;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v372, &v371, 1);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v290 = 0;
                v37 = 0;
                *a4 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v78, 2, v20);
                v36 = v301;
                v34 = v300;
                a4 = v297;
                goto LABEL_358;
              }
              v290 = 0;
              v37 = 0;
LABEL_126:
              v36 = v301;
              v34 = v300;
              a4 = v297;
LABEL_359:

              goto LABEL_360;
            }
            if (a4)
            {
              v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v57 = *MEMORY[0x1E0D025B8];
              v373 = *MEMORY[0x1E0CB2D50];
              v58 = self;
              v59 = objc_alloc(MEMORY[0x1E0CB3940]);
              v221 = objc_opt_class();
              v60 = v59;
              self = v58;
              v290 = (id)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v221, CFSTR("isEligibleForPrediction"));
              v374 = v290;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v374, &v373, 1);
              v291 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 2);
              v292 = 0;
              v37 = 0;
              *a4 = v61;
              goto LABEL_126;
            }
            v292 = 0;
            v37 = 0;
LABEL_134:
            v36 = v301;
            v34 = v300;
            a4 = v297;
LABEL_360:

            goto LABEL_361;
          }
          if (a4)
          {
            v295 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v96 = *MEMORY[0x1E0D025B8];
            v375 = *MEMORY[0x1E0CB2D50];
            v292 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("expirationDate"));
            v376 = v292;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v376, &v375, 1);
            v293 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = (id)objc_msgSend(v295, "initWithDomain:code:userInfo:", v96, 2);
            v294 = 0;
            v37 = 0;
            *a4 = v97;
            goto LABEL_134;
          }
          v294 = 0;
          v37 = 0;
LABEL_58:
          v36 = v301;
          v34 = v300;
          a4 = v297;
LABEL_361:

          goto LABEL_362;
        }
        if (a4)
        {
          v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v46 = *MEMORY[0x1E0D025B8];
          v377 = *MEMORY[0x1E0CB2D50];
          v47 = self;
          v48 = objc_alloc(MEMORY[0x1E0CB3940]);
          v220 = objc_opt_class();
          v49 = v48;
          self = v47;
          v294 = (id)objc_msgSend(v49, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v220, CFSTR("contentDescription"));
          v378 = v294;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v378, &v377, 1);
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2);
          v298 = 0;
          v37 = 0;
          *a4 = v50;
          goto LABEL_58;
        }
        v298 = 0;
        v37 = 0;
        v36 = v301;
        v34 = v300;
        a4 = v297;
LABEL_362:

        goto LABEL_363;
      }
      if (a4)
      {
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v379 = *MEMORY[0x1E0CB2D50];
        v298 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("beginningOfActivity"));
        v380 = v298;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v380, &v379, 1);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2);
        v37 = 0;
        *a4 = v44;
        a4 = 0;
        v36 = v301;
        v34 = v300;
        goto LABEL_362;
      }
      v37 = 0;
      v36 = v301;
      v34 = v300;
LABEL_363:

      goto LABEL_364;
    }
    if (a4)
    {
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v39 = *MEMORY[0x1E0D025B8];
      v381 = *MEMORY[0x1E0CB2D50];
      v40 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activityType"));
      v382 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v382, &v381, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v9);
      v34 = 0;
      v37 = 0;
      *a4 = v41;
      a4 = v40;
      v36 = v301;
      goto LABEL_363;
    }
    v34 = 0;
    v37 = 0;
    v36 = v301;
LABEL_364:

    goto LABEL_365;
  }
  if (a4)
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = *MEMORY[0x1E0D025B8];
    v383 = *MEMORY[0x1E0CB2D50];
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
    v384[0] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v384, &v383, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v8);
    v36 = 0;
    v37 = 0;
    *a4 = v35;
    goto LABEL_364;
  }
  v36 = 0;
  v37 = 0;
LABEL_365:

  return v37;
}

- (id)_phoneNumbersJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMAppLocationActivity phoneNumbers](self, "phoneNumbers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
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
  id v86;
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
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  _QWORD v124[35];
  _QWORD v125[37];

  v125[35] = *MEMORY[0x1E0C80C00];
  -[BMAppLocationActivity bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity activityType](self, "activityType");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMAppLocationActivity hasBeginningOfActivity](self, "hasBeginningOfActivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLocationActivity beginningOfActivity](self, "beginningOfActivity"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[BMAppLocationActivity contentDescription](self, "contentDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppLocationActivity expirationDate](self, "expirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  if (-[BMAppLocationActivity hasIsEligibleForPrediction](self, "hasIsEligibleForPrediction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLocationActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
    v123 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v123 = 0;
  }
  if (-[BMAppLocationActivity hasIsPubliclyIndexable](self, "hasIsPubliclyIndexable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLocationActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
    v122 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v122 = 0;
  }
  -[BMAppLocationActivity itemIdentifier](self, "itemIdentifier");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity itemRelatedContentURL](self, "itemRelatedContentURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppLocationActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAppLocationActivity hasShortcutAvailability](self, "hasShortcutAvailability"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppLocationActivity shortcutAvailability](self, "shortcutAvailability"));
    v118 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v118 = 0;
  }
  -[BMAppLocationActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity title](self, "title");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity userActivityRequiredString](self, "userActivityRequiredString");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity userActivityUUID](self, "userActivityUUID");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceID](self, "sourceID");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceBundleID](self, "sourceBundleID");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceItemID](self, "sourceItemID");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity sourceGroupID](self, "sourceGroupID");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity calendarUserActivityDate](self, "calendarUserActivityDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppLocationActivity calendarUserActivityDate](self, "calendarUserActivityDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "numberWithDouble:");
    v109 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v109 = 0;
  }

  -[BMAppLocationActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppLocationActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    objc_msgSend(v16, "numberWithDouble:");
    v107 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v107 = 0;
  }

  -[BMAppLocationActivity locationName](self, "locationName");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMAppLocationActivity hasLatitude](self, "hasLatitude")
    || (-[BMAppLocationActivity latitude](self, "latitude"), fabs(v18) == INFINITY))
  {
    v105 = 0;
  }
  else
  {
    -[BMAppLocationActivity latitude](self, "latitude");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppLocationActivity latitude](self, "latitude");
    objc_msgSend(v19, "numberWithDouble:");
    v105 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAppLocationActivity hasLongitude](self, "hasLongitude")
    || (-[BMAppLocationActivity longitude](self, "longitude"), fabs(v20) == INFINITY))
  {
    v22 = 0;
  }
  else
  {
    -[BMAppLocationActivity longitude](self, "longitude");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppLocationActivity longitude](self, "longitude");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMAppLocationActivity city](self, "city");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity stateOrProvince](self, "stateOrProvince");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity country](self, "country");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity thoroughfare](self, "thoroughfare");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity fullyFormattedAddress](self, "fullyFormattedAddress");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity subThoroughfare](self, "subThoroughfare");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity postalCode](self, "postalCode");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity _phoneNumbersJSONArray](self, "_phoneNumbersJSONArray");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity displayName](self, "displayName");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppLocationActivity URL](self, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v24 = objc_claimAutoreleasedReturnValue();

  v124[0] = CFSTR("bundleID");
  v25 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v85 = (void *)v25;
  v125[0] = v25;
  v124[1] = CFSTR("activityType");
  v26 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v84 = (void *)v26;
  v125[1] = v26;
  v124[2] = CFSTR("beginningOfActivity");
  v27 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v83 = (void *)v27;
  v125[2] = v27;
  v124[3] = CFSTR("contentDescription");
  v28 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)v28;
  v125[3] = v28;
  v124[4] = CFSTR("expirationDate");
  v29 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)v29;
  v125[4] = v29;
  v124[5] = CFSTR("isEligibleForPrediction");
  v30 = (uint64_t)v123;
  if (!v123)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v87 = (void *)v6;
  v125[5] = v30;
  v124[6] = CFSTR("isPubliclyIndexable");
  v31 = (uint64_t)v122;
  if (!v122)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v125[6] = v31;
  v124[7] = CFSTR("itemIdentifier");
  v32 = v121;
  if (!v121)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v125[7] = v32;
  v124[8] = CFSTR("itemRelatedContentURL");
  v33 = (uint64_t)v120;
  if (!v120)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v91 = (void *)v33;
  v125[8] = v33;
  v124[9] = CFSTR("itemRelatedUniqueIdentifier");
  v34 = (uint64_t)v119;
  if (!v119)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v34;
  v125[9] = v34;
  v124[10] = CFSTR("shortcutAvailability");
  v35 = (uint64_t)v118;
  if (!v118)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)v35;
  v125[10] = v35;
  v124[11] = CFSTR("suggestedInvocationPhrase");
  v36 = (uint64_t)v117;
  if (!v117)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v89 = (void *)v36;
  v125[11] = v36;
  v124[12] = CFSTR("title");
  v37 = (uint64_t)v116;
  if (!v116)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v37;
  v125[12] = v37;
  v124[13] = CFSTR("userActivityRequiredString");
  v39 = (uint64_t)v115;
  if (!v115)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v77 = (void *)v39;
  v125[13] = v39;
  v124[14] = CFSTR("userActivityUUID");
  v40 = (uint64_t)v114;
  if (!v114)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v76 = (void *)v40;
  v125[14] = v40;
  v124[15] = CFSTR("sourceID");
  v41 = (uint64_t)v113;
  if (!v113)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v41;
  v125[15] = v41;
  v124[16] = CFSTR("sourceBundleID");
  v42 = (uint64_t)v112;
  if (!v112)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v42;
  v125[16] = v42;
  v124[17] = CFSTR("sourceItemID");
  v43 = (uint64_t)v111;
  if (!v111)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v43;
  v125[17] = v43;
  v124[18] = CFSTR("sourceGroupID");
  v44 = (uint64_t)v110;
  if (!v110)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v44;
  v125[18] = v44;
  v124[19] = CFSTR("calendarUserActivityDate");
  v45 = (uint64_t)v109;
  if (!v109)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v45;
  v125[19] = v45;
  v124[20] = CFSTR("calendarUserActivityExternalID");
  v46 = (uint64_t)v108;
  if (!v108)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v46;
  v125[20] = v46;
  v124[21] = CFSTR("calendarUserActivityEndDate");
  v47 = (uint64_t)v107;
  if (!v107)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v47;
  v125[21] = v47;
  v124[22] = CFSTR("locationName");
  v48 = (uint64_t)v106;
  if (!v106)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v48;
  v125[22] = v48;
  v124[23] = CFSTR("latitude");
  v49 = (uint64_t)v105;
  if (!v105)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v4;
  v67 = (void *)v49;
  v125[23] = v49;
  v124[24] = CFSTR("longitude");
  v50 = (uint64_t)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v50;
  v125[24] = v50;
  v124[25] = CFSTR("city");
  v51 = (uint64_t)v104;
  if (!v104)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v51;
  v125[25] = v51;
  v124[26] = CFSTR("stateOrProvince");
  v52 = (uint64_t)v103;
  if (!v103)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v52;
  v125[26] = v52;
  v124[27] = CFSTR("country");
  v53 = (uint64_t)v102;
  if (!v102)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v24;
  v63 = (void *)v53;
  v125[27] = v53;
  v124[28] = CFSTR("thoroughfare");
  v54 = v101;
  if (!v101)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v92 = v22;
  v93 = v5;
  v125[28] = v54;
  v124[29] = CFSTR("fullyFormattedAddress");
  v55 = v100;
  if (!v100)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v88 = v10;
  v125[29] = v55;
  v124[30] = CFSTR("subThoroughfare");
  v56 = v99;
  if (!v99)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v31;
  v125[30] = v56;
  v124[31] = CFSTR("postalCode");
  v57 = v98;
  if (!v98)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v125[31] = v57;
  v124[32] = CFSTR("phoneNumbers");
  v58 = v97;
  if (!v97)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v30;
  v125[32] = v58;
  v124[33] = CFSTR("displayName");
  v59 = v96;
  if (!v96)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v125[33] = v59;
  v124[34] = CFSTR("URL");
  v60 = v95;
  if (!v95)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v125[34] = v60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 35);
  v86 = (id)objc_claimAutoreleasedReturnValue();
  if (!v95)

  v61 = v38;
  if (!v96)
  {

    v61 = v38;
  }
  if (!v97)
  {

    v61 = v38;
  }
  if (!v98)
  {

    v61 = v38;
  }
  if (!v99)
  {

    v61 = v38;
  }
  if (!v100)
  {

    v61 = v38;
  }
  if (!v101)
  {

    v61 = v38;
  }
  if (!v102)
  {

    v61 = v38;
  }
  if (!v103)
  {

    v61 = v38;
  }
  if (v104)
  {
    if (v92)
      goto LABEL_120;
  }
  else
  {

    v61 = v38;
    if (v92)
      goto LABEL_120;
  }

  v61 = v38;
LABEL_120:
  if (!v105)
  {

    v61 = v38;
  }
  if (!v106)
  {

    v61 = v38;
  }
  if (!v107)
  {

    v61 = v38;
  }
  if (!v108)
  {

    v61 = v38;
  }
  if (!v109)
  {

    v61 = v38;
  }
  if (!v110)
  {

    v61 = v38;
  }
  if (!v111)
  {

    v61 = v38;
  }
  if (!v112)
  {

    v61 = v38;
  }
  if (!v113)
  {

    v61 = v38;
  }
  if (!v114)
  {

    v61 = v38;
  }
  if (!v115)
  {

    v61 = v38;
  }
  if (!v116)

  if (!v117)
  if (!v118)

  if (!v119)
  if (!v120)

  if (!v121)
  if (!v122)

  if (v123)
  {
    if (v88)
      goto LABEL_158;
  }
  else
  {

    if (v88)
    {
LABEL_158:
      if (v87)
        goto LABEL_159;
      goto LABEL_167;
    }
  }

  if (v87)
  {
LABEL_159:
    if (v93)
      goto LABEL_160;
    goto LABEL_168;
  }
LABEL_167:

  if (v93)
  {
LABEL_160:
    if (v94)
      goto LABEL_161;
LABEL_169:

    if (v3)
      goto LABEL_162;
LABEL_170:

    goto LABEL_162;
  }
LABEL_168:

  if (!v94)
    goto LABEL_169;
LABEL_161:
  if (!v3)
    goto LABEL_170;
LABEL_162:

  return v86;
}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_expirationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_expirationDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSURL)itemRelatedContentURL
{
  NSString *raw_itemRelatedContentURL;
  void *v3;

  raw_itemRelatedContentURL = self->_raw_itemRelatedContentURL;
  if (raw_itemRelatedContentURL)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_itemRelatedContentURL, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSURL *)v3;
}

- (NSDate)calendarUserActivityDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_calendarUserActivityDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_calendarUserActivityDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)calendarUserActivityEndDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_calendarUserActivityEndDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_calendarUserActivityEndDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSURL)URL
{
  NSString *raw_URL;
  void *v3;

  raw_URL = self->_raw_URL;
  if (raw_URL)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_URL, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSURL *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  int v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  int v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  int v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  int v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  int v184;
  void *v186;
  void *v187;
  void *v188;
  void *v189;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppLocationActivity bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppLocationActivity bundleID](self, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_143;
    }
    -[BMAppLocationActivity activityType](self, "activityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityType");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppLocationActivity activityType](self, "activityType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_143;
    }
    if (-[BMAppLocationActivity hasBeginningOfActivity](self, "hasBeginningOfActivity")
      || objc_msgSend(v5, "hasBeginningOfActivity"))
    {
      if (!-[BMAppLocationActivity hasBeginningOfActivity](self, "hasBeginningOfActivity"))
        goto LABEL_143;
      if (!objc_msgSend(v5, "hasBeginningOfActivity"))
        goto LABEL_143;
      v19 = -[BMAppLocationActivity beginningOfActivity](self, "beginningOfActivity");
      if (v19 != objc_msgSend(v5, "beginningOfActivity"))
        goto LABEL_143;
    }
    -[BMAppLocationActivity contentDescription](self, "contentDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentDescription");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMAppLocationActivity contentDescription](self, "contentDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_143;
    }
    -[BMAppLocationActivity expirationDate](self, "expirationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expirationDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMAppLocationActivity expirationDate](self, "expirationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_143;
    }
    if (-[BMAppLocationActivity hasIsEligibleForPrediction](self, "hasIsEligibleForPrediction")
      || objc_msgSend(v5, "hasIsEligibleForPrediction"))
    {
      if (!-[BMAppLocationActivity hasIsEligibleForPrediction](self, "hasIsEligibleForPrediction"))
        goto LABEL_143;
      if (!objc_msgSend(v5, "hasIsEligibleForPrediction"))
        goto LABEL_143;
      v32 = -[BMAppLocationActivity isEligibleForPrediction](self, "isEligibleForPrediction");
      if (v32 != objc_msgSend(v5, "isEligibleForPrediction"))
        goto LABEL_143;
    }
    if (-[BMAppLocationActivity hasIsPubliclyIndexable](self, "hasIsPubliclyIndexable")
      || objc_msgSend(v5, "hasIsPubliclyIndexable"))
    {
      if (!-[BMAppLocationActivity hasIsPubliclyIndexable](self, "hasIsPubliclyIndexable"))
        goto LABEL_143;
      if (!objc_msgSend(v5, "hasIsPubliclyIndexable"))
        goto LABEL_143;
      v33 = -[BMAppLocationActivity isPubliclyIndexable](self, "isPubliclyIndexable");
      if (v33 != objc_msgSend(v5, "isPubliclyIndexable"))
        goto LABEL_143;
    }
    -[BMAppLocationActivity itemIdentifier](self, "itemIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[BMAppLocationActivity itemIdentifier](self, "itemIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_143;
    }
    -[BMAppLocationActivity itemRelatedContentURL](self, "itemRelatedContentURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemRelatedContentURL");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      -[BMAppLocationActivity itemRelatedContentURL](self, "itemRelatedContentURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemRelatedContentURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_143;
    }
    -[BMAppLocationActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemRelatedUniqueIdentifier");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v46 == (void *)v47)
    {

    }
    else
    {
      v48 = (void *)v47;
      -[BMAppLocationActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemRelatedUniqueIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if (!v51)
        goto LABEL_143;
    }
    if (-[BMAppLocationActivity hasShortcutAvailability](self, "hasShortcutAvailability")
      || objc_msgSend(v5, "hasShortcutAvailability"))
    {
      if (!-[BMAppLocationActivity hasShortcutAvailability](self, "hasShortcutAvailability"))
        goto LABEL_143;
      if (!objc_msgSend(v5, "hasShortcutAvailability"))
        goto LABEL_143;
      v52 = -[BMAppLocationActivity shortcutAvailability](self, "shortcutAvailability");
      if (v52 != objc_msgSend(v5, "shortcutAvailability"))
        goto LABEL_143;
    }
    -[BMAppLocationActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestedInvocationPhrase");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v53 == (void *)v54)
    {

    }
    else
    {
      v55 = (void *)v54;
      -[BMAppLocationActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestedInvocationPhrase");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v56, "isEqual:", v57);

      if (!v58)
        goto LABEL_143;
    }
    -[BMAppLocationActivity title](self, "title");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v60 = objc_claimAutoreleasedReturnValue();
    if (v59 == (void *)v60)
    {

    }
    else
    {
      v61 = (void *)v60;
      -[BMAppLocationActivity title](self, "title");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v62, "isEqual:", v63);

      if (!v64)
        goto LABEL_143;
    }
    -[BMAppLocationActivity userActivityRequiredString](self, "userActivityRequiredString");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userActivityRequiredString");
    v66 = objc_claimAutoreleasedReturnValue();
    if (v65 == (void *)v66)
    {

    }
    else
    {
      v67 = (void *)v66;
      -[BMAppLocationActivity userActivityRequiredString](self, "userActivityRequiredString");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userActivityRequiredString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "isEqual:", v69);

      if (!v70)
        goto LABEL_143;
    }
    -[BMAppLocationActivity userActivityUUID](self, "userActivityUUID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userActivityUUID");
    v72 = objc_claimAutoreleasedReturnValue();
    if (v71 == (void *)v72)
    {

    }
    else
    {
      v73 = (void *)v72;
      -[BMAppLocationActivity userActivityUUID](self, "userActivityUUID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userActivityUUID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v74, "isEqual:", v75);

      if (!v76)
        goto LABEL_143;
    }
    -[BMAppLocationActivity sourceID](self, "sourceID");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceID");
    v78 = objc_claimAutoreleasedReturnValue();
    if (v77 == (void *)v78)
    {

    }
    else
    {
      v79 = (void *)v78;
      -[BMAppLocationActivity sourceID](self, "sourceID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceID");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v80, "isEqual:", v81);

      if (!v82)
        goto LABEL_143;
    }
    -[BMAppLocationActivity sourceBundleID](self, "sourceBundleID");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleID");
    v84 = objc_claimAutoreleasedReturnValue();
    if (v83 == (void *)v84)
    {

    }
    else
    {
      v85 = (void *)v84;
      -[BMAppLocationActivity sourceBundleID](self, "sourceBundleID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleID");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v86, "isEqual:", v87);

      if (!v88)
        goto LABEL_143;
    }
    -[BMAppLocationActivity sourceItemID](self, "sourceItemID");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceItemID");
    v90 = objc_claimAutoreleasedReturnValue();
    if (v89 == (void *)v90)
    {

    }
    else
    {
      v91 = (void *)v90;
      -[BMAppLocationActivity sourceItemID](self, "sourceItemID");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceItemID");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v92, "isEqual:", v93);

      if (!v94)
        goto LABEL_143;
    }
    -[BMAppLocationActivity sourceGroupID](self, "sourceGroupID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceGroupID");
    v96 = objc_claimAutoreleasedReturnValue();
    if (v95 == (void *)v96)
    {

    }
    else
    {
      v97 = (void *)v96;
      -[BMAppLocationActivity sourceGroupID](self, "sourceGroupID");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceGroupID");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v98, "isEqual:", v99);

      if (!v100)
        goto LABEL_143;
    }
    -[BMAppLocationActivity calendarUserActivityDate](self, "calendarUserActivityDate");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarUserActivityDate");
    v102 = objc_claimAutoreleasedReturnValue();
    if (v101 == (void *)v102)
    {

    }
    else
    {
      v103 = (void *)v102;
      -[BMAppLocationActivity calendarUserActivityDate](self, "calendarUserActivityDate");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendarUserActivityDate");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v104, "isEqual:", v105);

      if (!v106)
        goto LABEL_143;
    }
    -[BMAppLocationActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarUserActivityExternalID");
    v108 = objc_claimAutoreleasedReturnValue();
    if (v107 == (void *)v108)
    {

    }
    else
    {
      v109 = (void *)v108;
      -[BMAppLocationActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendarUserActivityExternalID");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v110, "isEqual:", v111);

      if (!v112)
        goto LABEL_143;
    }
    -[BMAppLocationActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarUserActivityEndDate");
    v114 = objc_claimAutoreleasedReturnValue();
    if (v113 == (void *)v114)
    {

    }
    else
    {
      v115 = (void *)v114;
      -[BMAppLocationActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendarUserActivityEndDate");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v116, "isEqual:", v117);

      if (!v118)
        goto LABEL_143;
    }
    -[BMAppLocationActivity locationName](self, "locationName");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationName");
    v120 = objc_claimAutoreleasedReturnValue();
    if (v119 == (void *)v120)
    {

    }
    else
    {
      v121 = (void *)v120;
      -[BMAppLocationActivity locationName](self, "locationName");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationName");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend(v122, "isEqual:", v123);

      if (!v124)
        goto LABEL_143;
    }
    if (-[BMAppLocationActivity hasLatitude](self, "hasLatitude") || objc_msgSend(v5, "hasLatitude"))
    {
      if (!-[BMAppLocationActivity hasLatitude](self, "hasLatitude"))
        goto LABEL_143;
      if (!objc_msgSend(v5, "hasLatitude"))
        goto LABEL_143;
      -[BMAppLocationActivity latitude](self, "latitude");
      v126 = v125;
      objc_msgSend(v5, "latitude");
      if (v126 != v127)
        goto LABEL_143;
    }
    if (-[BMAppLocationActivity hasLongitude](self, "hasLongitude") || objc_msgSend(v5, "hasLongitude"))
    {
      if (!-[BMAppLocationActivity hasLongitude](self, "hasLongitude"))
        goto LABEL_143;
      if (!objc_msgSend(v5, "hasLongitude"))
        goto LABEL_143;
      -[BMAppLocationActivity longitude](self, "longitude");
      v129 = v128;
      objc_msgSend(v5, "longitude");
      if (v129 != v130)
        goto LABEL_143;
    }
    -[BMAppLocationActivity city](self, "city");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "city");
    v132 = objc_claimAutoreleasedReturnValue();
    if (v131 == (void *)v132)
    {

    }
    else
    {
      v133 = (void *)v132;
      -[BMAppLocationActivity city](self, "city");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "city");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = objc_msgSend(v134, "isEqual:", v135);

      if (!v136)
        goto LABEL_143;
    }
    -[BMAppLocationActivity stateOrProvince](self, "stateOrProvince");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateOrProvince");
    v138 = objc_claimAutoreleasedReturnValue();
    if (v137 == (void *)v138)
    {

    }
    else
    {
      v139 = (void *)v138;
      -[BMAppLocationActivity stateOrProvince](self, "stateOrProvince");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateOrProvince");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = objc_msgSend(v140, "isEqual:", v141);

      if (!v142)
        goto LABEL_143;
    }
    -[BMAppLocationActivity country](self, "country");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "country");
    v144 = objc_claimAutoreleasedReturnValue();
    if (v143 == (void *)v144)
    {

    }
    else
    {
      v145 = (void *)v144;
      -[BMAppLocationActivity country](self, "country");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "country");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = objc_msgSend(v146, "isEqual:", v147);

      if (!v148)
        goto LABEL_143;
    }
    -[BMAppLocationActivity thoroughfare](self, "thoroughfare");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thoroughfare");
    v150 = objc_claimAutoreleasedReturnValue();
    if (v149 == (void *)v150)
    {

    }
    else
    {
      v151 = (void *)v150;
      -[BMAppLocationActivity thoroughfare](self, "thoroughfare");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "thoroughfare");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = objc_msgSend(v152, "isEqual:", v153);

      if (!v154)
        goto LABEL_143;
    }
    -[BMAppLocationActivity fullyFormattedAddress](self, "fullyFormattedAddress");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullyFormattedAddress");
    v156 = objc_claimAutoreleasedReturnValue();
    if (v155 == (void *)v156)
    {

    }
    else
    {
      v157 = (void *)v156;
      -[BMAppLocationActivity fullyFormattedAddress](self, "fullyFormattedAddress");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullyFormattedAddress");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = objc_msgSend(v158, "isEqual:", v159);

      if (!v160)
        goto LABEL_143;
    }
    -[BMAppLocationActivity subThoroughfare](self, "subThoroughfare");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subThoroughfare");
    v162 = objc_claimAutoreleasedReturnValue();
    if (v161 == (void *)v162)
    {

    }
    else
    {
      v163 = (void *)v162;
      -[BMAppLocationActivity subThoroughfare](self, "subThoroughfare");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subThoroughfare");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = objc_msgSend(v164, "isEqual:", v165);

      if (!v166)
        goto LABEL_143;
    }
    -[BMAppLocationActivity postalCode](self, "postalCode");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postalCode");
    v168 = objc_claimAutoreleasedReturnValue();
    if (v167 == (void *)v168)
    {

    }
    else
    {
      v169 = (void *)v168;
      -[BMAppLocationActivity postalCode](self, "postalCode");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postalCode");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = objc_msgSend(v170, "isEqual:", v171);

      if (!v172)
        goto LABEL_143;
    }
    -[BMAppLocationActivity phoneNumbers](self, "phoneNumbers");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumbers");
    v174 = objc_claimAutoreleasedReturnValue();
    if (v173 == (void *)v174)
    {

    }
    else
    {
      v175 = (void *)v174;
      -[BMAppLocationActivity phoneNumbers](self, "phoneNumbers");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "phoneNumbers");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v176, "isEqual:", v177);

      if (!v178)
        goto LABEL_143;
    }
    -[BMAppLocationActivity displayName](self, "displayName");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v180 = objc_claimAutoreleasedReturnValue();
    if (v179 == (void *)v180)
    {

    }
    else
    {
      v181 = (void *)v180;
      -[BMAppLocationActivity displayName](self, "displayName");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = objc_msgSend(v182, "isEqual:", v183);

      if (!v184)
      {
LABEL_143:
        v12 = 0;
LABEL_144:

        goto LABEL_145;
      }
    }
    -[BMAppLocationActivity URL](self, "URL");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    if (v186 == v187)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppLocationActivity URL](self, "URL");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v188, "isEqual:", v189);

    }
    goto LABEL_144;
  }
  v12 = 0;
LABEL_145:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (BOOL)beginningOfActivity
{
  return self->_beginningOfActivity;
}

- (BOOL)hasBeginningOfActivity
{
  return self->_hasBeginningOfActivity;
}

- (void)setHasBeginningOfActivity:(BOOL)a3
{
  self->_hasBeginningOfActivity = a3;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (BOOL)isEligibleForPrediction
{
  return self->_isEligibleForPrediction;
}

- (BOOL)hasIsEligibleForPrediction
{
  return self->_hasIsEligibleForPrediction;
}

- (void)setHasIsEligibleForPrediction:(BOOL)a3
{
  self->_hasIsEligibleForPrediction = a3;
}

- (BOOL)isPubliclyIndexable
{
  return self->_isPubliclyIndexable;
}

- (BOOL)hasIsPubliclyIndexable
{
  return self->_hasIsPubliclyIndexable;
}

- (void)setHasIsPubliclyIndexable:(BOOL)a3
{
  self->_hasIsPubliclyIndexable = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)itemRelatedUniqueIdentifier
{
  return self->_itemRelatedUniqueIdentifier;
}

- (int)shortcutAvailability
{
  return self->_shortcutAvailability;
}

- (BOOL)hasShortcutAvailability
{
  return self->_hasShortcutAvailability;
}

- (void)setHasShortcutAvailability:(BOOL)a3
{
  self->_hasShortcutAvailability = a3;
}

- (NSString)suggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (NSString)userActivityUUID
{
  return self->_userActivityUUID;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)sourceItemID
{
  return self->_sourceItemID;
}

- (NSString)sourceGroupID
{
  return self->_sourceGroupID;
}

- (NSString)calendarUserActivityExternalID
{
  return self->_calendarUserActivityExternalID;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (double)latitude
{
  return self->_latitude;
}

- (BOOL)hasLatitude
{
  return self->_hasLatitude;
}

- (void)setHasLatitude:(BOOL)a3
{
  self->_hasLatitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (BOOL)hasLongitude
{
  return self->_hasLongitude;
}

- (void)setHasLongitude:(BOOL)a3
{
  self->_hasLongitude = a3;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)stateOrProvince
{
  return self->_stateOrProvince;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (NSString)fullyFormattedAddress
{
  return self->_fullyFormattedAddress;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_fullyFormattedAddress, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_stateOrProvince, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_calendarUserActivityExternalID, 0);
  objc_storeStrong((id *)&self->_sourceGroupID, 0);
  objc_storeStrong((id *)&self->_sourceItemID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_userActivityUUID, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_suggestedInvocationPhrase, 0);
  objc_storeStrong((id *)&self->_itemRelatedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_raw_URL, 0);
  objc_storeStrong((id *)&self->_raw_itemRelatedContentURL, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMAppLocationActivity initByReadFrom:]([BMAppLocationActivity alloc], "initByReadFrom:", v7);
    v4[23] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
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
  _QWORD v39[37];

  v39[35] = *MEMORY[0x1E0C80C00];
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 1, 13, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityType"), 2, 0, 2, 13, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("beginningOfActivity"), 0, 0, 3, 12, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentDescription"), 2, 0, 4, 13, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("expirationDate"), 3, 0, 5, 0, 2);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isEligibleForPrediction"), 0, 0, 6, 12, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPubliclyIndexable"), 0, 0, 7, 12, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemIdentifier"), 2, 0, 8, 13, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemRelatedContentURL"), 2, 0, 9, 13, 4);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemRelatedUniqueIdentifier"), 2, 0, 10, 13, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shortcutAvailability"), 0, 0, 11, 2, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestedInvocationPhrase"), 2, 0, 12, 13, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 13, 13, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userActivityRequiredString"), 2, 0, 14, 13, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userActivityUUID"), 2, 0, 15, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceID"), 2, 0, 16, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleID"), 2, 0, 17, 13, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceItemID"), 2, 0, 18, 13, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceGroupID"), 2, 0, 19, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("calendarUserActivityDate"), 3, 0, 20, 0, 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("calendarUserActivityExternalID"), 2, 0, 21, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("calendarUserActivityEndDate"), 3, 0, 22, 0, 1);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locationName"), 2, 0, 23, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("latitude"), 1, 0, 24, 0, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("longitude"), 1, 0, 25, 0, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("city"), 2, 0, 26, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stateOrProvince"), 2, 0, 27, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("country"), 2, 0, 28, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("thoroughfare"), 2, 0, 29, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fullyFormattedAddress"), 2, 0, 30, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subThoroughfare"), 2, 0, 31, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("postalCode"), 2, 0, 32, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("phoneNumbers_json"), 5, 1, &__block_literal_global_35406);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("displayName"), 2, 0, 34, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("URL"), 2, 0, 35, 13, 4);
  v39[0] = v38;
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v35;
  v39[4] = v34;
  v39[5] = v33;
  v39[6] = v32;
  v39[7] = v31;
  v39[8] = v30;
  v39[9] = v29;
  v39[10] = v28;
  v39[11] = v27;
  v39[12] = v26;
  v39[13] = v25;
  v39[14] = v24;
  v39[15] = v23;
  v39[16] = v22;
  v39[17] = v21;
  v39[18] = v20;
  v39[19] = v19;
  v39[20] = v18;
  v39[21] = v17;
  v39[22] = v16;
  v39[23] = v15;
  v39[24] = v14;
  v39[25] = v2;
  v39[26] = v13;
  v39[27] = v3;
  v39[28] = v12;
  v39[29] = v4;
  v39[30] = v5;
  v39[31] = v6;
  v39[32] = v11;
  v39[33] = v7;
  v39[34] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 35);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C948;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
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
  _QWORD v39[37];

  v39[35] = *MEMORY[0x1E0C80C00];
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 1, 13, 0);
  v39[0] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityType"), 2, 13, 0);
  v39[1] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("beginningOfActivity"), 3, 12, 0);
  v39[2] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentDescription"), 4, 13, 0);
  v39[3] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("expirationDate"), 5, 0, 0);
  v39[4] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isEligibleForPrediction"), 6, 12, 0);
  v39[5] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPubliclyIndexable"), 7, 12, 0);
  v39[6] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemIdentifier"), 8, 13, 0);
  v39[7] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemRelatedContentURL"), 9, 13, 0);
  v39[8] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemRelatedUniqueIdentifier"), 10, 13, 0);
  v39[9] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shortcutAvailability"), 11, 2, 0);
  v39[10] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestedInvocationPhrase"), 12, 13, 0);
  v39[11] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 13, 13, 0);
  v39[12] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userActivityRequiredString"), 14, 13, 0);
  v39[13] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userActivityUUID"), 15, 13, 0);
  v39[14] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceID"), 16, 13, 0);
  v39[15] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleID"), 17, 13, 0);
  v39[16] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceItemID"), 18, 13, 0);
  v39[17] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceGroupID"), 19, 13, 0);
  v39[18] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("calendarUserActivityDate"), 20, 0, 0);
  v39[19] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("calendarUserActivityExternalID"), 21, 13, 0);
  v39[20] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("calendarUserActivityEndDate"), 22, 0, 0);
  v39[21] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationName"), 23, 13, 0);
  v39[22] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("latitude"), 24, 0, 0);
  v39[23] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("longitude"), 25, 0, 0);
  v39[24] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("city"), 26, 13, 0);
  v39[25] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOrProvince"), 27, 13, 0);
  v39[26] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("country"), 28, 13, 0);
  v39[27] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("thoroughfare"), 29, 13, 0);
  v39[28] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fullyFormattedAddress"), 30, 13, 0);
  v39[29] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subThoroughfare"), 31, 13, 0);
  v39[30] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("postalCode"), 32, 13, 0);
  v39[31] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("phoneNumbers"), 33, 13, 0);
  v39[32] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("displayName"), 34, 13, 0);
  v39[33] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("URL"), 35, 13, 0);
  v39[34] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 35);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __32__BMAppLocationActivity_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_phoneNumbersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
