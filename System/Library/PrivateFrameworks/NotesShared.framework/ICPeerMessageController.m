@implementation ICPeerMessageController

- (ICPeerMessageController)init
{
  ICPeerMessageController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *deviceRequests;
  NSMutableDictionary *v5;
  NSMutableDictionary *sourceToDevices;
  NSMutableDictionary *v7;
  NSMutableDictionary *deviceUUIDToSource;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICPeerMessageController;
  v2 = -[ICPeerMessageController init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceRequests = v2->_deviceRequests;
    v2->_deviceRequests = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sourceToDevices = v2->_sourceToDevices;
    v2->_sourceToDevices = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceUUIDToSource = v2->_deviceUUIDToSource;
    v2->_deviceUUIDToSource = v7;

  }
  return v2;
}

- (id)deviceRequestsForUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRequests, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceRequests, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)requestNote:(id)a3 from:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  double v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  id v16;
  __CFString *v17;
  _QWORD v18[2];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("(null)");
    if (v7)
      v11 = v7;
    *(_DWORD *)buf = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "<< Request note %@ from %@.", buf, 0x16u);

  }
  v12 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
  v23 |= 1u;
  v25 = 7;
  v18[0] = 0;
  v18[1] = 0;
  objc_msgSend(v6, "getUUIDBytes:", v18, v12);
  v23 |= 4u;
  v13 = v24;
  if (!v24)
  {
    v13 = operator new();
    peernetworking::RequestNote::RequestNote((peernetworking::RequestNote *)v13);
    v24 = v13;
  }
  *(_DWORD *)(v13 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*(_QWORD *)(v13 + 40) == google::protobuf::internal::empty_string_)
  {
    v14 = (_QWORD *)operator new();
    *v14 = 0;
    v14[1] = 0;
    v14[2] = 0;
    *(_QWORD *)(v13 + 40) = v14;
  }
  MEMORY[0x1C3B7A7E8]();
  if (v7)
  {
    v17 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = -[ICPeerMessageController sendMessage:toDevices:](self, "sendMessage:toDevices:", buf, v15);
  if (v7)

  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
}

- (id)sendNote:(id)a3 toDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  versioned_document::Document *v17;
  void *v18;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "count"))
  {
    v18 = 0;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "networking");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "<< Send note %@.", buf, 0xCu);

    }
    v11 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
    v23 |= 1u;
    v25 = 7;
    objc_msgSend(v6, "uuid", v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getUUIDBytes:", &v20);

    v23 |= 2u;
    v13 = v24;
    if (!v24)
    {
      v13 = operator new();
      peernetworking::Note::Note((peernetworking::Note *)v13);
      v24 = v13;
    }
    *(_DWORD *)(v13 + 32) |= 1u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*(_QWORD *)(v13 + 40) == google::protobuf::internal::empty_string_)
    {
      v14 = (_QWORD *)operator new();
      *v14 = 0;
      v14[1] = 0;
      v14[2] = 0;
      *(_QWORD *)(v13 + 40) = v14;
    }
    MEMORY[0x1C3B7A7E8]();
    objc_msgSend(v6, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 |= 2u;
    v16 = v24;
    if (!v24)
    {
      v16 = operator new();
      peernetworking::Note::Note((peernetworking::Note *)v16);
      v24 = v16;
    }
    *(_DWORD *)(v16 + 32) |= 2u;
    v17 = *(versioned_document::Document **)(v16 + 48);
    if (!v17)
    {
      v17 = (versioned_document::Document *)operator new();
      versioned_document::Document::Document(v17);
      *(_QWORD *)(v16 + 48) = v17;
    }
    objc_msgSend(v15, "saveToArchive:", v17);

    -[ICPeerMessageController sendMessage:toDevices:](self, "sendMessage:toDevices:", buf, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
  }

  return v18;
}

