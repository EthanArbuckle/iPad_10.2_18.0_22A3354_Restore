@implementation MPCPlayPerfMetrics

- (NSString)eventType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_eventType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("eventType"));

}

- (NSNumber)eventTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eventTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_eventTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("eventTime"));

}

- (NSString)sectionIdentifier
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sectionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_sectionIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sectionIdentifier"));

}

- (NSString)itemIdentifier
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_itemIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("itemIdentifier"));

}

- (NSDictionary)itemMetadata
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("itemMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)set_itemMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("itemMetadata"));

}

- (NSString)featureName
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("featureName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_featureName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("featureName"));

}

- (NSString)siriRefId
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("siriRefId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_siriRefId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("siriRefId"));

}

- (NSString)queueType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("queueType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_queueType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("queueType"));

}

- (NSNumber)isRemoteSetQueue
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isRemoteSetQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isRemoteSetQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isRemoteSetQueue"));

}

- (NSNumber)isShuffled
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isShuffled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isShuffled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isShuffled"));

}

- (NSNumber)isAutoPlayEnabled
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isAutoPlayEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isAutoPlayEnabled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isAutoPlayEnabled"));

}

- (NSNumber)isSharePlay
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isSharePlay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isSharePlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isSharePlay"));

}

- (NSNumber)assetType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assetType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_assetType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("assetType"));

}

- (NSNumber)assetSource
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assetSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_assetSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("assetSource"));

}

- (NSNumber)assetLocation
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assetLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_assetLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("assetLocation"));

}

- (NSNumber)assetCacheAge
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assetCacheAge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_assetCacheAge:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("assetCacheAge"));

}

- (NSNumber)endpointType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("endpointType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_endpointType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("endpointType"));

}

- (NSNumber)subscriptionType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("subscriptionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_subscriptionType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("subscriptionType"));

}

- (NSNumber)isDelegatedPlayback
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isDelegatedPlayback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isDelegatedPlayback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isDelegatedPlayback"));

}

- (NSNumber)hasOnlinePlaybackKeys
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hasOnlinePlaybackKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_hasOnlinePlaybackKeys:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("hasOnlinePlaybackKeys"));

}

- (NSNumber)hasOfflinePlaybackKeys
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hasOfflinePlaybackKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_hasOfflinePlaybackKeys:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("hasOfflinePlaybackKeys"));

}

- (NSDictionary)formatInfo
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("formatInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)set_formatInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("formatInfo"));

}

- (NSDictionary)routeInfo
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("routeInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)set_routeInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("routeInfo"));

}

- (NSNumber)networkType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("networkType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_networkType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("networkType"));

}

- (NSNumber)isFirstPlay
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isFirstPlay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isFirstPlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isFirstPlay"));

}

- (NSNumber)isReplacingPlayback
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isReplacingPlayback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isReplacingPlayback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isReplacingPlayback"));

}

- (NSNumber)errorResolution
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("errorResolution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_errorResolution:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("errorResolution"));

}

- (NSString)errorSignature
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("errorSignature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_errorSignature:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("errorSignature"));

}

- (NSNumber)hasAccountInfo
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hasAccountInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_hasAccountInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("hasAccountInfo"));

}

- (NSNumber)isActiveAccount
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isActiveAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_isActiveAccount:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("isActiveAccount"));

}

- (NSNumber)seekBeforePlaying
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("seekBeforePlaying"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_seekBeforePlaying:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("seekBeforePlaying"));

}

- (NSNumber)queueCommandType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("queueCommandType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_queueCommandType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("queueCommandType"));

}

- (NSString)storefront
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("storefront"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_storefront:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("storefront"));

}

- (NSString)experimentID
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("experimentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_experimentID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("experimentID"));

}

- (NSString)treatmentID
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("treatmentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)set_treatmentID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("treatmentID"));

}

- (NSNumber)vocalsControlActive
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("vocalsControlActive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_vocalsControlActive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("vocalsControlActive"));

}

- (NSNumber)assetProtectionType
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assetProtectionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_assetProtectionType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("assetProtectionType"));

}

- (NSDictionary)AVPlayerItemPerformanceMetrics
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AVPlayerItemPerformanceMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)set_AVPlayerItemPerformanceMetrics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("AVPlayerItemPerformanceMetrics"));

}

- (NSNumber)timeSinceBoot
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("timeSinceBoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_timeSinceBoot:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("timeSinceBoot"));

}

- (NSNumber)timeSinceLaunch
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("timeSinceLaunch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_timeSinceLaunch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("timeSinceLaunch"));

}

- (NSNumber)timeSincePaused
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("timeSincePaused"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_timeSincePaused:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("timeSincePaused"));

}

- (NSNumber)setQueueCommandSendTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("setQueueCommandSendTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_setQueueCommandSendTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("setQueueCommandSendTime"));

}

- (NSNumber)playCommandSendTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("playCommandSendTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_playCommandSendTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("playCommandSendTime"));

}

- (NSNumber)queueLoadWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("queueLoadWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_queueLoadWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("queueLoadWaitTime"));

}

- (NSNumber)assetLoadWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assetLoadWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_assetLoadWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("assetLoadWaitTime"));

}

- (NSNumber)readyToPlayStatusWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("readyToPlayStatusWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_readyToPlayStatusWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("readyToPlayStatusWaitTime"));

}

- (NSNumber)playCommandWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("playCommandWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_playCommandWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("playCommandWaitTime"));

}

- (NSNumber)rateChangeWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rateChangeWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_rateChangeWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("rateChangeWaitTime"));

}

- (NSNumber)firstAudioFrameWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("firstAudioFrameWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_firstAudioFrameWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("firstAudioFrameWaitTime"));

}

- (NSNumber)nextItemWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nextItemWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_nextItemWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("nextItemWaitTime"));

}

- (NSNumber)lookupWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("lookupWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_lookupWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("lookupWaitTime"));

}

- (NSNumber)bagWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bagWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_bagWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("bagWaitTime"));

}

- (NSNumber)leaseWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("leaseWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_leaseWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("leaseWaitTime"));

}

- (NSNumber)suzeLeaseWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("suzeLeaseWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_suzeLeaseWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("suzeLeaseWaitTime"));

}

- (NSNumber)subscriptionAssetLoadWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("subscriptionAssetLoadWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_subscriptionAssetLoadWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("subscriptionAssetLoadWaitTime"));

}

- (NSNumber)mediaRedownloadWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mediaRedownloadWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_mediaRedownloadWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("mediaRedownloadWaitTime"));

}

- (NSNumber)hlsMetadataWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hlsMetadataWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_hlsMetadataWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("hlsMetadataWaitTime"));

}

- (NSNumber)sessionActivationWaitTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sessionActivationWaitTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_sessionActivationWaitTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sessionActivationWaitTime"));

}

- (NSNumber)sessionActivationAVTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sessionActivationAVTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_sessionActivationAVTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sessionActivationAVTime"));

}

- (NSNumber)sessionActivationClientTime
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sessionActivationClientTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_sessionActivationClientTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sessionActivationClientTime"));

}

- (NSNumber)checkpointMRSetQueueBegin
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointMRSetQueueBegin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointMRSetQueueBegin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointMRSetQueueBegin"));

}

- (NSNumber)checkpointSetQueueBegin
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointSetQueueBegin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointSetQueueBegin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointSetQueueBegin"));

}

- (NSNumber)checkpointRateZero
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointRateZero"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointRateZero:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointRateZero"));

}

- (NSNumber)checkpointSetQueueEnd
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointSetQueueEnd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointSetQueueEnd:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointSetQueueEnd"));

}

- (NSNumber)checkpointMRPlay
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointMRPlay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointMRPlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointMRPlay"));

}

- (NSNumber)checkpointPlay
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointPlay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointPlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointPlay"));

}

- (NSNumber)checkpointAssetLoadBegin
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointAssetLoadBegin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointAssetLoadBegin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointAssetLoadBegin"));

}

- (NSNumber)checkpointAssetLoadEnd
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointAssetLoadEnd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointAssetLoadEnd:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointAssetLoadEnd"));

}

- (NSNumber)checkpointLikelyToKeepUp
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointLikelyToKeepUp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointLikelyToKeepUp:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointLikelyToKeepUp"));

}

- (NSNumber)checkpointReadyToPlay
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointReadyToPlay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointReadyToPlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointReadyToPlay"));

}

- (NSNumber)checkpointRateOne
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointRateOne"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointRateOne:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointRateOne"));

}

