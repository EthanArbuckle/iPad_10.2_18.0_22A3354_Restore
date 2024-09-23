@implementation CtrTriggerResult

- (CtrTriggerResult)initWithData:(int64_t)a3 num_thirdparty_BRs:(int64_t)a4 num_thread_networks:(int64_t)a5 max_simultaneous_prefixes:(int64_t)a6 tx_total:(int64_t)a7 tx_total_success:(int64_t)a8 tx_success_perc:(int64_t)a9 rx_total:(int64_t)a10 rx_total_success:(int64_t)a11 rx_success_perc:(int64_t)a12 tx_delayavg:(int64_t)a13 tx_delaymin:(int64_t)a14 tx_delaymax:(int64_t)a15 coex_tx_denied_reqs_perc:(int64_t)a16 coex_rx_denied_reqs_perc:(int64_t)a17 thirdparty_leader:(BOOL)a18 last_known_device_role:(id)a19 is_partition_id_change_detected:(BOOL)a20 leader_name:(id)a21 num_routers:(id)a22 thread_mesh_size:(id)a23 is_parent_change_detected:(BOOL)a24 is_threaddaemon_crash_detected:(BOOL)a25 is_threadfw_crash_detected:(BOOL)a26 is_role_detach_disable_detected:(BOOL)a27 is_border_router_advertised:(BOOL)a28 num_border_routers_advertised:(int64_t)a29 duration:(int64_t)a30
{
  id v32;
  id v33;
  id v34;
  id v35;
  CtrTriggerResult *v36;
  objc_super v43;

  v32 = a19;
  v33 = a21;
  v34 = a22;
  v35 = a23;
  v43.receiver = self;
  v43.super_class = (Class)CtrTriggerResult;
  v36 = -[CtrTriggerResult init](&v43, sel_init);
  if (v36)
  {
    v36->_num_apple_BRs = a3;
    v36->_num_thirdparty_BRs = a4;
    v36->_num_thread_networks = a5;
    v36->_max_simultaneous_prefix_detected = a6;
    v36->_tx_total = a7;
    v36->_tx_total_success = a8;
    v36->_tx_success_perc = a9;
    v36->_rx_total = a10;
    v36->_rx_total_success = a11;
    v36->_rx_success_perc = a12;
    v36->_tx_delayavg = a13;
    v36->_tx_delaymin = a14;
    v36->_tx_delaymax = a15;
    v36->_coex_tx_denied_requests_percentage = a16;
    v36->_coex_rx_denied_requests_percentage = a17;
    v36->_is_leader_thirdparty = a18;
    objc_storeStrong((id *)&v36->_last_known_device_role, a19);
    v36->_is_partition_id_change_detected = a20;
    objc_storeStrong((id *)&v36->_leader_name, a21);
    objc_storeStrong((id *)&v36->_num_routers, a22);
    objc_storeStrong((id *)&v36->_thread_mesh_size, a23);
    v36->_is_parent_change_detected = a24;
    v36->_is_threaddaemon_crash_detected = a25;
    v36->_is_threadfw_crash_detected = a26;
    v36->_is_role_detach_disable_detected = a27;
    v36->_is_border_router_advertised = a28;
    v36->_num_border_routers_advertised = a29;
    v36->_duration = a30;
  }

  return v36;
}

