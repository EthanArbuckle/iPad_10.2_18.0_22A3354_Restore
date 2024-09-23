@implementation MPCModelGenericAVItemTimedMetadataRequest

- (MPCModelGenericAVItemTimedMetadataRequest)initWithGenericObject:(id)a3 timedMetadataGroups:(id)a4 storeRequestContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPCModelGenericAVItemTimedMetadataRequest *v12;
  MPCModelGenericAVItemTimedMetadataRequest *v13;
  uint64_t v14;
  NSArray *timedMetadataGroups;
  uint64_t v16;
  ICStoreRequestContext *storeRequestContext;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPCModelGenericAVItemTimedMetadataRequest;
  v12 = -[MPCModelGenericAVItemTimedMetadataRequest init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_genericObject, a3);
    v14 = objc_msgSend(v10, "copy");
    timedMetadataGroups = v13->_timedMetadataGroups;
    v13->_timedMetadataGroups = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    storeRequestContext = v13->_storeRequestContext;
    v13->_storeRequestContext = (ICStoreRequestContext *)v16;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCModelGenericAVItemTimedMetadataRequest;
  v4 = -[MPCModelGenericAVItemTimedMetadataRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 11, self->_timedMetadataGroups);
    objc_storeStrong(v5 + 10, self->_storeRequestContext);
    objc_storeStrong(v5 + 8, self->_previousResponse);
    objc_storeStrong(v5 + 9, self->_genericObject);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  MPCModelGenericAVItemTimedMetadataRequest *v14;
  id v15;
  SEL v16;

  v5 = a3;
  v6 = (void *)-[MPCModelGenericAVItemTimedMetadataRequest copy](self, "copy");
  v7 = objc_alloc(MEMORY[0x24BDDC6F0]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke;
  v12[3] = &unk_24CABACD0;
  v13 = v6;
  v14 = self;
  v15 = v5;
  v16 = a2;
  v8 = v5;
  v9 = v6;
  v10 = (void *)objc_msgSend(v7, "initWithStartHandler:", v12);

  return v10;
}

- (MPCModelGenericAVItemTimedMetadataResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setPreviousResponse:(id)a3
{
  objc_storeStrong((id *)&self->_previousResponse, a3);
}

- (MPModelGenericObject)genericObject
{
  return self->_genericObject;
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (NSArray)timedMetadataGroups
{
  return self->_timedMetadataGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataGroups, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_genericObject, 0);
  objc_storeStrong((id *)&self->_previousResponse, 0);
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
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
  int v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  MPCModelGenericAVItemTimedMetadataStreamFields *v33;
  void *v34;
  uint64_t v35;
  int *v36;
  void *v37;
  int v38;
  void *v39;
  MPCModelGenericAVItemTimedMetadataStreamFields *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  MPCModelGenericAVItemTimedMetadataResponse *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  MPCModelGenericAVItemTimedMetadataStreamFields *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  MPCModelGenericAVItemTimedMetadataStreamFields *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t, void *);
  void *v106;
  id v107;
  id v108;
  _QWORD v109[4];
  id v110;
  uint64_t v111;
  _QWORD aBlock[4];
  id v113;
  id v114;
  id v115;
  id v116;
  MPCModelGenericAVItemTimedMetadataStreamFields *v117;
  id v118;
  char v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _QWORD v128[3];
  _QWORD v129[3];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v66 = a2;
  objc_msgSend(*(id *)(a1 + 32), "previousResponse");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = a1;
  objc_msgSend(*(id *)(a1 + 32), "timedMetadataGroups");
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
  if (v74)
  {
    v71 = 0;
    v80 = 0;
    v81 = 0;
    v91 = 0;
    v93 = 0;
    v3 = 0;
    v73 = *(_QWORD *)v125;
    v4 = *MEMORY[0x24BDB1E40];
    v5 = *MEMORY[0x24BDB1DD8];
    v92 = *MEMORY[0x24BDB1DC8];
    v90 = *MEMORY[0x24BDB1DC0];
    v86 = *MEMORY[0x24BDB1DD0];
    v82 = *MEMORY[0x24BDB1DD8];
    v83 = *MEMORY[0x24BDB1DE0];
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v125 != v73)
          objc_enumerationMutation(obj);
        v77 = v6;
        v7 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v6);
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        objc_msgSend(v7, "items");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v121;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v121 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
              objc_msgSend(v13, "keySpace");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", v4);

              if (v15)
              {
                objc_msgSend(v13, "key");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "isEqual:", v5))
                {
                  objc_msgSend(v13, "stringValue");
                  v17 = v3;
                  v3 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_55;
                }
                if (objc_msgSend(v16, "isEqual:", v92))
                {
                  objc_msgSend(v13, "stringValue");
                  v17 = v93;
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_55;
                }
                if (objc_msgSend(v16, "isEqual:", v90))
                {
                  objc_msgSend(v13, "stringValue");
                  v17 = v91;
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_55;
                }
                if (objc_msgSend(v16, "isEqual:", v86))
                {
                  objc_msgSend(v13, "extraAttributes");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKey:", CFSTR("info"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v84 = v18;
                  if (objc_msgSend(v18, "isEqual:", CFSTR("com.apple.radio.explicit")))
                  {
                    objc_msgSend(v13, "value");
                    v19 = (id)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v87 = v3;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v20 = v19;
                      v5 = v82;
                      if (objc_msgSend(v20, "length"))
                      {
                        v119 = 0;
                        objc_msgSend(v20, "getBytes:length:", &v119, 1);
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v119 == 1);
                        v78 = objc_claimAutoreleasedReturnValue();

                        v19 = v20;
                        v21 = (void *)v78;
                        goto LABEL_41;
                      }
                      v19 = v20;
                    }
                    else
                    {
                      v5 = v82;
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v19, "charValue") == 1);
                        v20 = v81;
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v20 = v81;
                        v21 = (void *)MEMORY[0x24BDBD1C0];
