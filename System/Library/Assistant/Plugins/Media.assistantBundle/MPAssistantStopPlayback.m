@implementation MPAssistantStopPlayback

- (void)performWithCompletion:(id)a3
{
  id v4;
  MPAssistantPausePlayback *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(MPAssistantPausePlayback);
  -[MPAssistantStopPlayback hashedRouteUIDs](self, "hashedRouteUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAssistantPausePlayback setHashedRouteUIDs:](v5, "setHashedRouteUIDs:", v6);

  -[MPAssistantStopPlayback refId](self, "refId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAssistantPausePlayback setRefId:](v5, "setRefId:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC9A2BE8;
  v9[3] = &unk_1E88E38D8;
  v10 = v4;
  v8 = v4;
  -[MPAssistantPausePlayback performWithCompletion:](v5, "performWithCompletion:", v9);

}

@end
