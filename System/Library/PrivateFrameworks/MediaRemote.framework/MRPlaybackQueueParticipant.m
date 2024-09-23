@implementation MRPlaybackQueueParticipant

uint64_t __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *Error;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "isResolved"))
  {
    if (v6)
      Error = 0;
    else
      Error = (void *)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    v17 = *(NSObject **)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_18;
    v18[3] = &unk_1E30C6658;
    v21 = *(id *)(a1 + 56);
    v19 = v6;
    v20 = Error;
    v11 = Error;
    dispatch_async(v17, v18);

    v14 = v21;
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v5, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSystemMediaApplication");

  if ((v8 & 1) != 0)
  {
    _MRLogForCategory(0xCuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v10;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueParticipantRequest]<%@> for playerPath: %@", buf, 0x16u);
    }

    MRGetSharedService();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_16;
    v22[3] = &unk_1E30C8288;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 48);
    v23 = *(id *)(a1 + 40);
    v24 = *(id *)(a1 + 56);
    objc_msgSend(v11, "fetchParticipantsWithRequest:playerPath:queue:completion:", v13, v5, v12, v22);

    v14 = v23;
    goto LABEL_11;
  }
  v16 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C6770;
  v26 = *(id *)(a1 + 56);
  dispatch_async(v16, block);
  v11 = v26;
LABEL_12:

}

+ (void)fetchParticipantsWithRequest:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CB3A28];
  v13 = a4;
  objc_msgSend(v12, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke;
  v20[3] = &unk_1E30CA160;
  v21 = v10;
  v22 = v15;
  v23 = v9;
  v24 = v11;
  v16 = v9;
  v17 = v15;
  v18 = v11;
  v19 = v10;
  MRMediaRemoteNowPlayingResolvePlayerPath(v13, v19, v20);

}

- (MRPlaybackQueueParticipant)initWithIdentifier:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  MRPlaybackQueueParticipant *v9;
  MRPlaybackQueueParticipant *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRPlaybackQueueParticipant;
  v9 = -[MRPlaybackQueueParticipant init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a4);
    objc_storeStrong((id *)&v10->_identifier, a3);
  }

  return v10;
}

- (MRPlaybackQueueParticipant)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  MRUserIdentity *v6;
  void *v7;
  MRUserIdentity *v8;
  MRPlaybackQueueParticipant *v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [MRUserIdentity alloc];
    objc_msgSend(v4, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[MRUserIdentity initWithProtobuf:](v6, "initWithProtobuf:", v7);
    self = -[MRPlaybackQueueParticipant initWithIdentifier:identity:](self, "initWithIdentifier:identity:", v5, v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MRPlaybackQueueParticipant)initWithProtobufData:(id)a3
{
  id v4;
  _MRPlaybackQueueParticipantProtobuf *v5;
  MRPlaybackQueueParticipant *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRPlaybackQueueParticipantProtobuf initWithData:]([_MRPlaybackQueueParticipantProtobuf alloc], "initWithData:", v4);

    self = -[MRPlaybackQueueParticipant initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  _MRPlaybackQueueParticipantProtobuf *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(_MRPlaybackQueueParticipantProtobuf);
  -[MRPlaybackQueueParticipant identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueParticipantProtobuf setIdentity:](v4, "setIdentity:", v6);

  -[MRPlaybackQueueParticipant identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueParticipantProtobuf setIdentifier:](v4, "setIdentifier:", v7);

  return v4;
}

- (NSData)protobufData
{
  void *v2;
  void *v3;

  -[MRPlaybackQueueParticipant protobufWithEncoding:](self, "protobufWithEncoding:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MRPlaybackQueueParticipant *v4;
  void *v5;
  void *v6;
  MRPlaybackQueueParticipant *v7;

  v4 = [MRPlaybackQueueParticipant alloc];
  -[MRPlaybackQueueParticipant protobufWithEncoding:](self, "protobufWithEncoding:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[MRPlaybackQueueParticipant initWithProtobuf:](v4, "initWithProtobuf:", v6);

  return v7;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRPlaybackQueueParticipant identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackQueueParticipant identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: identifier=%@, identity=%@"), v4, v5, v6);

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRPlaybackQueueParticipant identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  -[MRPlaybackQueueParticipant identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identity"));

  return (NSDictionary *)v3;
}

+ (void)fetchPlaybackQueueParticipantIdentifierForLocalAccountWithDSID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  MRGetSharedService();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRGroupSessionSubsystemGetNotificationQueue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__MRPlaybackQueueParticipant_fetchPlaybackQueueParticipantIdentifierForLocalAccountWithDSID_completion___block_invoke;
  v10[3] = &unk_1E30CA138;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "userIdentityForDSID:queue:completion:", v6, v8, v10);

}

void __104__MRPlaybackQueueParticipant_fetchPlaybackQueueParticipantIdentifierForLocalAccountWithDSID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:withRandomData:](MRPlaybackQueueParticipant, "expectedIdentifierForUserIdentity:withRandomData:", a2, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

void __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MRLogForCategory(0xCuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v6)
      v9 = v6;
    else
      v9 = v5;
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueParticipantRequest]<%@> Response: %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __90__MRPlaybackQueueParticipant_fetchParticipantsWithRequest_forPlayerPath_queue_completion___block_invoke_18(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  v3 = a1[4];
  if (!v3)
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v2, 0, v3);
}