- (void)sendMediaURL:(id)a3 toSource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "<< Send media %@.", buf, 0xCu);

  }
  v10 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
  v27 = 7;
  v25 |= 0x801u;
  v11 = v26;
  if (!v26)
  {
    v11 = operator new();
    peernetworking::Media::Media((peernetworking::Media *)v11);
    v26 = v11;
  }
  objc_msgSend(v6, "identifier", v10);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  *(_DWORD *)(v11 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*(_QWORD *)(v11 + 40) == google::protobuf::internal::empty_string_)
  {
    v13 = (_QWORD *)operator new();
    *v13 = 0;
    v13[1] = 0;
    v13[2] = 0;
    *(_QWORD *)(v11 + 40) = v13;
  }
  MEMORY[0x1C3B7A7DC]();

  v14 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(v6, "mediaURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataWithContentsOfURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v25 |= 0x800u;
  v17 = v26;
  if (!v26)
  {
    v17 = operator new();
    peernetworking::Media::Media((peernetworking::Media *)v17);
    v26 = v17;
  }
  v18 = objc_retainAutorelease(v16);
  objc_msgSend(v18, "bytes");
  objc_msgSend(v18, "length");
  *(_DWORD *)(v17 + 32) |= 2u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*(_QWORD *)(v17 + 48) == google::protobuf::internal::empty_string_)
  {
    v19 = (_QWORD *)operator new();
    *v19 = 0;
    v19[1] = 0;
    v19[2] = 0;
    *(_QWORD *)(v17 + 48) = v19;
  }
  MEMORY[0x1C3B7A7E8]();
  v22 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ICPeerMessageController sendMessage:toSources:](self, "sendMessage:toSources:", buf, v20);

  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
}

- (void)disconnectedFromSource:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sourceToDevices, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "-- Disconnected from %@.", (uint8_t *)&v7, 0xCu);
  }

  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_deviceRequests, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_sourceToDevices, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_deviceUUIDToSource, "removeObjectForKey:", v5);
  }

}

- (void)sendKeepAlive
{
  double v3;
  peernetworking::KeepAlive *v4;
  void *v5;
  id v6;
  _BYTE v7[32];
  int v8;
  peernetworking::KeepAlive *v9;
  int v10;

  v3 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v7);
  v10 = 7;
  v8 |= 0x1001u;
  if (!v9)
  {
    v4 = (peernetworking::KeepAlive *)operator new();
    v3 = peernetworking::KeepAlive::KeepAlive(v4);
    v9 = v4;
  }
  -[NSMutableDictionary allValues](self->_deviceUUIDToSource, "allValues", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICPeerMessageController sendMessage:toSources:](self, "sendMessage:toSources:", v7, v5);

  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v7);
}

- (void)handleNoteMessage:(const void *)a3 fromDevice:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  void *v12;
  ICTTMergeableStringVersionedDocument *v13;
  ICTTMergeableStringVersionedDocument *v14;
  uint64_t v15;
  void *v16;
  ICTTMergeableStringVersionedDocument *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  ICTTMergeableStringVersionedDocument *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v11 = (uint64_t *)*((_QWORD *)a3 + 5);
  if (*((char *)v11 + 23) < 0)
    v11 = (uint64_t *)*v11;
  v12 = (void *)objc_msgSend(v10, "initWithUUIDBytes:", v11);
  v13 = [ICTTMergeableStringVersionedDocument alloc];
  v14 = v13;
  v15 = *((_QWORD *)a3 + 6);
  if (!v15)
    v15 = *(_QWORD *)(peernetworking::Note::default_instance((peernetworking::Note *)v13) + 48);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ICTTVersionedDocument initWithArchive:replicaID:](v14, "initWithArchive:replicaID:", v15, v16);

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote noteWithUUID:context:](ICNote, "noteWithUUID:context:", v12, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v22;
    _os_log_impl(&dword_1BD918000, v21, OS_LOG_TYPE_INFO, ">> Handle note message %@", buf, 0xCu);

  }
  v23 = os_log_create("com.apple.notes", "networking");
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v24)
    {
      objc_msgSend(v12, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v25;
      _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_INFO, ">> Note update %@.", buf, 0xCu);

    }
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __61__ICPeerMessageController_handleNoteMessage_fromDevice_data___block_invoke;
    v32 = &unk_1E76CD1D8;
    v26 = v20;
    v33 = v26;
    v34 = v17;
    v27 = objc_msgSend(v26, "performMerge:", &v29);

    if (v27)
    {
      if (v27 == 2)
        objc_msgSend(v26, "setNoteHasChanges:", MEMORY[0x1E0C9AAB0], v29, v30, v31, v32);
    }
    else
    {
      -[ICPeerMessageController requestNote:from:](self, "requestNote:from:", v12, v8, v29, v30, v31, v32);
    }
  }
  else
  {
    if (v24)
    {
      objc_msgSend(v12, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_INFO, "   Ignored note update for non-shared/existant note %@.", buf, 0xCu);

    }
  }

}

