@implementation MPAssistantMoveOutputGroupToDevices

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MPAssistantMoveOutputGroupToDevices *v25;
  id v26;
  char v27;
  uint8_t buf[4];
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantMoveOutputGroupToDevices aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Move Output Group To Devices"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Move Output Group To Devices (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v10 = self->_requestAceHash;
  -[MPAssistantMoveOutputGroupToDevices hashedRouteUIDs](self, "hashedRouteUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Move Output Group To Devices"), v10, v11);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAssistantMoveOutputGroupToDevices groupID](self, "groupID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("LOCAL_DEVICE"));

  if ((v14 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    -[MPAssistantMoveOutputGroupToDevices groupID](self, "groupID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);

    -[MPAssistantMoveOutputGroupToDevices hashedRouteUIDs](self, "hashedRouteUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAssistantMoveOutputGroupToDevices groupID](self, "groupID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "containsObject:", v18);

  }
  -[MPAssistantMoveOutputGroupToDevices hashedRouteUIDs](self, "hashedRouteUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v19);

  v20 = objc_alloc_init(MEMORY[0x1E0D4B310]);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1CC98F634;
  v23[3] = &unk_1E88E3860;
  v24 = v20;
  v25 = self;
  v27 = v15;
  v26 = v4;
  v21 = v4;
  v22 = v20;
  objc_msgSend(v22, "decodeHashedRouteUIDs:completion:", v12, v23);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