- (NSNumber)checkpointFirstAudioFrame
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("checkpointFirstAudioFrame"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)set_checkpointFirstAudioFrame:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCPlayPerfMetrics data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("checkpointFirstAudioFrame"));

}

- (MPCPlayPerfMetrics)init
{
  MPCPlayPerfMetrics *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPCPlayPerfMetrics;
  v2 = -[MPCPlayPerfMetrics init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics setData:](v2, "setData:", v3);

  }
  return v2;
}

- (NSNumber)musicTotalTime
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;

  -[MPCPlayPerfMetrics eventType](self, "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FirstItem"));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[MPCPlayPerfMetrics setQueueCommandSendTime](self, "setQueueCommandSendTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    -[MPCPlayPerfMetrics sessionActivationWaitTime](self, "sessionActivationWaitTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v8 + v10;
    -[MPCPlayPerfMetrics queueLoadWaitTime](self, "queueLoadWaitTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v11 + v13;
    -[MPCPlayPerfMetrics assetLoadWaitTime](self, "assetLoadWaitTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v14 + v16;
    -[MPCPlayPerfMetrics readyToPlayStatusWaitTime](self, "readyToPlayStatusWaitTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v17 + v19;
    -[MPCPlayPerfMetrics rateChangeWaitTime](self, "rateChangeWaitTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v20 + v22;
    -[MPCPlayPerfMetrics firstAudioFrameWaitTime](self, "firstAudioFrameWaitTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v23 + v25;
    -[MPCPlayPerfMetrics sessionActivationClientTime](self, "sessionActivationClientTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:", v26 - v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  return (NSNumber *)v29;
}

- (NSNumber)musicWaitTime
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  -[MPCPlayPerfMetrics eventType](self, "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FirstItem"));

  if (v4)
  {
    -[MPCPlayPerfMetrics playCommandWaitTime](self, "playCommandWaitTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      -[MPCPlayPerfMetrics playCommandSendTime](self, "playCommandSendTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;
      -[MPCPlayPerfMetrics rateChangeWaitTime](self, "rateChangeWaitTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v9 + v11;
      -[MPCPlayPerfMetrics firstAudioFrameWaitTime](self, "firstAudioFrameWaitTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v12 + v14;
      -[MPCPlayPerfMetrics playCommandWaitTime](self, "playCommandWaitTime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      v19 = 0.0;
      if (v18 <= 0.0)
        v19 = v18;
      objc_msgSend(v6, "numberWithDouble:", v15 - v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MPCPlayPerfMetrics musicTotalTime](self, "musicTotalTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v20 = 0;
  }
  return (NSNumber *)v20;
}

- (NSNumber)mediaPlayerTime
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  -[MPCPlayPerfMetrics eventType](self, "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FirstItem"));

  if (v4)
  {
    v41 = (void *)MEMORY[0x24BDD16E0];
    -[MPCPlayPerfMetrics sessionActivationWaitTime](self, "sessionActivationWaitTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    v6 = v5;
    -[MPCPlayPerfMetrics queueLoadWaitTime](self, "queueLoadWaitTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v8 = v6 + v7;
    -[MPCPlayPerfMetrics assetLoadWaitTime](self, "assetLoadWaitTime");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    v10 = v8 + v9;
    -[MPCPlayPerfMetrics rateChangeWaitTime](self, "rateChangeWaitTime");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    v12 = v10 + v11;
    -[MPCPlayPerfMetrics sessionActivationAVTime](self, "sessionActivationAVTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v12 - v14;
    -[MPCPlayPerfMetrics sessionActivationClientTime](self, "sessionActivationClientTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v15 - v17;
    -[MPCPlayPerfMetrics lookupWaitTime](self, "lookupWaitTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v18 - v20;
    -[MPCPlayPerfMetrics bagWaitTime](self, "bagWaitTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v21 - v23;
    -[MPCPlayPerfMetrics leaseWaitTime](self, "leaseWaitTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v24 - v26;
    -[MPCPlayPerfMetrics suzeLeaseWaitTime](self, "suzeLeaseWaitTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v27 - v29;
    -[MPCPlayPerfMetrics subscriptionAssetLoadWaitTime](self, "subscriptionAssetLoadWaitTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v30 - v32;
    -[MPCPlayPerfMetrics mediaRedownloadWaitTime](self, "mediaRedownloadWaitTime");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v33 - v35;
    -[MPCPlayPerfMetrics hlsMetadataWaitTime](self, "hlsMetadataWaitTime");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    objc_msgSend(v41, "numberWithDouble:", v36 - v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }
  return (NSNumber *)v39;
}

- (NSNumber)networkTime
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;

  -[MPCPlayPerfMetrics eventType](self, "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FirstItem"));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[MPCPlayPerfMetrics lookupWaitTime](self, "lookupWaitTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    -[MPCPlayPerfMetrics bagWaitTime](self, "bagWaitTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v8 + v10;
    -[MPCPlayPerfMetrics leaseWaitTime](self, "leaseWaitTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v11 + v13;
    -[MPCPlayPerfMetrics suzeLeaseWaitTime](self, "suzeLeaseWaitTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v14 + v16;
    -[MPCPlayPerfMetrics subscriptionAssetLoadWaitTime](self, "subscriptionAssetLoadWaitTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v17 + v19;
    -[MPCPlayPerfMetrics mediaRedownloadWaitTime](self, "mediaRedownloadWaitTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v20 + v22;
    -[MPCPlayPerfMetrics hlsMetadataWaitTime](self, "hlsMetadataWaitTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:", v23 + v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  return (NSNumber *)v26;
}

- (NSNumber)avTime
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;

  -[MPCPlayPerfMetrics eventType](self, "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FirstItem"));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[MPCPlayPerfMetrics readyToPlayStatusWaitTime](self, "readyToPlayStatusWaitTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    -[MPCPlayPerfMetrics firstAudioFrameWaitTime](self, "firstAudioFrameWaitTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v8 + v10;
    -[MPCPlayPerfMetrics sessionActivationAVTime](self, "sessionActivationAVTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:", v11 + v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return (NSNumber *)v14;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[MPCPlayPerfMetrics data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MPCPlayPerfMetrics data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MPCPlayPerfMetrics musicTotalTime](self, "musicTotalTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("totalTime"));

  -[MPCPlayPerfMetrics musicWaitTime](self, "musicWaitTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("musicWaitTime"));

  -[MPCPlayPerfMetrics mediaPlayerTime](self, "mediaPlayerTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("mediaPlayerTime"));

  -[MPCPlayPerfMetrics avTime](self, "avTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("avTime"));

  -[MPCPlayPerfMetrics networkTime](self, "networkTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("networkTime"));

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)jsonObject
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  int v39;
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
  uint64_t v51;
  __CFString *v52;
  MPCPlayPerfMetrics *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  MPCPlayPerfMetrics *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  unint64_t v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  const __CFString *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const __CFString *v114;
  void *v115;
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[3];
  _QWORD v119[4];

  v119[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics eventType](self, "eventType");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("FirstItem")
    || (v5 = v4, v6 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("FirstItem")), v5, v5, v6))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics setQueueCommandSendTime](self, "setQueueCommandSendTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("MRT"), CFSTR("SendQueue"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayPerfMetrics isRemoteSetQueue](self, "isRemoteSetQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v10, CFSTR("WHA"), objc_msgSend(v11, "BOOLValue"));

    objc_msgSend(v7, "addObject:", v10);
    -[MPCPlayPerfMetrics sessionActivationWaitTime](self, "sessionActivationWaitTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("AVT"), CFSTR("SessionActivation"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayPerfMetrics routeInfo](self, "routeInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v13, CFSTR("Bluetooth"), (v16 & 0xFFFFFFFFFFFFFFFELL) == 4);
    -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v13, CFSTR("AirPlay"), v16 == 9);
    v17 = (void *)MEMORY[0x24BDD16E0];
    -[MPCPlayPerfMetrics sessionActivationWaitTime](self, "sessionActivationWaitTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
    -[MPCPlayPerfMetrics sessionActivationAVTime](self, "sessionActivationAVTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v20 - v22;
    -[MPCPlayPerfMetrics sessionActivationClientTime](self, "sessionActivationClientTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v17, "numberWithDouble:", v23 - v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v13, CFSTR("StackInit"), v26, 0);

    -[MPCPlayPerfMetrics sessionActivationAVTime](self, "sessionActivationAVTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v13, CFSTR("AVAudioSession"), v27, 0);

    -[MPCPlayPerfMetrics sessionActivationClientTime](self, "sessionActivationClientTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    if (v30 > 0.0)
    {
      -[MPCPlayPerfMetrics sessionActivationClientTime](self, "sessionActivationClientTime");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v13, CFSTR("Delegate"), v31, 0);

    }
    objc_msgSend(v7, "addObject:", v13);

    -[MPCPlayPerfMetrics queueLoadWaitTime](self, "queueLoadWaitTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("MPT"), CFSTR("QueueLoad"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayPerfMetrics siriRefId](self, "siriRefId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[MPCPlayPerfMetrics assetSource](self, "assetSource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "integerValue") <= 2)
      {
        -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)self, v33, CFSTR("SiriAssetInfo"), 0);
      }
      else
      {
        -[MPCPlayPerfMetrics assetSource](self, "assetSource");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)self, v33, CFSTR("SiriAssetInfo"), objc_msgSend(v36, "integerValue") < 6);

      }
    }
    -[MPCPlayPerfMetrics lookupWaitTime](self, "lookupWaitTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v33, CFSTR("Queue"), v40, 1);

    objc_msgSend(v7, "addObject:", v33);
    -[MPCPlayPerfMetrics assetLoadWaitTime](self, "assetLoadWaitTime");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("MPT"), CFSTR("AssetLoad"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayPerfMetrics bagWaitTime](self, "bagWaitTime");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, CFSTR("Bag"), v43, 1);

    -[MPCPlayPerfMetrics leaseWaitTime](self, "leaseWaitTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, CFSTR("Lease"), v44, 1);

    -[MPCPlayPerfMetrics suzeLeaseWaitTime](self, "suzeLeaseWaitTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, CFSTR("SuzeLease"), v45, 1);

    -[MPCPlayPerfMetrics subscriptionAssetLoadWaitTime](self, "subscriptionAssetLoadWaitTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, CFSTR("MZPlay: SubPlaybackDispatch"), v46, 1);

    -[MPCPlayPerfMetrics mediaRedownloadWaitTime](self, "mediaRedownloadWaitTime");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, CFSTR("MZPlay: PaidRedownload"), v47, 1);

    -[MPCPlayPerfMetrics hlsMetadataWaitTime](self, "hlsMetadataWaitTime");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics assetLocation](self, "assetLocation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, CFSTR("HLS MVP"), v48, objc_msgSend(v49, "integerValue") == 0);

    -[MPCPlayPerfMetrics assetLocation](self, "assetLocation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "integerValue");

    if (v51)
    {
      if (v51 == 3)
      {
        v52 = CFSTR("Downloaded");
      }
      else
      {
        if (v51 != 1)
          goto LABEL_21;
        v52 = CFSTR("Cached");
      }
      v53 = self;
      v54 = v42;
      v55 = 1;
    }
    else
    {
      v52 = CFSTR("Cached");
      v53 = self;
      v54 = v42;
      v55 = 0;
    }
    -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)v53, v54, v52, v55);
LABEL_21:
    -[MPCPlayPerfMetrics assetSource](self, "assetSource");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "integerValue");

    if ((unint64_t)(v57 - 3) >= 3)
    {
      if (v57 != 6)
        goto LABEL_29;
      v61 = CFSTR("SOD");
      v62 = self;
      v63 = v42;
      v64 = 0;
    }
    else
    {
      -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)self, v42, CFSTR("SOD"), 1);
      -[MPCPlayPerfMetrics assetSource](self, "assetSource");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v58, "integerValue") != 5)
      {

LABEL_29:
        objc_msgSend(v7, "addObject:", v42);

        -[MPCPlayPerfMetrics readyToPlayStatusWaitTime](self, "readyToPlayStatusWaitTime");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("AVT"), CFSTR("ReadyToPlay"), v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPCPlayPerfMetrics assetType](self, "assetType");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v66, CFSTR("HLS"), objc_msgSend(v67, "integerValue") > 1);

        objc_msgSend(v7, "addObject:", v66);
        -[MPCPlayPerfMetrics playCommandSendTime](self, "playCommandSendTime");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("MRT"), CFSTR("SendPlay"), v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPCPlayPerfMetrics isRemoteSetQueue](self, "isRemoteSetQueue");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v69, CFSTR("WHA"), objc_msgSend(v70, "BOOLValue"));

        objc_msgSend(v7, "addObject:", v69);
        -[MPCPlayPerfMetrics rateChangeWaitTime](self, "rateChangeWaitTime");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("MPT"), CFSTR("ChangeRate"), v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPCPlayPerfMetrics assetLocation](self, "assetLocation");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "integerValue");

        if (v74 == 3)
        {
          -[MPCPlayPerfMetrics hasOfflinePlaybackKeys](self, "hasOfflinePlaybackKeys");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v72, CFSTR("No Offline Slot"), objc_msgSend(v75, "BOOLValue") ^ 1);

        }
        objc_msgSend(v7, "addObject:", v72);

        -[MPCPlayPerfMetrics firstAudioFrameWaitTime](self, "firstAudioFrameWaitTime");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, CFSTR("AVT"), CFSTR("FirstAudioFrame"), v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v77);
        -[MPCPlayPerfMetrics endpointType](self, "endpointType");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "integerValue");

        if ((unint64_t)(v79 - 1) <= 2)
          objc_msgSend(v8, "addObject:", off_24CABA968[v79 - 1]);
        -[MPCPlayPerfMetrics assetType](self, "assetType");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "integerValue") - 1;
        if (v81 > 4)
          v82 = CFSTR("Unspecified");
        else
          v82 = off_24CABA980[v81];
        objc_msgSend(v8, "addObject:", v82);

        -[MPCPlayPerfMetrics formatInfo](self, "formatInfo");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("sampleRate"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "integerValue");

        if (v85 >= 1)
        {
          v86 = (void *)MEMORY[0x24BDD17C8];
          -[MPCPlayPerfMetrics formatInfo](self, "formatInfo");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("sampleRate"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "stringWithFormat:", CFSTR("%ldKHz"), objc_msgSend(v88, "integerValue") / 1000);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v89);

        }
        -[MPCPlayPerfMetrics formatInfo](self, "formatInfo");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("bitrate"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "integerValue");

        if (v92 >= 1)
        {
          v93 = (void *)MEMORY[0x24BDD17C8];
          -[MPCPlayPerfMetrics formatInfo](self, "formatInfo");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("bitrate"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "stringWithFormat:", CFSTR("%ldKbps"), objc_msgSend(v95, "integerValue") / 1000);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v96);

        }
        -[MPCPlayPerfMetrics formatInfo](self, "formatInfo");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("channelLayout"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend(v98, "integerValue");

        if (v99)
        {
          -[MPCPlayPerfMetrics formatInfo](self, "formatInfo");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("channelLayout"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = (unsigned __int16)objc_msgSend(v101, "integerValue");

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ldch"), v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v103);

        }
        -[MPCPlayPerfMetrics assetProtectionType](self, "assetProtectionType");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend(v104, "integerValue");

        if (v105)
        {
          if (v105 == 2)
          {
            -[MPCPlayPerfMetrics assetType](self, "assetType");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend(v107, "integerValue");

            if (v108 == 1)
            {
              -[MPCPlayPerfMetrics assetSource](self, "assetSource");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = objc_msgSend(v109, "integerValue");

              if (v110 == 5)
                v106 = CFSTR("DRM:miniSINF");
              else
                v106 = CFSTR("DRM:SINF");
            }
            else
            {
              v106 = CFSTR("DRM:FPS");
            }
          }
          else
          {
            if (v105 != 1)
            {
LABEL_53:
              v118[0] = CFSTR("name");
              v118[1] = CFSTR("segments");
              v119[0] = CFSTR("MPP");
              v119[1] = v7;
              v118[2] = CFSTR("tags");
              v119[2] = v8;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 3);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v111);

              goto LABEL_54;
            }
            v106 = CFSTR("DRM:Standard");
          }
        }
        else
        {
          v106 = CFSTR("DRM:None");
        }
        objc_msgSend(v8, "addObject:", v106);
        goto LABEL_53;
      }
      -[MPCPlayPerfMetrics assetType](self, "assetType");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "integerValue");

      if (v60 != 1)
        goto LABEL_29;
      v61 = CFSTR("miniSINF");
      v62 = self;
      v63 = v42;
      v64 = 1;
    }
    -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)v62, v63, v61, v64);
    goto LABEL_29;
  }
  -[MPCPlayPerfMetrics eventType](self, "eventType");
  v37 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v37 == CFSTR("NextItem")
    || (v38 = v37,
        v39 = -[__CFString isEqual:](v37, "isEqual:", CFSTR("NextItem")),
        v38,
        v38,
        v39))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = CFSTR("name");
    v116[1] = CFSTR("segments");
    v117[0] = CFSTR("GAP");
    v117[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);
LABEL_54:

  }
  v114 = CFSTR("metrics");
  v115 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  return v112;
}

