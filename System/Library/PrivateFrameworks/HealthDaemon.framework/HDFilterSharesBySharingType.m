@implementation HDFilterSharesBySharingType

uint64_t __HDFilterSharesBySharingType_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v8 = objc_msgSend(v7, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v17);

    if ((v8 & 1) != 0)
      goto LABEL_6;
    v5 = *(_QWORD *)(a1 + 32);
  }
  if ((v5 & 2) == 0)
    goto LABEL_7;
  objc_msgSend(v4, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v11 = objc_msgSend(v10, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v16, &v15);
  v12 = v16;

  if ((v11 & 1) == 0)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
LABEL_6:
  v13 = 1;
LABEL_8:

  return v13;
}

@end