LABEL_41:
                        v81 = v21;
                      }
                    }
LABEL_44:

                    v3 = v87;
                    goto LABEL_45;
                  }
                  if (objc_msgSend(v18, "isEqual:", CFSTR("com.apple.radio.adamid")))
                  {
                    objc_msgSend(v13, "dataValue");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v5 = v82;
                    if (v31)
                    {
                      v87 = v3;
                      v19 = v31;
                      v20 = v80;
                      v80 = v19;
                      goto LABEL_44;
                    }
                    v19 = 0;
LABEL_45:

                  }
                  else
                  {
                    v5 = v82;
                  }

LABEL_55:
                }
                else if (objc_msgSend(v16, "isEqual:", v83))
                {
                  v88 = v3;
                  objc_msgSend(v13, "extraAttributes");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKey:", CFSTR("info"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v22);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v85, "scanString:intoString:", CFSTR("artworkURL_"), 0))
                    {
                      objc_msgSend(v13, "stringValue");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v23)
                      {
                        v79 = v23;
                        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        v25 = v85;
                        if (v24)
                        {
                          v76 = v24;
                          v118 = 0;
                          v26 = objc_msgSend(v85, "scanUpToString:intoString:", CFSTR("x"), &v118);
                          v27 = v118;
                          if (v26)
                          {
                            v75 = v27;
                            v25 = v85;
                            if ((objc_msgSend(v85, "isAtEnd") & 1) == 0)
                            {
                              v28 = objc_msgSend(v75, "integerValue");
                              v129[0] = v79;
                              v128[0] = CFSTR("url");
                              v128[1] = CFSTR("width");
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v28);
                              v69 = (void *)objc_claimAutoreleasedReturnValue();
                              v129[1] = v69;
                              v128[2] = CFSTR("height");
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v28);
                              v29 = (void *)objc_claimAutoreleasedReturnValue();
                              v129[2] = v29;
                              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
                              v70 = (void *)objc_claimAutoreleasedReturnValue();

                              v30 = v71;
                              if (!v71)
                                v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                              v71 = v30;
                              objc_msgSend(v30, "addObject:", v70);

                              v25 = v85;
                            }
                            v27 = v75;
                          }
                          else
                          {
                            v25 = v85;
                          }

                          v24 = v76;
                        }

                        v23 = v79;
                      }
                      else
                      {
                        v25 = v85;
                      }

                    }
                    else
                    {
                      v25 = v85;
                    }

                  }
                  v3 = v88;
                  goto LABEL_55;
                }

                continue;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
          }
          while (v10);
        }

        v6 = v77 + 1;
      }
      while (v77 + 1 != v74);
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
      if (!v74)
        goto LABEL_63;
    }
  }
  v71 = 0;
  v80 = 0;
  v81 = 0;
  v91 = 0;
  v93 = 0;
  v3 = 0;