- (void)addQueueMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feature-name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_featureName:](self, "set_featureName:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siri-ref-id"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MPCPlayPerfMetrics set_siriRefId:](self, "set_siriRefId:", v6);
}

- (void)addPlaybackBehaviorWithCursor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "findPreviousEventWithType:matchingPayload:", CFSTR("playback-behavior-changed"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = v4;
    objc_msgSend(v4, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playback-behavior-metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shuffle-type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8 != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_isShuffled:](self, "set_isShuffled:", v9);

    objc_msgSend(v14, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("playback-behavior-metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("autoplay-mode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v12, "intValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (_DWORD)v7 == 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_isAutoPlayEnabled:](self, "set_isAutoPlayEnabled:", v13);

    v4 = v14;
  }

}

- (void)addSharePlayWithCursor:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "findPreviousEventWithType:matchingPayload:", CFSTR("session-begin"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("behavior-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 == 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_isSharePlay:](self, "set_isSharePlay:", v7);

}

- (void)addNetworkTimesWithScopedCursor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("blocks-playback");
  v18[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__MPCPlayPerfMetrics_addNetworkTimesWithScopedCursor___block_invoke;
  v15[3] = &unk_24CABA858;
  v15[4] = self;
  v16 = v6;
  v8 = v6;
  objc_msgSend(v5, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("network-operation"), v7, v15);

  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CB16F80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_bagWaitTime:](self, "set_bagWaitTime:", v9);

  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CB16F98);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_lookupWaitTime:](self, "set_lookupWaitTime:", v10);

  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CB16FB0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_leaseWaitTime:](self, "set_leaseWaitTime:", v11);

  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CB16FC8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_suzeLeaseWaitTime:](self, "set_suzeLeaseWaitTime:", v12);

  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CB16FE0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_subscriptionAssetLoadWaitTime:](self, "set_subscriptionAssetLoadWaitTime:", v13);

  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CB16FF8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_mediaRedownloadWaitTime:](self, "set_mediaRedownloadWaitTime:", v14);

}

