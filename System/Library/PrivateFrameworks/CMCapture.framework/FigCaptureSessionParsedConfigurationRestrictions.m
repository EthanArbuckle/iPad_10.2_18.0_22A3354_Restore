@implementation FigCaptureSessionParsedConfigurationRestrictions

- (BOOL)allowAllConfigurations
{
  return self->_allowAllConfigurations;
}

- (FigCaptureSessionParsedConfigurationRestrictions)initWithClientAuditToken:(id *)a3
{
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  _BOOL8 v8;
  void *v9;
  audit_token_t token;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    v7 = v6;
    v8 = FigCaptureClientIsNonStandardWithSecTask(v6) != 0;
    v9 = (void *)SecTaskCopyValueForEntitlement(v7, CFSTR("com.apple.private.avfoundation.capture.nonstandard-client.allowed-media-types"), 0);
    self = -[FigCaptureSessionParsedConfigurationRestrictions initWithAllowedAVMediaTypes:clientIsNonStandard:](self, "initWithAllowedAVMediaTypes:clientIsNonStandard:", v9, v8);
    CFRelease(v7);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = 0;
  }

  return self;
}

- (FigCaptureSessionParsedConfigurationRestrictions)initWithAllowedAVMediaTypes:(id)a3 clientIsNonStandard:(BOOL)a4
{
  _BOOL4 v4;
  FigCaptureSessionParsedConfigurationRestrictions *v6;
  FigCaptureSessionParsedConfigurationRestrictions *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureSessionParsedConfigurationRestrictions;
  v6 = -[FigCaptureSessionParsedConfigurationRestrictions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[FigCaptureSessionParsedConfigurationRestrictions _parseRestrictionsWithAllowedAVMediaTypes:clientIsNonStandard:]((uint64_t)v6, a3, v4);
  return v7;
}

- (uint64_t)_parseRestrictionsWithAllowedAVMediaTypes:(int)a3 clientIsNonStandard:
{
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[35];
  _QWORD v73[37];

  v73[35] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (a2)
      v5 = a3;
    else
      v5 = 0;
    if (v5 == 1)
    {
      v25 = result;
      v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v61 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_opt_class();
      obj = a2;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_29:
        v4 = v25;
        *(_BYTE *)(v25 + 8) = 0;
        v23 = v27;
        objc_msgSend(v27, "removeAllObjects");
        v24 = v61;
        objc_msgSend(v61, "removeAllObjects");
LABEL_32:
        *(_QWORD *)(v4 + 16) = objc_msgSend(v23, "copy");
        result = objc_msgSend(v24, "copy");
        *(_QWORD *)(v4 + 24) = result;
        return result;
      }
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v26 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      if (v26)
      {
        v28 = *(_QWORD *)v67;
        v60 = *MEMORY[0x1E0D08558];
        v59 = *MEMORY[0x1E0CA4C40];
        v58 = *MEMORY[0x1E0CA2548];
        v56 = *MEMORY[0x1E0CA4C50];
        v57 = *MEMORY[0x1E0CA4C48];
        v54 = *MEMORY[0x1E0CA4C60];
        v55 = *MEMORY[0x1E0CA4C58];
        v52 = *MEMORY[0x1E0CA2550];
        v53 = *MEMORY[0x1E0CA4C68];
        v50 = *MEMORY[0x1E0CA4C78];
        v51 = *MEMORY[0x1E0CA4C70];
        v48 = *MEMORY[0x1E0CA2560];
        v49 = *MEMORY[0x1E0CA2558];
        v46 = *MEMORY[0x1E0CA4C80];
        v47 = *MEMORY[0x1E0D08540];
        v44 = *MEMORY[0x1E0CA4CB8];
        v45 = *MEMORY[0x1E0CA4C88];
        v42 = *MEMORY[0x1E0CA4C98];
        v43 = *MEMORY[0x1E0CA4C90];
        v40 = *MEMORY[0x1E0D08568];
        v41 = *MEMORY[0x1E0D08560];
        v6 = a2;
        v38 = *MEMORY[0x1E0D08578];
        v39 = *MEMORY[0x1E0D08570];
        v36 = *MEMORY[0x1E0D08580];
        v37 = *MEMORY[0x1E0D08588];
        v34 = *MEMORY[0x1E0D08590];
        v35 = *MEMORY[0x1E0CA2568];
        v32 = *MEMORY[0x1E0CA4CA0];
        v33 = *MEMORY[0x1E0CA4CC8];
        v7 = *MEMORY[0x1E0D085A0];
        v8 = *MEMORY[0x1E0D08550];
        v9 = *MEMORY[0x1E0D08530];
        v10 = *MEMORY[0x1E0D08538];
        v11 = *MEMORY[0x1E0D08548];
        v12 = *MEMORY[0x1E0D08598];
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v67 != v28)
              objc_enumerationMutation(v6);
            v30 = v13;
            v14 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v13);
            v15 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v15, "BOOLValue"))
              {
                v16 = objc_msgSend(&unk_1E4A02FF8, "objectForKeyedSubscript:", v14);
                if (!v16)
                  goto LABEL_29;
                objc_msgSend(v27, "addObject:", v16);
              }
            }
            else
            {
              objc_opt_class();
              v31 = v15;
              if ((objc_opt_isKindOfClass() & 1) == 0
                || !objc_msgSend(v14, "isEqualToString:", CFSTR("AVMediaTypeMetadataObject")))
              {
                goto LABEL_29;
              }
              objc_msgSend(v27, "addObject:", &unk_1E49F8D18);
              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v63;
LABEL_20:
                v20 = 0;
                while (1)
                {
                  if (*(_QWORD *)v63 != v19)
                    objc_enumerationMutation(v31);
                  v21 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v20);
                  v72[0] = CFSTR("AVMetadataObjectTypeAppClipCode");
                  v72[1] = CFSTR("AVMetadataObjectTypeAztecCode");
                  v73[0] = v60;
                  v73[1] = v59;
                  v72[2] = CFSTR("AVMetadataObjectTypeCatBody");
                  v72[3] = CFSTR("AVMetadataObjectTypeCode128Code");
                  v73[2] = v58;
                  v73[3] = v57;
                  v72[4] = CFSTR("AVMetadataObjectTypeCode39Code");
                  v72[5] = CFSTR("AVMetadataObjectTypeCode39Mod43Code");
                  v73[4] = v56;
                  v73[5] = v55;
                  v72[6] = CFSTR("AVMetadataObjectTypeCode93Code");
                  v72[7] = CFSTR("AVMetadataObjectTypeDataMatrixCode");
                  v73[6] = v54;
                  v73[7] = v53;
                  v72[8] = CFSTR("AVMetadataObjectTypeDogBody");
                  v72[9] = CFSTR("AVMetadataObjectTypeEAN13Code");
                  v73[8] = v52;
                  v73[9] = v51;
                  v72[10] = CFSTR("AVMetadataObjectTypeEAN8Code");
                  v72[11] = CFSTR("AVMetadataObjectTypeFace");
                  v73[10] = v50;
                  v73[11] = v49;
                  v72[12] = CFSTR("AVMetadataObjectTypeHumanBody");
                  v72[13] = CFSTR("AVMetadataObjectTypeHumanFullBody");
                  v73[12] = v48;
                  v73[13] = v47;
                  v72[14] = CFSTR("AVMetadataObjectTypeInterleaved2of5Code");
                  v72[15] = CFSTR("AVMetadataObjectTypeITF14Code");
                  v73[14] = v46;
                  v73[15] = v45;
                  v72[16] = CFSTR("AVMetadataObjectTypeOfflineVideoStabilizationMotion");
                  v72[17] = CFSTR("AVMetadataObjectTypePDF417Code");
                  v73[16] = v44;
                  v73[17] = v43;
                  v72[18] = CFSTR("AVMetadataObjectTypeQRCode");
                  v72[19] = CFSTR("AVMetadataObjectTypeCodabarCode");
                  v73[18] = v42;
                  v73[19] = v41;
                  v72[20] = CFSTR("AVMetadataObjectTypeGS1DataBarCode");
                  v72[21] = CFSTR("AVMetadataObjectTypeGS1DataBarExpandedCode");
                  v73[20] = v40;
                  v73[21] = v39;
                  v72[22] = CFSTR("AVMetadataObjectTypeGS1DataBarLimitedCode");
                  v72[23] = CFSTR("AVMetadataObjectTypeMicroQRCode");
                  v73[22] = v38;
                  v73[23] = v37;
                  v72[24] = CFSTR("AVMetadataObjectTypeMicroPDF417Code");
                  v72[25] = CFSTR("AVMetadataObjectTypeSalientObject");
                  v73[24] = v36;
                  v73[25] = v35;
                  v72[26] = CFSTR("AVMetadataObjectTypeTextRegion");
                  v72[27] = CFSTR("AVMetadataObjectTypeTrackedFaces");
                  v73[26] = v34;
                  v73[27] = v33;
                  v72[28] = CFSTR("AVMetadataObjectTypeUPCECode");
                  v72[29] = CFSTR("AVMetadataObjectTypeVideoPreviewHistogram");
                  v73[28] = v32;
                  v73[29] = v7;
                  v72[30] = CFSTR("AVMetadataObjectTypeHumanHead");
                  v72[31] = CFSTR("AVMetadataObjectTypeCatHead");
                  v73[30] = v8;
                  v73[31] = v9;
                  v72[32] = CFSTR("AVMetadataObjectTypeDogHead");
                  v72[33] = CFSTR("AVMetadataObjectTypeHumanHand");
                  v73[32] = v10;
                  v73[33] = v11;
                  v72[34] = CFSTR("AVMetadataObjectTypeEyeReliefStatus");
                  v73[34] = v12;
                  v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 35), "objectForKeyedSubscript:", v21);
                  if (!v22)
                    goto LABEL_29;
                  objc_msgSend(v61, "addObject:", v22);
                  if (v18 == ++v20)
                  {
                    v18 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
                    if (v18)
                      goto LABEL_20;
                    break;
                  }
                }
              }
            }
            v6 = obj;
            v13 = v30 + 1;
          }
          while (v30 + 1 != v26);
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
          if (v26)
            continue;
          break;
        }
        v4 = v25;
        *(_BYTE *)(v25 + 8) = 0;
        v23 = v27;
        v24 = v61;
        goto LABEL_32;
      }
      v4 = v25;
      v23 = v27;
      v24 = v61;
    }
    else
    {
      v24 = 0;
      v23 = 0;
    }
    *(_BYTE *)(v4 + 8) = v5 ^ 1;
    goto LABEL_32;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedConfigurationRestrictions;
  -[FigCaptureSessionParsedConfigurationRestrictions dealloc](&v3, sel_dealloc);
}

- (NSArray)allowedConnectionMediaTypes
{
  return self->_allowedConnectionMediaTypes;
}

- (NSArray)allowedConnectionMetadataIdentifiers
{
  return self->_allowedConnectionMetadataIdentifiers;
}

@end