LABEL_63:
  v32 = (void *)objc_msgSend(*(id *)(v68 + 32), "copy");
  objc_msgSend(v32, "setPreviousResponse:", 0);
  if (v3 || v91 || v93 || v71 || (v33 = 0, v81))
  {
    v33 = objc_alloc_init(MPCModelGenericAVItemTimedMetadataStreamFields);
    -[MPCModelGenericAVItemTimedMetadataStreamFields setAlbum:](v33, "setAlbum:", v91);
    -[MPCModelGenericAVItemTimedMetadataStreamFields setArtist:](v33, "setArtist:", v93);
    -[MPCModelGenericAVItemTimedMetadataStreamFields setExplicitContent:](v33, "setExplicitContent:", objc_msgSend(v81, "BOOLValue"));
    -[MPCModelGenericAVItemTimedMetadataStreamFields setTitle:](v33, "setTitle:", v3);
    -[MPCModelGenericAVItemTimedMetadataStreamFields setArtworkDictionaries:](v33, "setArtworkDictionaries:", v71);
  }
  objc_msgSend(v67, "adamIDData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x24BDAC760];
  v36 = &OBJC_IVAR____TtC17MediaPlaybackCore18ChangingQueueState_delayedActionWhenReady;
  v37 = v80;
  v89 = v3;
  if ((v80 == v34 || objc_msgSend(v80, "isEqual:", v34)) && v80 && v67)
  {
    v38 = 0;
    v39 = v66;
  }
  else
  {
    objc_msgSend(v67, "streamFields");
    v40 = (MPCModelGenericAVItemTimedMetadataStreamFields *)objc_claimAutoreleasedReturnValue();
    if (v33 == v40 || -[MPCModelGenericAVItemTimedMetadataStreamFields isEqual:](v33, "isEqual:", v40))
    {
      v38 = 0;
      v39 = v66;
    }
    else
    {
      objc_msgSend(*(id *)(v68 + 32), "genericObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v42 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_2;
        aBlock[3] = &unk_24CABABB8;
        v113 = v93;
        v114 = v71;
        v115 = v91;
        v116 = v3;
        v117 = v33;
        v43 = _Block_copy(aBlock);
        v44 = objc_msgSend(v41, "type");
        if ((v44 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v68 + 56), *(_QWORD *)(v68 + 40), CFSTR("MPCModelGenericAVItemTimedMetadataRequest.m"), 226, CFSTR("MPCModelGenericAVItemTimedMetadataRequest: unexepected genericObject type: %ld"), v44);

        }
        objc_msgSend(v41, "anyObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "identifiers");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v109[0] = v42;
        v109[1] = 3221225472;
        v109[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_7;
        v109[3] = &unk_24CABAC08;
        v110 = v43;
        v111 = v44;
        v47 = v43;
        v48 = (void *)objc_msgSend(v45, "copyWithIdentifiers:block:", v46, v109);

        objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v48);
        v49 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)v49;
      }
      v50 = -[MPCModelGenericAVItemTimedMetadataResponse initWithRequest:personalizationResponse:firstResponse:finalResponse:]([MPCModelGenericAVItemTimedMetadataResponse alloc], "initWithRequest:personalizationResponse:firstResponse:finalResponse:", v32, 0, 1, 0);
      v51 = objc_alloc_init(MEMORY[0x24BDDCA88]);
      objc_msgSend(v51, "appendSection:", &stru_24CABB5D0);
      objc_msgSend(v51, "appendItem:", v41);
      -[MPModelResponse setResults:](v50, "setResults:", v51);
      -[MPCModelGenericAVItemTimedMetadataResponse setStreamFields:](v50, "setStreamFields:", v33);
      v52 = *(_QWORD *)(v68 + 48);
      v39 = v66;
      if (v52)
        (*(void (**)(uint64_t, MPCModelGenericAVItemTimedMetadataResponse *, _QWORD))(v52 + 16))(v52, v50, 0);

      v38 = 1;
      v37 = v80;
      v35 = MEMORY[0x24BDAC760];
    }

    v36 = &OBJC_IVAR____TtC17MediaPlaybackCore18ChangingQueueState_delayedActionWhenReady;
  }
  v103 = v35;
  v104 = *((_QWORD *)v36 + 339);
  v53 = v104;
  v105 = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_9;
  v106 = &unk_24CABAC30;
  v108 = *(id *)(v68 + 48);
  v54 = v39;
  v107 = v54;
  v55 = _Block_copy(&v103);
  v98[0] = v35;
  v98[1] = v53;
  v98[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_10;
  v98[3] = &unk_24CABAC80;
  v56 = v32;
  v99 = v56;
  v57 = v37;
  v100 = v57;
  v58 = v33;
  v101 = v58;
  v59 = v55;
  v102 = v59;
  v60 = _Block_copy(v98);
  if (v57 && (objc_msgSend(v57, "isEqual:", v34) & 1) == 0)
  {
    v62 = objc_alloc_init(MEMORY[0x24BEC8938]);
    objc_msgSend(v62, "setQualityOfService:", 25);
    objc_msgSend(v62, "setTimedMetadataData:", v57);
    objc_msgSend(*(id *)(v68 + 32), "storeRequestContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setStoreRequestContext:", v63);

    v94[0] = MEMORY[0x24BDAC760];
    v94[1] = v53;
    v94[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_12;
    v94[3] = &unk_24CABACA8;
    v95 = *(id *)(v68 + 32);
    v96 = v54;
    v97 = v60;
    objc_msgSend(v62, "performWithResponseHandler:", v94);

    goto LABEL_94;
  }
  if ((objc_msgSend(v57, "isEqual:", v34) & 1) == 0 && v38 == 1)
  {
    objc_msgSend(v54, "finish");
LABEL_94:
    v61 = v67;
    goto LABEL_95;
  }
  v61 = v67;
  if (v67 && (objc_msgSend(v67, "isValid") & 1) == 0)
  {
    objc_msgSend(v67, "unpersonalizedContentDescriptors");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v60 + 2))(v60, v64);

  }
  else
  {
    objc_msgSend(v67, "setFirstResponse:", 0);
    (*((void (**)(id, void *, _QWORD))v59 + 2))(v59, v67, 0);
  }