- (void)addSessionActivationTimesWithScopedCursor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[8];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__29048;
  v22[4] = __Block_byref_object_dispose__29049;
  v23 = 0;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v24[0] = CFSTR("session-activation-end");
  v24[1] = CFSTR("session-activation-begin");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__MPCPlayPerfMetrics_addSessionActivationTimesWithScopedCursor___block_invoke;
  v9[3] = &unk_24CABA8A0;
  v9[4] = v22;
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  objc_msgSend(v4, "enumeratePreviousEventsWithTypes:usingBlock:", v5, v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_sessionActivationWaitTime:](self, "set_sessionActivationWaitTime:", v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_sessionActivationAVTime:](self, "set_sessionActivationAVTime:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_sessionActivationClientTime:](self, "set_sessionActivationClientTime:", v8);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);

}

- (void)addAssetSelectionWithCursor:(id)a3 itemIDPayload:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v44 = a4;
  objc_msgSend(v43, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-selection"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(v42, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("asset-load-info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_assetType:](self, "set_assetType:", v8);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-source"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_assetSource:](self, "set_assetSource:", v9);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-protection-type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_assetProtectionType:](self, "set_assetProtectionType:", v10);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_assetLocation:](self, "set_assetLocation:", v11);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-cache-age"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_assetCacheAge:](self, "set_assetCacheAge:", v12);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-endpoint-type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_endpointType:](self, "set_endpointType:", v13);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-is-delegated-playback"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_isDelegatedPlayback:](self, "set_isDelegatedPlayback:", v14);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-has-online-keys"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_hasOnlinePlaybackKeys:](self, "set_hasOnlinePlaybackKeys:", v15);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-asset-has-offline-keys"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_hasOfflinePlaybackKeys:](self, "set_hasOfflinePlaybackKeys:", v16);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("experiment-id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_experimentID:](self, "set_experimentID:", v17);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("experiment-treatment-id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_treatmentID:](self, "set_treatmentID:", v18);

  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__29048;
  v50 = __Block_byref_object_dispose__29049;
  v51 = 0;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __64__MPCPlayPerfMetrics_addAssetSelectionWithCursor_itemIDPayload___block_invoke;
  v45[3] = &unk_24CABA670;
  v45[4] = &v46;
  objc_msgSend(v43, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("audio-format-changed"), v44, v45);
  v19 = (void *)v47[5];
  if (v19)
  {
    v20 = v19;
    v52 = CFSTR("tier");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "tier"));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v60 = v41;
    v53 = CFSTR("bitrate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "bitrate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v21;
    v54 = CFSTR("sampleRate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "sampleRate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v22;
    v55 = CFSTR("bitDepth");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "bitDepth"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v23;
    v56 = CFSTR("codec");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v20, "codec"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v24;
    v57 = CFSTR("channelLayout");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v20, "channelLayout"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v25;
    v58 = CFSTR("spatialized");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v20, "isSpatialized"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v26;
    v59 = CFSTR("multiChannel");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v20, "isMultiChannel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v52, 8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayPerfMetrics set_formatInfo:](self, "set_formatInfo:", v28);
  }
  objc_msgSend(v43, "findPreviousEventWithType:matchingPayload:", CFSTR("item-configuration-end"), v44);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "payload");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("hls-metadata-wait-time"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_hlsMetadataWaitTime:](self, "set_hlsMetadataWaitTime:", v32);

    objc_msgSend(v30, "payload");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("audio-route"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = v34;
      v52 = CFSTR("name");
      objc_msgSend(v35, "name");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      v38 = &stru_24CABB5D0;
      if (v36)
        v38 = (const __CFString *)v36;
      v60 = v38;
      v53 = CFSTR("type");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v35, "type"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v39;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v52, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPCPlayPerfMetrics set_routeInfo:](self, "set_routeInfo:", v40);
    }

  }
  _Block_object_dispose(&v46, 8);

}

- (void)addEnvironmentInfoWithCursor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "findPreviousEventWithType:matchingPayload:", CFSTR("network-type-changed"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("network-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayPerfMetrics set_networkType:](self, "set_networkType:", v5);

}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

void __64__MPCPlayPerfMetrics_addAssetSelectionWithCursor_itemIDPayload___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("item-audio-format-metadata"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("active-format"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __64__MPCPlayPerfMetrics_addSessionActivationTimesWithScopedCursor___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("session-activation-end"));

  if (v4)
  {
    v5 = *(_QWORD *)(a1[4] + 8);
    v6 = v20;
    v7 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
LABEL_8:

    v10 = v20;
    goto LABEL_9;
  }
  objc_msgSend(v20, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("session-activation-begin"));

  v10 = v20;
  if (v9)
  {
    v11 = *(_QWORD *)(a1[4] + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      objc_msgSend(v12, "durationSinceEvent:", v20);
      *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v13 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "payload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("session-activation-av-time"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v16 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);

      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "payload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("session-activation-client-time"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = v19 + *(double *)(*(_QWORD *)(a1[7] + 8) + 24);

      v11 = *(_QWORD *)(a1[4] + 8);
      v7 = *(void **)(v11 + 40);
    }
    else
    {
      v7 = 0;
    }
    *(_QWORD *)(v11 + 40) = 0;
    goto LABEL_8;
  }
LABEL_9:

}

void __54__MPCPlayPerfMetrics_addNetworkTimesWithScopedCursor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v24 = a2;
  objc_msgSend(v24, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v24, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v13))
    goto LABEL_10;
  v14 = objc_msgSend(v12, "isEqualToString:", v12);

  if (v14)
  {
    objc_msgSend(v24, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("network-operation-type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("network-metrics"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;
    objc_msgSend(v17, "networkTime");
    objc_msgSend(v18, "numberWithDouble:", v21 + v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, v13);

LABEL_10:
  }

}

- (id)_buildSegmentForComponent:(void *)a3 subcomponent:(void *)a4 duration:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v18[0] = CFSTR("component");
  v18[1] = CFSTR("subcomponent");
  v19[0] = a2;
  v19[1] = a3;
  v7 = &unk_24CB175A0;
  if (a4)
    v7 = a4;
  v19[2] = v7;
  v18[2] = CFSTR("duration");
  v18[3] = CFSTR("complexities");
  v8 = (void *)MEMORY[0x24BDBCEB8];
  v9 = a4;
  v10 = a3;
  v11 = a2;
  objc_msgSend(v8, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v12;
  v18[4] = CFSTR("optimizations");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v13;
  v18[5] = CFSTR("steps");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_addComplexityToSegment:(void *)a3 complexity:(int)a4 when:
{
  id v5;
  id v6;

  if (a1)
  {
    if (a4)
    {
      v5 = a3;
      objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("complexities"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v5);

    }
  }
}

- (void)_addStepToSegment:(void *)a3 name:(void *)a4 duration:(char)a5 options:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a4)
    {
      v8 = a4;
      v9 = a3;
      objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("steps"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = CFSTR("name");
      v13[1] = CFSTR("duration");
      v14[0] = v9;
      v14[1] = v8;
      v13[2] = CFSTR("isNetworkBound");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a5 & 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addObject:", v12);
    }
  }
}