+ (id)expectedIdentifierForUserIdentity:(id)a3 withRandomData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  ldiv_t v14;
  uint64_t v15;
  CFIndex v16;
  const UInt8 *v17;
  unsigned __int8 *v18;
  char *v19;
  char *v20;
  uint64_t m;
  unsigned int v22;
  char *v23;
  id v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _BYTE *v29;
  unint64_t v30;
  unsigned __int8 *v31;
  char *v32;
  char *v33;
  uint64_t j;
  unsigned int v35;
  char *v36;
  uint64_t v37;
  UInt8 *v38;
  uint64_t quot;
  lldiv_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  char *v43;
  char *v44;
  uint64_t k;
  unsigned int v46;
  char *v47;
  char *v48;
  uint64_t v49;
  _BYTE *v50;
  unint64_t v51;
  unsigned __int8 *v52;
  char *v53;
  char *v54;
  uint64_t i;
  unsigned int v56;
  char *v57;
  CFStringRef v58;
  void *v59;
  void *v60;
  __CFString *v61;
  _BYTE v63[208];
  _BYTE v64[72];
  _OWORD v65[4];
  uint64_t v66;
  _QWORD v67[2];
  char v68;
  _QWORD v69[3];

  v69[0] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "stringByAppendingString:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = v8;
  memset(v63, 0, sizeof(v63));
  CC_SHA1_Init((CC_SHA1_CTX *)v63);
  v11 = objc_retainAutorelease(v10);
  CC_SHA1_Update((CC_SHA1_CTX *)v63, (const void *)objc_msgSend(v11, "UTF8String"), objc_msgSend(v11, "length"));

  memset(&v64[8], 0, 64);
  *(_QWORD *)v64 = 4001;
  CC_SHA1_Final(&v64[8], (CC_SHA1_CTX *)v63);
  v65[0] = *(_OWORD *)v64;
  v65[1] = *(_OWORD *)&v64[16];
  v65[2] = *(_OWORD *)&v64[32];
  v65[3] = *(_OWORD *)&v64[48];
  v66 = *(_QWORD *)&v64[64];
  if (*(uint64_t *)v64 > 3999)
  {
    if (*(uint64_t *)v64 > 4255)
    {
      if (*(_QWORD *)v64 == 4256)
      {
        v52 = (unsigned __int8 *)v65 + 8;
        v53 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v54 = v53;
        for (i = 0; i != 64; i += 2)
        {
          v56 = *v52++;
          v57 = &v53[i];
          *v57 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v56 >> 4];
          v57[1] = MSVFastHexStringFromBytes_hexCharacters[v56 & 0xF];
        }
        v24 = objc_alloc(MEMORY[0x1E0CB3940]);
        v25 = v54;
        v26 = 64;
      }
      else
      {
        if (*(_QWORD *)v64 != 4512)
          goto LABEL_46;
        v31 = (unsigned __int8 *)v65 + 8;
        v32 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v33 = v32;
        for (j = 0; j != 128; j += 2)
        {
          v35 = *v31++;
          v36 = &v32[j];
          *v36 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v35 >> 4];
          v36[1] = MSVFastHexStringFromBytes_hexCharacters[v35 & 0xF];
        }
        v24 = objc_alloc(MEMORY[0x1E0CB3940]);
        v25 = v33;
        v26 = 128;
      }
    }
    else if (*(_QWORD *)v64 == 4000)
    {
      v42 = (unsigned __int8 *)v65 + 8;
      v43 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v44 = v43;
      for (k = 0; k != 32; k += 2)
      {
        v46 = *v42++;
        v47 = &v43[k];
        *v47 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v46 >> 4];
        v47[1] = MSVFastHexStringFromBytes_hexCharacters[v46 & 0xF];
      }
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      v25 = v44;
      v26 = 32;
    }
    else
    {
      if (*(_QWORD *)v64 != 4001)
        goto LABEL_46;
      v18 = (unsigned __int8 *)v65 + 8;
      v19 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v20 = v19;
      for (m = 0; m != 40; m += 2)
      {
        v22 = *v18++;
        v23 = &v19[m];
        *v23 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v22 >> 4];
        v23[1] = MSVFastHexStringFromBytes_hexCharacters[v22 & 0xF];
      }
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      v25 = v20;
      v26 = 40;
    }
