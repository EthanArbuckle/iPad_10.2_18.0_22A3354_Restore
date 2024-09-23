@implementation MEMessageCategorizationResultMetadata

- (MEMessageCategorizationResultMetadata)initWithScore:(double)a3 senderScore:(double)a4 tsScore:(double)a5 reasonCodes:(id)a6 modelVersion:(id)a7 senderModelVersion:(id)a8 tsModelVersion:(id)a9 finalRuleVersion:(id)a10 experimentID:(id)a11 experimentDeploymentID:(id)a12 experimentTreatmentID:(id)a13 rolloutID:(id)a14 rolloutDeploymentID:(id)a15 rolloutFactorPackID:(id)a16
{
  id v24;
  id v25;
  id v26;
  MEMessageCategorizationResultMetadata *v27;
  MEMessageCategorizationResultMetadata *v28;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v40 = a6;
  v31 = a7;
  v39 = a7;
  v38 = a8;
  v37 = a9;
  v36 = a10;
  v35 = a11;
  v34 = a12;
  v33 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v41.receiver = self;
  v41.super_class = (Class)MEMessageCategorizationResultMetadata;
  v27 = -[MEMessageCategorizationResultMetadata init](&v41, sel_init);
  v28 = v27;
  if (v27)
  {
    v27->_score = a3;
    v27->_senderScore = a4;
    v27->_tsScore = a5;
    objc_storeStrong((id *)&v27->_reasonCodes, a6);
    objc_storeStrong((id *)&v28->_modelVersion, v31);
    objc_storeStrong((id *)&v28->_senderModelVersion, a8);
    objc_storeStrong((id *)&v28->_tsModelVersion, a9);
    objc_storeStrong((id *)&v28->_finalRuleVersion, a10);
    objc_storeStrong((id *)&v28->_experimentID, a11);
    objc_storeStrong((id *)&v28->_experimentDeploymentID, a12);
    objc_storeStrong((id *)&v28->_experimentTreatmentID, a13);
    objc_storeStrong((id *)&v28->_rolloutID, a14);
    objc_storeStrong((id *)&v28->_rolloutDeploymentID, a15);
    objc_storeStrong((id *)&v28->_rolloutFactorPackID, a16);
  }

  return v28;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  BOOL v35;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _QWORD v61[14];
  _QWORD v62[16];

  v62[14] = *MEMORY[0x24BDAC8D0];
  v61[0] = CFSTR("score");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[MEMessageCategorizationResultMetadata score](self, "score");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v4;
  v62[0] = v4;
  v61[1] = CFSTR("senderScore");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[MEMessageCategorizationResultMetadata senderScore](self, "senderScore");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v7;
  v62[1] = v7;
  v61[2] = CFSTR("tsScore");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[MEMessageCategorizationResultMetadata tsScore](self, "tsScore");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v9;
  v62[2] = v9;
  v61[3] = CFSTR("reasonCodes");
  -[MEMessageCategorizationResultMetadata reasonCodes](self, "reasonCodes");
  v10 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v10;
  v62[3] = v10;
  v61[4] = CFSTR("modelVersion");
  -[MEMessageCategorizationResultMetadata modelVersion](self, "modelVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v11;
  v62[4] = v11;
  v61[5] = CFSTR("senderModelVersion");
  -[MEMessageCategorizationResultMetadata senderModelVersion](self, "senderModelVersion");
  v12 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v12;
  v62[5] = v12;
  v61[6] = CFSTR("tsModelVersion");
  -[MEMessageCategorizationResultMetadata tsModelVersion](self, "tsModelVersion");
  v13 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v13;
  v62[6] = v13;
  v61[7] = CFSTR("finalRuleVersion");
  -[MEMessageCategorizationResultMetadata finalRuleVersion](self, "finalRuleVersion");
  v14 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v14;
  v62[7] = v14;
  v61[8] = CFSTR("experimentID");
  -[MEMessageCategorizationResultMetadata experimentID](self, "experimentID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (uint64_t)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v16;
  v62[8] = v16;
  v61[9] = CFSTR("experimentDeploymentID");
  -[MEMessageCategorizationResultMetadata experimentDeploymentID](self, "experimentDeploymentID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (uint64_t)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v18;
  v62[9] = v18;
  v61[10] = CFSTR("experimentTreatmentID");
  -[MEMessageCategorizationResultMetadata experimentTreatmentID](self, "experimentTreatmentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (uint64_t)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v20;
  v62[10] = v20;
  v61[11] = CFSTR("rolloutID");
  -[MEMessageCategorizationResultMetadata rolloutID](self, "rolloutID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v62[11] = v22;
  v61[12] = CFSTR("rolloutDeploymentID");
  -[MEMessageCategorizationResultMetadata rolloutDeploymentID](self, "rolloutDeploymentID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v62[12] = v24;
  v61[13] = CFSTR("rolloutFactorPackID");
  -[MEMessageCategorizationResultMetadata rolloutFactorPackID](self, "rolloutFactorPackID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v62[13] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 14);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)

  if (!v23)
  if (!v21)

  if (!v19)
  if (!v17)

  if (!v15)
  if (!v55)

  if (!v54)
  if (!v53)

  if (!v52)
  if (!v50)

  if (!v49)
  if (!v51)

  if (!v5)
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v28 = v48;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v57 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v28, "objectForKey:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v33 == v34;

        if (!v35)
          objc_msgSend(v27, "setObject:forKey:", v33, v32);

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v29);
  }

  return v27;
}

- (id)stringRepresentationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1608];
  -[MEMessageCategorizationResultMetadata _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  unint64_t v33;
  double v34;
  unint64_t v35;
  double v36;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;

  -[MEMessageCategorizationResultMetadata score](self, "score");
  v4 = v3;
  -[MEMessageCategorizationResultMetadata senderScore](self, "senderScore");
  v6 = v5;
  -[MEMessageCategorizationResultMetadata tsScore](self, "tsScore");
  v8 = v7;
  -[MEMessageCategorizationResultMetadata reasonCodes](self, "reasonCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[MEMessageCategorizationResultMetadata modelVersion](self, "modelVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[MEMessageCategorizationResultMetadata senderModelVersion](self, "senderModelVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");

  -[MEMessageCategorizationResultMetadata tsModelVersion](self, "tsModelVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  -[MEMessageCategorizationResultMetadata finalRuleVersion](self, "finalRuleVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");

  -[MEMessageCategorizationResultMetadata experimentID](self, "experimentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v19, "hash");
  v40 = v18;

  -[MEMessageCategorizationResultMetadata experimentDeploymentID](self, "experimentDeploymentID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash");
  v22 = v14;

  -[MEMessageCategorizationResultMetadata experimentTreatmentID](self, "experimentTreatmentID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hash");
  v25 = v12;

  -[MEMessageCategorizationResultMetadata rolloutID](self, "rolloutID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");

  -[MEMessageCategorizationResultMetadata rolloutDeploymentID](self, "rolloutDeploymentID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hash");

  -[MEMessageCategorizationResultMetadata rolloutFactorPackID](self, "rolloutFactorPackID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "hash");
  v32 = round(v4);
  if (v32 < 0.0)
    v32 = -v32;
  v33 = 33 * (unint64_t)v32;
  v34 = round(v6);
  if (v34 < 0.0)
    v34 = -v34;
  v35 = 33 * (v33 + (unint64_t)v34);
  v36 = round(v8);
  if (v36 < 0.0)
    v36 = -v36;
  v37 = 33
      * (33
       * (33
        * (33
         * (33
          * (33 * (33 * (33 * (33 * (33 * (33 * (v35 + (unint64_t)v36) + v10) + v25) + v22) + v16) + v40) + v39)
          + v21)
         + v24)
        + v27)
       + v29)
      + v31
      + 0x76AA693EA3476DC1;

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  MEMessageCategorizationResultMetadata *v4;
  MEMessageCategorizationResultMetadata *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
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

  v4 = (MEMessageCategorizationResultMetadata *)a3;
  if (v4 == self)
  {
    v25 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MEMessageCategorizationResultMetadata score](self, "score");
      v7 = v6;
      -[MEMessageCategorizationResultMetadata score](v5, "score");
      v9 = v7 - v8;
      if (v9 < 0.0)
        v9 = -v9;
      if (v9 >= 2.22044605e-16)
        goto LABEL_25;
      -[MEMessageCategorizationResultMetadata senderScore](self, "senderScore");
      v11 = v10;
      -[MEMessageCategorizationResultMetadata senderScore](v5, "senderScore");
      v13 = v11 - v12;
      if (v13 < 0.0)
        v13 = -v13;
      if (v13 >= 2.22044605e-16)
        goto LABEL_25;
      -[MEMessageCategorizationResultMetadata tsScore](self, "tsScore");
      v15 = v14;
      -[MEMessageCategorizationResultMetadata tsScore](v5, "tsScore");
      v17 = v15 - v16;
      if (v17 < 0.0)
        v17 = -v17;
      if (v17 >= 2.22044605e-16)
      {
LABEL_25:
        v25 = 0;
      }
      else
      {
        -[MEMessageCategorizationResultMetadata reasonCodes](self, "reasonCodes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MEMessageCategorizationResultMetadata reasonCodes](v5, "reasonCodes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToArray:", v19))
        {
          -[MEMessageCategorizationResultMetadata modelVersion](self, "modelVersion");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MEMessageCategorizationResultMetadata modelVersion](v5, "modelVersion");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isEqualToString:", v21))
          {
            -[MEMessageCategorizationResultMetadata senderModelVersion](self, "senderModelVersion");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[MEMessageCategorizationResultMetadata senderModelVersion](v5, "senderModelVersion");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqualToString:", v23))
            {
              -[MEMessageCategorizationResultMetadata tsModelVersion](self, "tsModelVersion");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[MEMessageCategorizationResultMetadata tsModelVersion](v5, "tsModelVersion");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v41, "isEqualToString:", v24))
              {
                -[MEMessageCategorizationResultMetadata finalRuleVersion](self, "finalRuleVersion");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[MEMessageCategorizationResultMetadata finalRuleVersion](v5, "finalRuleVersion");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v40, "isEqualToString:"))
                {
                  -[MEMessageCategorizationResultMetadata experimentID](self, "experimentID");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MEMessageCategorizationResultMetadata experimentID](v5, "experimentID");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v38, "isEqualToString:"))
                  {
                    -[MEMessageCategorizationResultMetadata experimentDeploymentID](self, "experimentDeploymentID");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MEMessageCategorizationResultMetadata experimentDeploymentID](v5, "experimentDeploymentID");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v36, "isEqualToString:"))
                    {
                      -[MEMessageCategorizationResultMetadata experimentTreatmentID](self, "experimentTreatmentID");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MEMessageCategorizationResultMetadata experimentTreatmentID](v5, "experimentTreatmentID");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v34, "isEqualToString:"))
                      {
                        -[MEMessageCategorizationResultMetadata rolloutID](self, "rolloutID");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        -[MEMessageCategorizationResultMetadata rolloutID](v5, "rolloutID");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v32, "isEqualToString:", v31))
                        {
                          -[MEMessageCategorizationResultMetadata rolloutDeploymentID](self, "rolloutDeploymentID");
                          v30 = (void *)objc_claimAutoreleasedReturnValue();
                          -[MEMessageCategorizationResultMetadata rolloutDeploymentID](v5, "rolloutDeploymentID");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v30, "isEqualToString:", v29))
                          {
                            -[MEMessageCategorizationResultMetadata rolloutFactorPackID](self, "rolloutFactorPackID");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            -[MEMessageCategorizationResultMetadata rolloutFactorPackID](v5, "rolloutFactorPackID");
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            v25 = objc_msgSend(v28, "isEqualToString:", v27);

                          }
                          else
                          {
                            v25 = 0;
                          }

                        }
                        else
                        {
                          v25 = 0;
                        }

                      }
                      else
                      {
                        v25 = 0;
                      }

                    }
                    else
                    {
                      v25 = 0;
                    }

                  }
                  else
                  {
                    v25 = 0;
                  }

                }
                else
                {
                  v25 = 0;
                }

              }
              else
              {
                v25 = 0;
              }

            }
            else
            {
              v25 = 0;
            }

          }
          else
          {
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }

      }
    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  id v15;

  v15 = a3;
  -[MEMessageCategorizationResultMetadata score](self, "score");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("EFPropertyKey_score"));
  -[MEMessageCategorizationResultMetadata senderScore](self, "senderScore");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("EFPropertyKey_senderScore"));
  -[MEMessageCategorizationResultMetadata tsScore](self, "tsScore");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("EFPropertyKey_tsScore"));
  -[MEMessageCategorizationResultMetadata reasonCodes](self, "reasonCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_reasonCodes"));

  -[MEMessageCategorizationResultMetadata modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_modelVersion"));

  -[MEMessageCategorizationResultMetadata senderModelVersion](self, "senderModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_senderModelVersion"));

  -[MEMessageCategorizationResultMetadata tsModelVersion](self, "tsModelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_tsModelVersion"));

  -[MEMessageCategorizationResultMetadata finalRuleVersion](self, "finalRuleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_finalRuleVersion"));

  -[MEMessageCategorizationResultMetadata experimentID](self, "experimentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_experimentID"));

  -[MEMessageCategorizationResultMetadata experimentDeploymentID](self, "experimentDeploymentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_experimentDeploymentID"));

  -[MEMessageCategorizationResultMetadata experimentTreatmentID](self, "experimentTreatmentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_experimentTreatmentID"));

  -[MEMessageCategorizationResultMetadata rolloutID](self, "rolloutID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("EFPropertyKey_rolloutID"));

  -[MEMessageCategorizationResultMetadata rolloutDeploymentID](self, "rolloutDeploymentID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("EFPropertyKey_rolloutDeploymentID"));

  -[MEMessageCategorizationResultMetadata rolloutFactorPackID](self, "rolloutFactorPackID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("EFPropertyKey_rolloutFactorPackID"));

}

- (MEMessageCategorizationResultMetadata)initWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *reasonCodes;
  NSString *v15;
  NSString *modelVersion;
  NSString *v17;
  NSString *senderModelVersion;
  NSString *v19;
  NSString *tsModelVersion;
  NSString *v21;
  NSString *finalRuleVersion;
  NSString *v23;
  NSString *experimentID;
  NSString *v25;
  NSString *experimentDeploymentID;
  NSString *v27;
  NSString *v28;
  NSString *experimentTreatmentID;
  NSString *v30;
  NSString *rolloutID;
  NSString *v32;
  NSString *v33;
  NSString *rolloutDeploymentID;
  NSString *v35;
  NSString *v36;
  NSString *rolloutFactorPackID;
  MEMessageCategorizationResultMetadata *v39;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  NSArray *v46;
  id v47;

  v47 = a3;
  objc_msgSend(v47, "decodeDoubleForKey:", CFSTR("EFPropertyKey_score"));
  v5 = v4;
  objc_msgSend(v47, "decodeDoubleForKey:", CFSTR("EFPropertyKey_senderScore"));
  v7 = v6;
  objc_msgSend(v47, "decodeDoubleForKey:", CFSTR("EFPropertyKey_tsScore"));
  v9 = v8;
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "decodeObjectOfClasses:forKey:", v12, CFSTR("EFPropertyKey_reasonCodes"));
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  reasonCodes = self->_reasonCodes;
  self->_reasonCodes = v13;

  v46 = v13;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_modelVersion"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelVersion = self->_modelVersion;
  self->_modelVersion = v15;

  v45 = v15;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_senderModelVersion"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderModelVersion = self->_senderModelVersion;
  self->_senderModelVersion = v17;

  v44 = v17;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_tsModelVersion"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  tsModelVersion = self->_tsModelVersion;
  self->_tsModelVersion = v19;

  v43 = v19;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_finalRuleVersion"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  finalRuleVersion = self->_finalRuleVersion;
  self->_finalRuleVersion = v21;

  v42 = v21;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_experimentID"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  experimentID = self->_experimentID;
  self->_experimentID = v23;

  v41 = v23;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_experimentDeploymentID"));
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  experimentDeploymentID = self->_experimentDeploymentID;
  self->_experimentDeploymentID = v25;

  v27 = v25;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_experimentTreatmentID"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  experimentTreatmentID = self->_experimentTreatmentID;
  self->_experimentTreatmentID = v28;

  v40 = v28;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_rolloutID"));
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  rolloutID = self->_rolloutID;
  self->_rolloutID = v30;

  v32 = v30;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_rolloutDeploymentID"));
  v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  rolloutDeploymentID = self->_rolloutDeploymentID;
  self->_rolloutDeploymentID = v33;

  v35 = v33;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_rolloutFactorPackID"));
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  rolloutFactorPackID = self->_rolloutFactorPackID;
  self->_rolloutFactorPackID = v36;

  v39 = -[MEMessageCategorizationResultMetadata initWithScore:senderScore:tsScore:reasonCodes:modelVersion:senderModelVersion:tsModelVersion:finalRuleVersion:experimentID:experimentDeploymentID:experimentTreatmentID:rolloutID:rolloutDeploymentID:rolloutFactorPackID:](self, "initWithScore:senderScore:tsScore:reasonCodes:modelVersion:senderModelVersion:tsModelVersion:finalRuleVersion:experimentID:experimentDeploymentID:experimentTreatmentID:rolloutID:rolloutDeploymentID:rolloutFactorPackID:", v46, v45, v44, v43, v42, v41, v5, v7, v9, v27, v40, v32, v35, v36);
  return v39;
}