- (void)_addOptimizationToSegment:(void *)a3 optimization:(uint64_t)a4 when:
{
  id v6;
  void *v7;
  id v8;

  if (a1)
  {
    v6 = a3;
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("optimizations"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  }
}

+ (id)playMetricsWithItemReadyForMetricsEvent:(id)a3 cursor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  MPCPlayPerfMetrics *v26;
  MPCPlayPerfMetrics *v27;
  const __CFString *v28;
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
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  _BOOL8 v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  double v165;
  double v166;
  void *v167;
  double v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  double v221;
  double v222;
  void *v223;
  void *v224;
  double v225;
  double v226;
  _BOOL4 v227;
  const __CFString *v228;
  void *v229;
  double v230;
  _BOOL4 v231;
  const __CFString *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v237;
  void *v238;
  void *v239;
  uint64_t v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  NSObject *log;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  mach_timebase_info info[2];
  __int128 v275;
  uint64_t v276;
  _QWORD v277[4];
  id v278;
  uint64_t (*v279)(uint64_t, uint64_t);
  _BYTE *v280;
  uint64_t *v281;
  uint64_t v282;
  uint64_t *v283;
  uint64_t v284;
  uint64_t (*v285)(uint64_t, uint64_t);
  void (*v286)(uint64_t);
  id v287;
  _QWORD v288[5];
  _QWORD v289[6];
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  uint64_t (*v293)(uint64_t, uint64_t);
  void (*v294)(uint64_t);
  id v295;
  void *v296;
  const __CFString *v297;
  void *v298;
  _QWORD v299[2];
  _BYTE v300[24];
  uint64_t (*v301)(uint64_t, uint64_t);
  void (*v302)(uint64_t);
  id v303;
  const __CFString *v304;
  void *v305;
  _QWORD v306[2];
  _QWORD v307[2];
  const __CFString *v308;
  void *v309;
  _BYTE v310[24];
  uint64_t (*v311)(uint64_t, uint64_t);
  void (*v312)(uint64_t);
  id v313;
  const __CFString *v314;
  void *v315;
  const __CFString *v316;
  void *v317;
  _BYTE buf[24];
  uint64_t (*v319)(uint64_t, uint64_t);
  void (*v320)(uint64_t);
  id v321;
  _QWORD v322[2];
  _QWORD v323[5];

  v323[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v261 = v7;
  objc_msgSend(v7, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCPlayPerfMetrics.m"), 321, CFSTR("Section identifier in first audio frame event can't be nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCPlayPerfMetrics.m"), 322, CFSTR("Item identifier in first audio frame event can't be nil"));

LABEL_3:
  v322[0] = CFSTR("queue-section-id");
  v322[1] = CFSTR("queue-item-id");
  v323[0] = v10;
  v323[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v323, v322, 2);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("item-first-audio-frame"), v263);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  if (v262)
  {
    objc_msgSend(v8, "cursorFromEvent:untilEvent:", v262, 0);
    v260 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v319 = __Block_byref_object_copy__29048;
    v320 = __Block_byref_object_dispose__29049;
    v321 = 0;
    v290 = 0;
    v291 = &v290;
    v292 = 0x3032000000;
    v293 = __Block_byref_object_copy__29048;
    v294 = __Block_byref_object_dispose__29049;
    v295 = 0;
    v289[0] = MEMORY[0x24BDAC760];
    v289[1] = 3221225472;
    v289[2] = __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke;
    v289[3] = &unk_24CABA618;
    v289[4] = buf;
    v289[5] = &v290;
    objc_msgSend(v260, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("remote-control-begin"), v289);
    v13 = (id)v291[5];
    objc_msgSend(v260, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-begin"), v263);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 && v259)
    {
      objc_msgSend(v260, "findPreviousEventWithType:matchingPayload:", CFSTR("session-begin"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "payload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("session-id"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v316 = CFSTR("session-id");
        v317 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v317, &v316, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v260, "findPreviousEventWithType:matchingPayload:", CFSTR("session-restore-begin"), v17);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "compare:", v259) == -1)
        {
          objc_msgSend(v260, "cursorFromEvent:untilEvent:", v259, v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v314 = CFSTR("queue-section-id");
          v315 = v10;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v315, &v314, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-load-end"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = v20;

            v259 = v21;
          }

        }
      }
      else
      {
        v13 = 0;
      }

    }
    v257 = v13;
    if (!v13 || !v259 || !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      log = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "identifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v310 = 138543874;
        *(_QWORD *)&v310[4] = v85;
        *(_WORD *)&v310[12] = 2114;
        *(_QWORD *)&v310[14] = v10;
        *(_WORD *)&v310[22] = 2114;
        v311 = v12;
        _os_log_impl(&dword_210BD8000, log, OS_LOG_TYPE_ERROR, "ItemReadyForMetricsEvent event doesn't have recognizable preceding SetPlaybackQueue and Play events (eventID:%{public}@ item:%{public}@ %{public}@)", v310, 0x20u);

      }
      v24 = 0;
      goto LABEL_127;
    }
    objc_msgSend(v260, "cursorFromEvent:untilEvent:", v262, v13);
    v25 = objc_claimAutoreleasedReturnValue();
    v252 = (void *)-[NSObject countOfPreviousEventsWithType:matchingPayload:](v25, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-first-audio-frame"), 0);
    *(_QWORD *)v310 = 0;
    *(_QWORD *)&v310[8] = v310;
    *(_QWORD *)&v310[16] = 0x3032000000;
    v311 = __Block_byref_object_copy__29048;
    v312 = __Block_byref_object_dispose__29049;
    v313 = 0;
    v288[0] = MEMORY[0x24BDAC760];
    v288[1] = 3221225472;
    v288[2] = __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_178;
    v288[3] = &unk_24CABA670;
    v288[4] = v310;
    log = v25;
    -[NSObject enumeratePreviousEventsWithType:usingBlock:](v25, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("queue-add"), v288);
    if (!*(_QWORD *)(*(_QWORD *)&v310[8] + 40))
    {
      v86 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v262, "identifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v300 = 138543874;
        *(_QWORD *)&v300[4] = v87;
        *(_WORD *)&v300[12] = 2114;
        *(_QWORD *)&v300[14] = v10;
        *(_WORD *)&v300[22] = 2114;
        v301 = v12;
        _os_log_impl(&dword_210BD8000, v86, OS_LOG_TYPE_ERROR, "ItemReadyForMetricsEvent event doesn't have preceding QueueAdd event (eventID:%{public}@ item:%{public}@ %{public}@)", v300, 0x20u);

      }
      v24 = 0;
      goto LABEL_126;
    }
    v26 = objc_alloc_init(MPCPlayPerfMetrics);
    v27 = v26;
    if (v252)
      v28 = CFSTR("NextItem");
    else
      v28 = CFSTR("FirstItem");
    -[MPCPlayPerfMetrics set_eventType:](v26, "set_eventType:", v28);
    v29 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v262, "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSince1970");
    objc_msgSend(v29, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_eventTime:](v27, "set_eventTime:", v31);

    -[MPCPlayPerfMetrics set_sectionIdentifier:](v27, "set_sectionIdentifier:", v10);
    -[MPCPlayPerfMetrics set_itemIdentifier:](v27, "set_itemIdentifier:", v12);
    objc_msgSend((id)v291[5], "payload");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x24BE65930]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_isRemoteSetQueue:](v27, "set_isRemoteSetQueue:", v34);

    objc_msgSend((id)v291[5], "payload");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_queueCommandType:](v27, "set_queueCommandType:", v36);

    objc_msgSend(*(id *)(*(_QWORD *)&v310[8] + 40), "payload");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
    v255 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayPerfMetrics addQueueMetadata:](v27, "addQueueMetadata:", v255);
    -[MPCPlayPerfMetrics addPlaybackBehaviorWithCursor:](v27, "addPlaybackBehaviorWithCursor:", log);
    -[MPCPlayPerfMetrics addSharePlayWithCursor:](v27, "addSharePlayWithCursor:", log);
    -[MPCPlayPerfMetrics addEnvironmentInfoWithCursor:](v27, "addEnvironmentInfoWithCursor:", v260);
    -[MPCPlayPerfMetrics addAssetSelectionWithCursor:itemIDPayload:](v27, "addAssetSelectionWithCursor:itemIDPayload:", log, v263);
    v308 = CFSTR("queue-section-id");
    v309 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v309, &v308, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v260, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v38);
    v251 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v260, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v263);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v40 = (void *)MEMORY[0x24BE65C38];
      v307[0] = v10;
      v307[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v307, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("FirstAudioFrameBug"), CFSTR("FirstAudioFrameBeforeItemBegin"), 0, v41, 0);

    }
    objc_msgSend(v39, "payload");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_itemMetadata:](v27, "set_itemMetadata:", v43);
    v250 = v39;

    objc_msgSend(v251, "payload");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("container-kind"));
    v249 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "payload");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("item-kind"));
    v248 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v255, "objectForKeyedSubscript:", CFSTR("playback-context-class-name"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)objc_msgSend(v249, "modelClass"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)objc_msgSend(v248, "modelClass"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringWithFormat:", CFSTR("%@-%@-%@"), v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_queueType:](v27, "set_queueType:", v50);

    -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), v263);
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v256, "payload");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("item-start-position"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    objc_msgSend(v51, "numberWithInt:", v54 > 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_seekBeforePlaying:](v27, "set_seekBeforePlaying:", v55);

    objc_msgSend(v256, "payload");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("supports-vocal-attenuation"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = objc_msgSend(v57, "BOOLValue");

    objc_msgSend(v256, "payload");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-available"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = objc_msgSend(v59, "BOOLValue");

    objc_msgSend(v256, "payload");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-enabled"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v61, "BOOLValue");

    objc_msgSend(v256, "payload");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-configured"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v61) = objc_msgSend(v64, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v52 & v61 & v53 & v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_vocalsControlActive:](v27, "set_vocalsControlActive:", v65);

    objc_msgSend(v261, "payload");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("av-player-item-performance-metrics"));
    v254 = (void *)objc_claimAutoreleasedReturnValue();

    if (v254)
    {
      objc_msgSend(v254, "dataUsingEncoding:", 4);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v67, 0, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics set_AVPlayerItemPerformanceMetrics:](v27, "set_AVPlayerItemPerformanceMetrics:", v68);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v262, "monotonicTimeNanoSeconds") / 1000000000.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_timeSinceBoot:](v27, "set_timeSinceBoot:", v69);

    v70 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v262, "date");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "timeIntervalSince1970");
    v73 = v72;
    MSVGetProcessLaunchTime();
    objc_msgSend(v70, "numberWithDouble:", v73 - v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_timeSinceLaunch:](v27, "set_timeSinceLaunch:", v75);

    if (v252)
    {
      -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("item-end"), 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if (!v76)
        v77 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v78 = v77;

      objc_msgSend(v262, "payload");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("event-time-offset"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "doubleValue");
      v82 = v81;

      objc_msgSend(v262, "durationSinceEvent:", v78);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fmax(v82 + v83, 0.0));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics set_nextItemWaitTime:](v27, "set_nextItemWaitTime:", v84);
