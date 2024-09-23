@implementation BLTPBBulletin(BBBulletin)

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "When trying to add shouldAddToNotificationsList to user notification, found requestNotification but no content: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v0, "eventBehavior");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2173D9000, v2, v3, "Error encoding event behavior %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v0, "attributedMessage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2173D9000, v2, v3, "Error encoding attributed message %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v0, "threadSummary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2173D9000, v2, v3, "Error encoding thread summary %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.5()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v0, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2173D9000, v2, v3, "Error encoding summary %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)_attachmentFromBBAttachmentMetadata:()BBBulletin bulletin:observer:fileOption:attachOption:completion:.cold.1()
{
  __assert_rtn("+[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:]", "BLTPBBulletin+BBBulletin.m", 592, "completion != nil");
}

+ (void)_attachmentFromBBAttachmentMetadata:()BBBulletin bulletin:observer:fileOption:attachOption:completion:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v0, "publisherBulletinID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2173D9000, v2, v3, "%@ Image attachment processing failed for: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)_attachmentFromBBAttachmentMetadata:()BBBulletin bulletin:observer:fileOption:attachOption:completion:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "Unable to create temporary attachment file for bulletin %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

+ (void)_handleThumbnailResponse:()BBBulletin attachmentMetadata:transcodedAttachmentSaveURL:wantsData:imageContentType:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_2173D9000, v2, v3, "_handleThumbnailResponse: QLThumbnailGenerator could not generate thumbnail for attachement error:%@ url:%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

@end