LABEL_45:
    v58 = (CFStringRef)objc_msgSend(v24, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v25, v26, 4, 1, 4001, *(_QWORD *)v63);
LABEL_50:
    v61 = (__CFString *)v58;
    goto LABEL_51;
  }
  if (*(uint64_t *)v64 > 2999)
  {
    if (*(_QWORD *)v64 == 3000)
    {
      LODWORD(v67[0]) = bswap32(DWORD2(v65[0]));
      v48 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v49 = 0;
      v50 = v48 + 1;
      do
      {
        v51 = *((unsigned __int8 *)v67 + v49);
        *(v50 - 1) = MSVFastHexStringFromBytes_hexCharacters[v51 >> 4];
        *v50 = MSVFastHexStringFromBytes_hexCharacters[v51 & 0xF];
        v50 += 2;
        ++v49;
      }
      while (v49 != 4);
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      v25 = v48;
      v26 = 8;
    }
    else
    {
      if (*(_QWORD *)v64 != 3001)
        goto LABEL_46;
      v67[0] = bswap64(*((unint64_t *)&v65[0] + 1));
      v27 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v28 = 0;
      v29 = v27 + 1;
      do
      {
        v30 = *((unsigned __int8 *)v67 + v28);
        *(v29 - 1) = MSVFastHexStringFromBytes_hexCharacters[v30 >> 4];
        *v29 = MSVFastHexStringFromBytes_hexCharacters[v30 & 0xF];
        v29 += 2;
        ++v28;
      }
      while (v28 != 8);
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      v25 = v27;
      v26 = 16;
    }
    goto LABEL_45;
  }
  if (*(_QWORD *)v64 == 1000)
  {
    v37 = *((_QWORD *)&v65[0] + 1);
    v38 = (UInt8 *)&v68;
    quot = *((_QWORD *)&v65[0] + 1);
    do
    {
      v40 = lldiv(quot, 10);
      quot = v40.quot;
      if (v40.rem >= 0)
        LOBYTE(v41) = v40.rem;
      else
        v41 = -v40.rem;
      *v38-- = v41 + 48;
    }
    while (v40.quot);
    if (v37 < 0)
      *v38 = 45;
    else
      ++v38;
    v16 = (char *)v69 - (char *)v38;
    v17 = v38;
    goto LABEL_49;
  }
  if (*(_QWORD *)v64 == 2000)
  {
    v12 = 0;
    v13 = DWORD2(v65[0]);
    do
    {
      v14 = ldiv(v13, 10);
      v13 = v14.quot;
      if (v14.rem >= 0)
        LOBYTE(v15) = v14.rem;
      else
        v15 = -v14.rem;
      *(&v68 + v12--) = v15 + 48;
    }
    while (v14.quot);
    v16 = -v12;
    v17 = (const UInt8 *)v69 + v12;
LABEL_49:
    v58 = CFStringCreateWithBytes(0, v17, v16, 0x8000100u, 0);
    goto LABEL_50;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 4001, *(_QWORD *)v63);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

  v61 = &stru_1E30D5AF8;
LABEL_51:

  return v61;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (MRUserIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