LABEL_125:

      v86 = v27;
      v24 = v86;
LABEL_126:

      _Block_object_dispose(v310, 8);
LABEL_127:

      _Block_object_dispose(&v290, 8);
      _Block_object_dispose(buf, 8);

      v8 = v260;
      goto LABEL_128;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v260, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-first-audio-frame"), 0) == 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_isFirstPlay:](v27, "set_isFirstPlay:", v88);

    -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("item-end"), 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v89;
    v90 = (void *)MEMORY[0x24BDD16E0];
    if (v89)
    {
      objc_msgSend(v89, "payload");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v71, "BOOLValue") & 1) != 0)
      {
        v91 = 0;
        v92 = 0;
      }
      else
      {
        objc_msgSend(v78, "payload");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("item-end-position"));
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v252, "doubleValue");
        v92 = v93 > 0.0;
        v91 = 1;
      }
    }
    else
    {
      v91 = 0;
      v92 = 0;
    }
    objc_msgSend(v90, "numberWithInt:", v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_isReplacingPlayback:](v27, "set_isReplacingPlayback:", v94);

    if (v91)
    {

    }
    if (v78)
    {

    }
    -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("error-resolution"), 0);
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (v245)
    {
      objc_msgSend(v245, "payload");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("resolution-type"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics set_errorResolution:](v27, "set_errorResolution:", v96);

      objc_msgSend(v245, "payload");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("error-for-resolution"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      if (v98)
      {
        objc_msgSend(v98, "msv_analyticSignature");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics set_errorSignature:](v27, "set_errorSignature:", v99);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)&v310[8] + 40), "payload");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("account-id"));
    v244 = (void *)objc_claimAutoreleasedReturnValue();

    v306[0] = CFSTR("account-begin");
    v306[1] = CFSTR("account-update");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v306, 2);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v244)
    {
      v304 = CFSTR("account-id");
      v305 = v244;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v305, &v304, 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v102 = 0;
    }
    objc_msgSend(v260, "findPreviousEventWithTypes:matchingPayload:", v101, v102);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (v244)

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v247 != 0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayPerfMetrics set_hasAccountInfo:](v27, "set_hasAccountInfo:", v103);

    if (v247)
    {
      objc_msgSend(v247, "payload");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("account-metadata"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("active"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics set_isActiveAccount:](v27, "set_isActiveAccount:", v106);

      objc_msgSend(v247, "payload");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("account-metadata"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("subscription-status"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      if (v109)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v109, "statusType"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics set_subscriptionType:](v27, "set_subscriptionType:", v110);

      }
      objc_msgSend(v247, "payload");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("account-metadata"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("store-front-id"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics set_storefront:](v27, "set_storefront:", v113);

    }
    -[MPCPlayPerfMetrics addNetworkTimesWithScopedCursor:](v27, "addNetworkTimesWithScopedCursor:", log);
    -[MPCPlayPerfMetrics addSessionActivationTimesWithScopedCursor:](v27, "addSessionActivationTimesWithScopedCursor:", log);
    v114 = (id)v291[5];
    objc_msgSend(v114, "payload");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v240 = *MEMORY[0x24BE658A0];
    objc_msgSend(v116, "objectForKeyedSubscript:");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      objc_msgSend(v114, "date");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "timeIntervalSinceReferenceDate");
      v120 = v119;
      objc_msgSend(v117, "doubleValue");
      v122 = v121;

      v123 = v120 - v122;
      if (v120 - v122 <= 0.0)
      {
LABEL_63:
        v124 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v259, "durationSinceEvent:", v257, v123);
        v126 = v125;
        -[MPCPlayPerfMetrics sessionActivationWaitTime](v27, "sessionActivationWaitTime");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "doubleValue");
        objc_msgSend(v124, "numberWithDouble:", v126 - v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics set_queueLoadWaitTime:](v27, "set_queueLoadWaitTime:", v129);

        v130 = *(id *)(*(_QWORD *)&buf[8] + 40);
        objc_msgSend(v130, "payload");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "objectForKeyedSubscript:", v240);
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        if (v133)
        {
          objc_msgSend(v130, "date");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "timeIntervalSinceReferenceDate");
          v136 = v135;
          objc_msgSend(v133, "doubleValue");
          v138 = v137;

          v139 = v136 - v138;
        }
        else
        {
          v139 = 0.0;
        }

        if (v291[5] != *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_playCommandSendTime:](v27, "set_playCommandSendTime:", v140);

        }
        -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-begin"), v263);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-end"), v263);
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("item-ready-to-play"), v263);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        if (v246 && v242 && v253)
        {
          v141 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v242, "durationSinceEvent:", v246);
          objc_msgSend(v141, "numberWithDouble:");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_assetLoadWaitTime:](v27, "set_assetLoadWaitTime:", v142);

          v143 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v253, "durationSinceEvent:", v242);
          objc_msgSend(v143, "numberWithDouble:");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_readyToPlayStatusWaitTime:](v27, "set_readyToPlayStatusWaitTime:", v144);

          v145 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v145 != (void *)v291[5])
          {
            v146 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v145, "durationSinceEvent:", v253);
            objc_msgSend(v146, "numberWithDouble:");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCPlayPerfMetrics set_playCommandWaitTime:](v27, "set_playCommandWaitTime:", v147);

            v145 = (void *)v291[5];
          }
          v148 = (void *)MEMORY[0x24BDD16E0];
          if (v145)
          {
            -[MPCPlayPerfMetrics readyToPlayStatusWaitTime](v27, "readyToPlayStatusWaitTime");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "doubleValue");
            v151 = v150;

            objc_msgSend(v253, "durationSinceEvent:", v291[5]);
            if (v151 < v152)
              v152 = v151;
          }
          else
          {
            -[MPCPlayPerfMetrics readyToPlayStatusWaitTime](v27, "readyToPlayStatusWaitTime");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "doubleValue");
            v155 = v154;

            objc_msgSend(v253, "durationSinceEvent:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            if (v155 < v152)
              v152 = v155;
          }
          objc_msgSend(v148, "numberWithDouble:", fmax(v152, 0.0));
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_readyToPlayStatusWaitTime:](v27, "set_readyToPlayStatusWaitTime:", v156);

        }
        *(_QWORD *)v300 = 0;
        *(_QWORD *)&v300[8] = v300;
        *(_QWORD *)&v300[16] = 0x3032000000;
        v301 = __Block_byref_object_copy__29048;
        v302 = __Block_byref_object_dispose__29049;
        v303 = 0;
        v282 = 0;
        v283 = &v282;
        v284 = 0x3032000000;
        v285 = __Block_byref_object_copy__29048;
        v286 = __Block_byref_object_dispose__29049;
        v287 = 0;
        v277[0] = MEMORY[0x24BDAC760];
        v277[1] = 3221225472;
        v277[2] = __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_193;
        v277[3] = &unk_24CABA7A0;
        v278 = v10;
        v280 = v300;
        v279 = v12;
        v281 = &v282;
        -[NSObject enumeratePreviousEventsWithType:usingBlock:](log, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("item-rate-changed"), v277);
        v157 = (void *)v283[5];
        v158 = v260;
        if (v157)
        {
          objc_msgSend(v157, "durationSinceEvent:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v160 = v159;
          objc_msgSend((id)v283[5], "durationSinceEvent:", v253);
          if (v139 + v160 < v161)
            v161 = v139 + v160;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v161);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_rateChangeWaitTime:](v27, "set_rateChangeWaitTime:", v162);

          objc_msgSend(v262, "payload");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("event-time-offset"));
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "doubleValue");
          v166 = v165;

          v167 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v262, "durationSinceEvent:", v283[5]);
          objc_msgSend(v167, "numberWithDouble:", v166 + v168);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_firstAudioFrameWaitTime:](v27, "set_firstAudioFrameWaitTime:", v169);

          v158 = v260;
        }
        objc_msgSend(v158, "cursorFromEvent:untilEvent:", v257, 0);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v299[0] = CFSTR("item-resume");
        v299[1] = CFSTR("item-pause");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v299, 2);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "findPreviousEventWithTypes:matchingPayload:", v171, 0);
        v243 = (void *)objc_claimAutoreleasedReturnValue();

        if (v243)
        {
          objc_msgSend(v243, "type");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = objc_msgSend(v172, "isEqualToString:", CFSTR("item-pause"));

          if (v173)
          {
            v174 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v262, "durationSinceEvent:", v243);
            objc_msgSend(v174, "numberWithDouble:");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCPlayPerfMetrics set_timeSincePaused:](v27, "set_timeSincePaused:", v175);

          }
          else
          {
            -[MPCPlayPerfMetrics set_timeSincePaused:](v27, "set_timeSincePaused:", &unk_24CB16F68);
          }
        }
        v176 = (void *)v291[5];
        if (v176)
        {
          objc_msgSend(v176, "payload");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "objectForKeyedSubscript:", v240);
          v179 = (void *)objc_claimAutoreleasedReturnValue();

          if (v179)
          {
            v276 = 0;
            *(_OWORD *)&info[0].numer = 0u;
            v275 = 0u;
            v180 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v179, "doubleValue");
            objc_msgSend(v180, "dateWithTimeIntervalSinceReferenceDate:");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            MPCPlaybackEngineEventMonotonicTimeConvertNSDate(v181, (uint64_t)info);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)&info[1]);
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCPlayPerfMetrics set_checkpointMRSetQueueBegin:](v27, "set_checkpointMRSetQueueBegin:", v182);

          }
          v183 = (void *)MEMORY[0x24BDD16E0];
          v184 = (void *)v291[5];
          if (v184)
          {
            objc_msgSend(v184, "monotonicTime");
            v185 = v273;
          }
          else
          {
            v185 = 0;
          }
          objc_msgSend(v183, "numberWithUnsignedLongLong:", v185);
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointSetQueueBegin:](v27, "set_checkpointSetQueueBegin:", v186);

          v297 = CFSTR("remote-control-id");
          objc_msgSend((id)v291[5], "payload");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          v298 = v188;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-end"), v189);
          v190 = (void *)objc_claimAutoreleasedReturnValue();

          if (v190)
          {
            v191 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v190, "monotonicTime");
            objc_msgSend(v191, "numberWithUnsignedLongLong:", v272);
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCPlayPerfMetrics set_checkpointSetQueueEnd:](v27, "set_checkpointSetQueueEnd:", v192);

          }
        }
        v193 = *(void **)(*(_QWORD *)&v300[8] + 40);
        if (v193)
        {
          v194 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v193, "monotonicTime");
          objc_msgSend(v194, "numberWithUnsignedLongLong:", v271);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointRateZero:](v27, "set_checkpointRateZero:", v195);

        }
        v196 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v196)
        {
          objc_msgSend(v196, "payload");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "objectForKeyedSubscript:", v240);
          v199 = (void *)objc_claimAutoreleasedReturnValue();

          if (v199)
          {
            v276 = 0;
            *(_OWORD *)&info[0].numer = 0u;
            v275 = 0u;
            v200 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v199, "doubleValue");
            objc_msgSend(v200, "dateWithTimeIntervalSinceReferenceDate:");
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            MPCPlaybackEngineEventMonotonicTimeConvertNSDate(v201, (uint64_t)info);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)&info[1]);
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCPlayPerfMetrics set_checkpointMRPlay:](v27, "set_checkpointMRPlay:", v202);

          }
          v203 = (void *)MEMORY[0x24BDD16E0];
          v204 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v204)
          {
            objc_msgSend(v204, "monotonicTime");
            v205 = v270;
          }
          else
          {
            v205 = 0;
          }
          objc_msgSend(v203, "numberWithUnsignedLongLong:", v205);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointPlay:](v27, "set_checkpointPlay:", v206);

        }
        if (v246)
        {
          v207 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v246, "monotonicTime");
          objc_msgSend(v207, "numberWithUnsignedLongLong:", v269);
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointAssetLoadBegin:](v27, "set_checkpointAssetLoadBegin:", v208);

        }
        -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-end"), v263);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        if (v241)
        {
          v209 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v241, "monotonicTime");
          objc_msgSend(v209, "numberWithUnsignedLongLong:", v268);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointAssetLoadEnd:](v27, "set_checkpointAssetLoadEnd:", v210);

        }
        -[NSObject findPreviousEventWithType:matchingPayload:](log, "findPreviousEventWithType:matchingPayload:", CFSTR("item-buffer-ready"), v263);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        v211 = v262;
        if (v239)
        {
          v212 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v239, "monotonicTime");
          objc_msgSend(v212, "numberWithUnsignedLongLong:", v267);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointLikelyToKeepUp:](v27, "set_checkpointLikelyToKeepUp:", v213);

          v211 = v262;
        }
        if (v253)
        {
          v214 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v253, "monotonicTime");
          objc_msgSend(v214, "numberWithUnsignedLongLong:", v266);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointReadyToPlay:](v27, "set_checkpointReadyToPlay:", v215);

          v211 = v262;
        }
        v216 = (void *)v283[5];
        if (v216)
        {
          v217 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v216, "monotonicTime");
          objc_msgSend(v217, "numberWithUnsignedLongLong:", v265);
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayPerfMetrics set_checkpointRateOne:](v27, "set_checkpointRateOne:", v218);

          v211 = v262;
        }
        objc_msgSend(v211, "payload");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v219, "objectForKeyedSubscript:", CFSTR("event-time-offset"));
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v220, "doubleValue");
        v222 = v221;

        objc_msgSend(v262, "monotonicTime");
        info[0] = 0;
        mach_timebase_info(info);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", info[0].denom * (uint64_t)(v222 * 1000000000.0) / info[0].numer + v264);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics set_checkpointFirstAudioFrame:](v27, "set_checkpointFirstAudioFrame:", v223);

        -[MPCPlayPerfMetrics setQueueCommandSendTime](v27, "setQueueCommandSendTime");
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "doubleValue");
        v226 = v225;
        v227 = v225 > 120.0;

        if (v227)
          v228 = CFSTR("LongSendQueue");
        else
          v228 = 0;
        -[MPCPlayPerfMetrics musicTotalTime](v27, "musicTotalTime");
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "doubleValue");
        v231 = v230 > 300.0;

        if (v231)
          v232 = CFSTR("LongMPP");
        else
          v232 = v228;
        if (v231 || v226 > 120.0)
        {
          v233 = (void *)MEMORY[0x24BE65C38];
          -[MPCPlayPerfMetrics dictionaryRepresentation](v27, "dictionaryRepresentation");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          v296 = v234;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v296, 1);
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v233, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("PlayPerf"), v232, 0, v235, 0);

        }
        _Block_object_dispose(&v282, 8);

        _Block_object_dispose(v300, 8);
        v84 = v245;
        goto LABEL_125;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v123);
      v114 = (id)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics set_setQueueCommandSendTime:](v27, "set_setQueueCommandSendTime:", v114);
    }

    goto LABEL_63;
  }
  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    v319 = v12;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_ERROR, "ItemReadyForMetricsEvent event doesn't have recognizable preceding ItemFirstAudioFrameRender event (eventID:%{public}@ item:%{public}@ %{public}@)", buf, 0x20u);

  }
  v24 = 0;