uint64_t __61__ICPeerMessageController_handleNoteMessage_fromDevice_data___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mergeWithStringVersionedDocument:", *(_QWORD *)(a1 + 40));

  return v3;
}

- (void)handleRequestNoteMessage:(const void *)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v8 = (uint64_t *)*((_QWORD *)a3 + 5);
  if (*((char *)v8 + 23) < 0)
    v8 = (uint64_t *)*v8;
  v9 = (void *)objc_msgSend(v7, "initWithUUIDBytes:", v8);
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote noteWithUUID:context:](ICNote, "noteWithUUID:context:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, ">> Peer requested note %@.", buf, 0xCu);
  }

  if (v6)
  {
    v16 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = -[ICPeerMessageController sendNote:toDevices:](self, "sendNote:toDevices:", v12, v14);
  if (v6)

}

- (void)handleKeepAliveMessage:(const void *)a3 fromDevice:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, ">> KeepAlive: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)handleMessage:(id)a3 fromSource:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  NSObject *v10;
  _BYTE v11[32];
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sourceToDevices, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v11);
  v8 = objc_retainAutorelease(v6);
  v9 = google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, (char *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  if (v16 == 7)
  {
    if ((v12 & 2) != 0)
    {
      if (!v13)
        peernetworking::PeerNetworkMessage::default_instance((peernetworking::PeerNetworkMessage *)v9);
      -[ICPeerMessageController handleNoteMessage:fromDevice:data:](self, "handleNoteMessage:fromDevice:data:");
    }
    else if ((v12 & 4) != 0)
    {
      if (!v14)
        peernetworking::PeerNetworkMessage::default_instance((peernetworking::PeerNetworkMessage *)v9);
      -[ICPeerMessageController handleRequestNoteMessage:fromDevice:](self, "handleRequestNoteMessage:fromDevice:");
    }
    else if ((v12 & 0x1000) != 0)
    {
      if (!v15)
        peernetworking::PeerNetworkMessage::default_instance((peernetworking::PeerNetworkMessage *)v9);
      -[ICPeerMessageController handleKeepAliveMessage:fromDevice:](self, "handleKeepAliveMessage:fromDevice:");
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "networking");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICPeerMessageController handleMessage:fromSource:].cold.1(&v16, v10);

  }
  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v11);

}

- (id)sendMessage:(void *)a3 toDevices:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceUUIDToSource, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[ICPeerMessageController sendMessage:toSources:](self, "sendMessage:toSources:", a3, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)sendMessage:(void *)a3 toSources:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (*(unsigned int (**)(void *))(*(_QWORD *)a3 + 72))(a3)));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)a3, (void *)objc_msgSend(v7, "mutableBytes"), objc_msgSend(v7, "length"));
  if (objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          -[ICPeerMessageController delegate](self, "delegate", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sendMessage:toSource:error:", v7, v12, 0);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[ICPeerMessageController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendMessage:toSource:error:", v7, 0, 0);

  }
  return v7;
}

- (id)sendMessage:(void *)a3 toSource:(id)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  void *v11;
  id v12;
  id v14;

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (*(unsigned int (**)(void *))(*(_QWORD *)a3 + 72))(a3)));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)a3, (void *)objc_msgSend(v10, "mutableBytes"), objc_msgSend(v10, "length"));
  -[ICPeerMessageController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v11, "sendMessage:toSource:error:", v10, v8, &v14);
  v12 = v14;

  v9[2](v9, v12);
  return v10;
}

- (ICPeerMessageControllerDelegate)delegate
{
  return (ICPeerMessageControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceUUIDToSource, 0);
  objc_storeStrong((id *)&self->_sourceToDevices, 0);
  objc_storeStrong((id *)&self->_deviceRequests, 0);
}

- (void)handleNoteMessage:(uint8_t *)buf fromDevice:(os_log_t)log data:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "   A+B Merge Fail: %@\n%@", buf, 0x16u);

}

- (void)handleMessage:(int *)a1 fromSource:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = 7;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, ">> Multi-peer protocol version mismatch (%d != %d)", (uint8_t *)v3, 0xEu);
}

@end