- (CtrTriggerResult)initWithCoder:(id)a3
{
  id v3;
  char v4;
  char v5;
  char v6;
  char v7;
  CtrTriggerResult *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a3;
  v31 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("numAppleBRs"));
  v30 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("thirdPartyBRs"));
  v29 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("threadNwsKey"));
  v28 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("prefixesDetected"));
  objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("txTotal"));
  objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("txTotalSuccess"));
  v26 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("txSuccessPerc"));
  v25 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("rxTotal"));
  v24 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("rxTotalSuccess"));
  v22 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("rxSuccessPerc"));
  v21 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("txDelayAvg"));
  v19 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("txDelayMin"));
  v18 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("txDelayMax"));
  v16 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("coexTxDeniedReqsPerc"));
  v15 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("coexRxDeniedReqsPerc"));
  v14 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("leaderIsThirdParty"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("lastKnownRole"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("partitionChanged"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("leaderName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("numRouters"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("meshSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("parentChanged"));
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("daemonCrashed"));
  v6 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("fwCrashed"));
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("roleDisableDetached"));
  BYTE4(v12) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("borderRouterFound"));
  BYTE3(v12) = v7;
  BYTE2(v12) = v6;
  BYTE1(v12) = v5;
  LOBYTE(v12) = v4;
  LOBYTE(v11) = v13;
  LOBYTE(v10) = v14;
  v8 = -[CtrTriggerResult initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:](self, "initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:", v31, v30, v29, v26, v25, v24, v22, v21, v19, v18, v16, v15, v10,
         v27,
         v11,
         v23,
         v20,
         v17,
         v12,
         v28,
         objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("duration")));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult num_apple_BRs](self, "num_apple_BRs"), CFSTR("numAppleBRs"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult num_thirdparty_BRs](self, "num_thirdparty_BRs"), CFSTR("thirdPartyBRs"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult num_thread_networks](self, "num_thread_networks"), CFSTR("threadNwsKey"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult max_simultaneous_prefix_detected](self, "max_simultaneous_prefix_detected"), CFSTR("prefixesDetected"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_total](self, "tx_total"), CFSTR("txTotal"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_total_success](self, "tx_total_success"), CFSTR("txTotalSuccess"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_success_perc](self, "tx_success_perc"), CFSTR("txSuccessPerc"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult rx_total](self, "rx_total"), CFSTR("rxTotal"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult rx_total_success](self, "rx_total_success"), CFSTR("rxTotalSuccess"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult rx_success_perc](self, "rx_success_perc"), CFSTR("rxSuccessPerc"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_delayavg](self, "tx_delayavg"), CFSTR("txDelayAvg"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_delaymin](self, "tx_delaymin"), CFSTR("txDelayMin"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_delaymax](self, "tx_delaymax"), CFSTR("txDelayMax"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult coex_tx_denied_requests_percentage](self, "coex_tx_denied_requests_percentage"), CFSTR("coexTxDeniedReqsPerc"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult coex_rx_denied_requests_percentage](self, "coex_rx_denied_requests_percentage"), CFSTR("coexRxDeniedReqsPerc"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_leader_thirdparty](self, "is_leader_thirdparty"), CFSTR("leaderIsThirdParty"));
  -[CtrTriggerResult last_known_device_role](self, "last_known_device_role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("lastKnownRole"));

  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_partition_id_change_detected](self, "is_partition_id_change_detected"), CFSTR("partitionChanged"));
  -[CtrTriggerResult leader_name](self, "leader_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("leaderName"));

  -[CtrTriggerResult num_routers](self, "num_routers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("numRouters"));

  -[CtrTriggerResult thread_mesh_size](self, "thread_mesh_size");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("meshSize"));

  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_parent_change_detected](self, "is_parent_change_detected"), CFSTR("parentChanged"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_threaddaemon_crash_detected](self, "is_threaddaemon_crash_detected"), CFSTR("daemonCrashed"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_threadfw_crash_detected](self, "is_threadfw_crash_detected"), CFSTR("fwCrashed"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_role_detach_disable_detected](self, "is_role_detach_disable_detected"), CFSTR("roleDisableDetached"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_border_router_advertised](self, "is_border_router_advertised"), CFSTR("borderRouterFound"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult duration](self, "duration"), CFSTR("duration"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)num_apple_BRs
{
  return self->_num_apple_BRs;
}

- (int64_t)num_thirdparty_BRs
{
  return self->_num_thirdparty_BRs;
}

- (int64_t)num_thread_networks
{
  return self->_num_thread_networks;
}

- (int64_t)max_simultaneous_prefix_detected
{
  return self->_max_simultaneous_prefix_detected;
}

- (int64_t)tx_total
{
  return self->_tx_total;
}

- (int64_t)tx_total_success
{
  return self->_tx_total_success;
}

- (int64_t)tx_success_perc
{
  return self->_tx_success_perc;
}

- (int64_t)rx_total
{
  return self->_rx_total;
}

- (int64_t)rx_total_success
{
  return self->_rx_total_success;
}

- (int64_t)rx_success_perc
{
  return self->_rx_success_perc;
}

- (int64_t)tx_delayavg
{
  return self->_tx_delayavg;
}

- (int64_t)tx_delaymin
{
  return self->_tx_delaymin;
}

- (int64_t)tx_delaymax
{
  return self->_tx_delaymax;
}

- (int64_t)coex_tx_denied_requests_percentage
{
  return self->_coex_tx_denied_requests_percentage;
}

- (int64_t)coex_rx_denied_requests_percentage
{
  return self->_coex_rx_denied_requests_percentage;
}

- (BOOL)is_leader_thirdparty
{
  return self->_is_leader_thirdparty;
}

- (NSString)last_known_device_role
{
  return self->_last_known_device_role;
}

- (BOOL)is_partition_id_change_detected
{
  return self->_is_partition_id_change_detected;
}

- (NSString)leader_name
{
  return self->_leader_name;
}

- (NSString)num_routers
{
  return self->_num_routers;
}

- (NSString)thread_mesh_size
{
  return self->_thread_mesh_size;
}

- (BOOL)is_parent_change_detected
{
  return self->_is_parent_change_detected;
}

- (BOOL)is_threaddaemon_crash_detected
{
  return self->_is_threaddaemon_crash_detected;
}

- (BOOL)is_threadfw_crash_detected
{
  return self->_is_threadfw_crash_detected;
}

- (BOOL)is_role_detach_disable_detected
{
  return self->_is_role_detach_disable_detected;
}

- (BOOL)is_border_router_advertised
{
  return self->_is_border_router_advertised;
}

- (int64_t)num_border_routers_advertised
{
  return self->_num_border_routers_advertised;
}

- (NSMutableArray)accessory_result
{
  return self->_accessory_result;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory_result, 0);
  objc_storeStrong((id *)&self->_thread_mesh_size, 0);
  objc_storeStrong((id *)&self->_num_routers, 0);
  objc_storeStrong((id *)&self->_leader_name, 0);
  objc_storeStrong((id *)&self->_last_known_device_role, 0);
}

@end