LABEL_128:

  return v24;
}

+ (id)playMetricsWithErrorSignature:(id)a3 event:(id)a4 cursor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  NSObject *v13;
  MPCPlayPerfMetrics *v14;
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
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  const __CFString *v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  uint8_t v57[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  __int16 v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  __int128 v69;
  _QWORD v70[2];
  _QWORD v71[5];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  if (v10 && v47)
  {
    v70[0] = CFSTR("queue-section-id");
    v70[1] = CFSTR("queue-item-id");
    v71[0] = v10;
    v71[1] = v47;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v68 = __Block_byref_object_copy__29048;
    *(_QWORD *)&v69 = __Block_byref_object_dispose__29049;
    *((_QWORD *)&v69 + 1) = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__29048;
    v53 = __Block_byref_object_dispose__29049;
    v54 = 0;
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __65__MPCPlayPerfMetrics_playMetricsWithErrorSignature_event_cursor___block_invoke;
    v48[3] = &unk_24CABA618;
    v48[4] = buf;
    v48[5] = &v49;
    objc_msgSend(v8, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("remote-control-begin"), v48);
    v12 = (id)v50[5];
    if (!v12)
    {
      objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("session-begin"), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "payload");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("session-id"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {

        v12 = 0;
        goto LABEL_17;
      }
      v65 = CFSTR("session-id");
      v66 = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("session-restore-begin"), v35);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_17;
    }
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v8, "cursorFromEvent:untilEvent:", v7, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MPCPlayPerfMetrics);
      -[MPCPlayPerfMetrics set_eventType:](v14, "set_eventType:", CFSTR("PlayError"));
      v15 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      objc_msgSend(v15, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayPerfMetrics set_eventTime:](v14, "set_eventTime:", v17);

      -[MPCPlayPerfMetrics set_sectionIdentifier:](v14, "set_sectionIdentifier:", v10);
      -[MPCPlayPerfMetrics set_itemIdentifier:](v14, "set_itemIdentifier:", v47);
      objc_msgSend(v46, "payload");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPCPlayPerfMetrics addQueueMetadata:](v14, "addQueueMetadata:", v43);
      -[MPCPlayPerfMetrics addPlaybackBehaviorWithCursor:](v14, "addPlaybackBehaviorWithCursor:", v13);
      -[MPCPlayPerfMetrics addSharePlayWithCursor:](v14, "addSharePlayWithCursor:", v13);
      -[MPCPlayPerfMetrics addEnvironmentInfoWithCursor:](v14, "addEnvironmentInfoWithCursor:", v8);
      if (v45)
      {
        -[MPCPlayPerfMetrics addAssetSelectionWithCursor:itemIDPayload:](v14, "addAssetSelectionWithCursor:itemIDPayload:", v13, v45);
        v55 = CFSTR("queue-section-id");
        v56 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v19);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v45);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "payload");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("item-metadata"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics set_itemMetadata:](v14, "set_itemMetadata:", v21);

        objc_msgSend(v41, "payload");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("container-kind"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "payload");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-kind"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("playback-context-class-name"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass((Class)objc_msgSend(v40, "modelClass"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass((Class)objc_msgSend(v39, "modelClass"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@-%@-%@"), v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayPerfMetrics set_queueType:](v14, "set_queueType:", v28);

      }
      -[MPCPlayPerfMetrics set_errorSignature:](v14, "set_errorSignature:", v44);