- (double)score
{
  return self->_score;
}

- (double)senderScore
{
  return self->_senderScore;
}

- (double)tsScore
{
  return self->_tsScore;
}

- (NSArray)reasonCodes
{
  return self->_reasonCodes;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)senderModelVersion
{
  return self->_senderModelVersion;
}

- (NSString)tsModelVersion
{
  return self->_tsModelVersion;
}

- (NSString)finalRuleVersion
{
  return self->_finalRuleVersion;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)experimentDeploymentID
{
  return self->_experimentDeploymentID;
}

- (NSString)experimentTreatmentID
{
  return self->_experimentTreatmentID;
}

- (NSString)rolloutID
{
  return self->_rolloutID;
}

- (NSString)rolloutDeploymentID
{
  return self->_rolloutDeploymentID;
}

- (NSString)rolloutFactorPackID
{
  return self->_rolloutFactorPackID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutFactorPackID, 0);
  objc_storeStrong((id *)&self->_rolloutDeploymentID, 0);
  objc_storeStrong((id *)&self->_rolloutID, 0);
  objc_storeStrong((id *)&self->_experimentTreatmentID, 0);
  objc_storeStrong((id *)&self->_experimentDeploymentID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_finalRuleVersion, 0);
  objc_storeStrong((id *)&self->_tsModelVersion, 0);
  objc_storeStrong((id *)&self->_senderModelVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_reasonCodes, 0);
}

@end