LABEL_95:

}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[4];
  id v32;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_3;
  aBlock[3] = &unk_24CABAB18;
  v32 = *(id *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  objc_msgSend(v3, "artist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "copyWithIdentifiers:block:", v8, v5);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BDDC840]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "initWithIdentifiers:block:", v8, v5);
  }
  v11 = (void *)v9;

  v24 = v11;
  objc_msgSend(v3, "setArtist:", v11);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89C0]), "initWithArtworkResponseArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDDCC08], "tokenWithImageArtworkInfo:");
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_4;
  v29[3] = &unk_24CABAB40;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v30 = v12;
  v13 = _Block_copy(v29);
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_5;
  v25[3] = &unk_24CABAB90;
  v26 = *(id *)(a1 + 48);
  v14 = v5;
  v27 = v14;
  v15 = v13;
  v28 = v15;
  v16 = _Block_copy(v25);
  objc_msgSend(v3, "album");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "identifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "copyWithIdentifiers:block:", v19, v16);
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x24BDDC830]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v21, "initWithIdentifiers:block:", v19, v16);
  }
  v22 = (void *)v20;

  objc_msgSend(v3, "setAlbum:", v22);
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setExplicitSong:", objc_msgSend(*(id *)(a1 + 64), "isExplicitContent"));
  objc_msgSend(v3, "setArtworkCatalogBlock:", v15);

}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDDC928];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_8;
  v7[3] = &unk_24CABABE0;
  v5 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performWithoutEnforcement:", v7);

}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v5 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_10(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC60]), "initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:", a1[4], v3);
  objc_msgSend(v4, "setMatchAlbumArtistsOnNameAndStoreID:", 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_11;
  v6[3] = &unk_24CABAC58;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = v3;
  v11 = a1[7];
  v5 = v3;
  objc_msgSend(v4, "performWithResponseHandler:", v6);

}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a2, "allStorePlatformMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "itemProperties");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCA20]), "initWithRequestedProperties:", v7);
  objc_msgSend(*(id *)(a1 + 40), "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "genericObjectForStorePlatformMetadata:radioStationContainsVideo:userIdentity:", v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDDCA88]);
    objc_msgSend(v12, "appendSection:", &stru_24CABB5D0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC58]), "initWithModel:personalizationStyle:", v11, 1);
    objc_msgSend(v12, "appendItem:", v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v14);
  }

}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_11(_QWORD *a1, void *a2)
{
  id v3;
  MPCModelGenericAVItemTimedMetadataResponse *v4;

  v3 = a2;
  v4 = -[MPCModelGenericAVItemTimedMetadataResponse initWithRequest:personalizationResponse:firstResponse:finalResponse:]([MPCModelGenericAVItemTimedMetadataResponse alloc], "initWithRequest:personalizationResponse:firstResponse:finalResponse:", a1[4], v3, 0, 1);

  -[MPCModelGenericAVItemTimedMetadataResponse setAdamIDData:](v4, "setAdamIDData:", a1[5]);
  -[MPCModelGenericAVItemTimedMetadataResponse setStreamFields:](v4, "setStreamFields:", a1[6]);
  -[MPCModelGenericAVItemTimedMetadataResponse setUnpersonalizedContentDescriptors:](v4, "setUnpersonalizedContentDescriptors:", a1[7]);
  (*(void (**)(void))(a1[8] + 16))();

}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 5)
  {
    v4 = *(id *)(a1 + 32);
    if (objc_msgSend(v4, "type") == 1)
    {
      objc_msgSend(v4, "song");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }
  else if (v2 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setName:", *(_QWORD *)(a1 + 32));
}

id __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc(MEMORY[0x24BDDC6D8]);
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "initWithToken:dataSource:", v3, v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", a1[4]);
  objc_msgSend(v3, "artist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "copyWithIdentifiers:block:", v6, a1[5]);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDDC840]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "initWithIdentifiers:block:", v6, a1[5]);
  }
  v9 = (void *)v7;

  objc_msgSend(v3, "setArtist:", v9);
  objc_msgSend(v3, "setArtworkCatalogBlock:", a1[6]);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v10 = (void *)MEMORY[0x24BDDC928];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_6;
  v15 = &unk_24CABAB68;
  v17 = &v18;
  v11 = v3;
  v16 = v11;
  objc_msgSend(v10, "performWithoutEnforcement:", &v12);
  if (*((_BYTE *)v19 + 24))
    objc_msgSend(v11, "setYear:", 0, v12, v13, v14, v15);

  _Block_object_dispose(&v18, 8);
}

uint64_t __77__MPCModelGenericAVItemTimedMetadataRequest_newOperationWithResponseHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "year");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (NSArray)metadataIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB1DF8];
  v5[0] = *MEMORY[0x24BDB1E08];
  v5[1] = v2;
  v3 = *MEMORY[0x24BDB1DF0];
  v5[2] = *MEMORY[0x24BDB1DE8];
  v5[3] = v3;
  v5[4] = *MEMORY[0x24BDB1E00];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

@end