LABEL_20:
      _Block_object_dispose(&v49, 8);

      _Block_object_dispose(buf, 8);
      goto LABEL_21;
    }
LABEL_17:
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "type");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138413058;
      v58 = v36;
      v59 = 2114;
      v60 = v37;
      v61 = 2114;
      v62 = v10;
      v63 = 2114;
      v64 = v47;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "%@ event doesn't have recognizable preceding SetPlaybackQueue and Play events (eventID:%{public}@ item:%{public}@ %{public}@)", v57, 0x2Au);

    }
    v14 = 0;
    goto LABEL_20;
  }
  v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "type");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2114;
    v68 = v10;
    LOWORD(v69) = 2114;
    *(_QWORD *)((char *)&v69 + 2) = v47;
    _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_ERROR, "%@ event doesn't have preceding QueueAdd event (eventID:%{public}@ item:%{public}@ %{public}@)", buf, 0x2Au);

  }
  v14 = 0;
LABEL_21:

  return v14;
}

void __65__MPCPlayPerfMetrics_playMetricsWithErrorSignature_event_cursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = v8 - 121;
  if ((v8 - 121 > 0xC || ((1 << (v8 - 121)) & 0x1003) == 0) && (v8 & 0xFFFFFFFD) != 0)
  {
    if (v8 <= 0x1A && ((1 << v8) & 0x7080000) != 0 || v8 == 132 || v8 == 135)
      goto LABEL_15;
LABEL_14:
    *a3 = 1;
    goto LABEL_15;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(_QWORD *)(v12 + 40);
  v13 = (id *)(v12 + 40);
  if (!v14)
    objc_storeStrong(v13, a2);
  if (v9 <= 0xC && ((1 << v9) & 0x1003) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_14;
  }
LABEL_15:

}

void __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = v8 - 121;
  if ((v8 - 121 > 0xC || ((1 << (v8 - 121)) & 0x1003) == 0) && (v8 & 0xFFFFFFFD) != 0)
  {
    if (v8 <= 0x1A && ((1 << v8) & 0x7080000) != 0 || v8 == 132 || v8 == 135)
      goto LABEL_15;
LABEL_14:
    *a3 = 1;
    goto LABEL_15;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(_QWORD *)(v12 + 40);
  v13 = (id *)(v12 + 40);
  if (!v14)
    objc_storeStrong(v13, a2);
  if (v9 <= 0xC && ((1 << v9) & 0x1003) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_14;
  }
LABEL_15:

}

void __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_178(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_193(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;

  v28 = a2;
  v5 = (void *)a1[4];
  objc_msgSend(v28, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {

  }
  else
  {
    objc_msgSend(v28, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-rate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    v12 = v28;
    if (v11 != 0.0)
      goto LABEL_6;
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = v28;
    v6 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }

  v12 = v28;
LABEL_6:
  v15 = (void *)a1[4];
  objc_msgSend(v12, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", v17) & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  v18 = (void *)a1[5];
  objc_msgSend(v28, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqualToString:", v20))
  {

    goto LABEL_11;
  }
  objc_msgSend(v28, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("item-rate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  if (v24 <= 0.0)
    goto LABEL_13;
  v25 = *(_QWORD *)(a1[7] + 8);
  v26 = v28;
  v16 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v26;
LABEL_12:

LABEL_13:
  v27 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v27)
    LOBYTE(v27) = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) != 0;
  *a3 = v27;

}

@end
