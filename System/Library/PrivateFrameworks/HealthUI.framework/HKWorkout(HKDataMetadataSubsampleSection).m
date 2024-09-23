@implementation HKWorkout(HKDataMetadataSubsampleSection)

- (id)fixedAggregateValuesWithDisplayTypeController:()HKDataMetadataSubsampleSection unitController:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
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
  id v28;
  void *v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _QWORD v62[11];

  v62[9] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
  v51 = a1;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "statisticsForType:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sumQuantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v9;
  objc_msgSend(v9, "doubleValueForUnit:", v10);
  v12 = v11;

  if (v12 > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayTypeWithIdentifier:", &unk_1E9CED370);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unitForDisplayType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDisplayNameForDisplayType:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_numberFormatterForUnit:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValueForUnit:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromNumber:displayType:unitController:", v18, v14, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormatValueAndUnit(v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKey:", v20, v13);

  }
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v55;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v53;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C60]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v48;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v21;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C70]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v22;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C30]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v23;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C50]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v24;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C58]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v25;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C48]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v28 = v27;
  v29 = v51;
  v56 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v56)
  {
    v54 = *(_QWORD *)v58;
    v49 = v28;
    v50 = v7;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v58 != v54)
          objc_enumerationMutation(v28);
        v31 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v29, "statisticsForType:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v6, "displayTypeForObjectType:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unitForDisplayType:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v31, "aggregationStyle");
          if (v35 != 1)
          {
            if (!v35)
            {
              objc_msgSend(v32, "sumQuantity");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
              v37 = v36;
              objc_msgSend(v36, "doubleValueForUnit:", v34);
              v39 = v38;

              if (v39 > 0.00000011920929)
              {
                objc_msgSend(v33, "presentation");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "adjustedValueForDaemonValue:", v41);
                v42 = v6;
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                HKFormattedStringFromValueForContext(v43, v33, v7, 0, 0, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                v6 = v42;
                v28 = v49;

                v29 = v51;
                objc_msgSend(v52, "setObject:forKey:", v44, v31);

                v7 = v50;
              }
            }

            goto LABEL_16;
          }
          objc_msgSend(v32, "averageQuantity");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
LABEL_16:

      }
      v56 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v56);
  }

  return v52;
}

- (uint64_t)subSamplePredicate
{
  return objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsFromWorkout:", a1);
}

- (id)subExertionSamplePredicate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB6A78];
  objc_msgSend(a1, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateForObjectWithUUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)subSampleSectionTitle
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("RELATED_SAMPLES"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
