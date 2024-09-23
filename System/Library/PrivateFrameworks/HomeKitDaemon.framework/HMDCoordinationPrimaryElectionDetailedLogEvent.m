@implementation HMDCoordinationPrimaryElectionDetailedLogEvent

- (HMDCoordinationPrimaryElectionDetailedLogEvent)initWithIsPrimary:(BOOL)a3 didChangePrimary:(BOOL)a4 electionTriggerReason:(unint64_t)a5 confirmationCriteria:(unint64_t)a6 meshAndPrimaryCandidateCountEqual:(BOOL)a7 previousPrimaryInMesh:(BOOL)a8
{
  HMDCoordinationPrimaryElectionDetailedLogEvent *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDCoordinationPrimaryElectionDetailedLogEvent;
  result = -[HMDCoordinationPrimaryElectionLogEvent initWithIsPrimary:didChangePrimary:](&v13, sel_initWithIsPrimary_didChangePrimary_, a3, a4);
  if (result)
  {
    *(_QWORD *)&result->_meshAndPrimaryCandidateCountEqual = a5;
    result->_electionTriggerReason = a6;
    *(&result->super._didChangePrimary + 1) = a7;
    *(&result->super._didChangePrimary + 2) = a8;
  }
  return result;
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  void *v13;
  void *v14;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDCoordinationPrimaryElectionLogEvent isPrimary](self, "isPrimary"))
    v4 = &unk_24E96A148;
  else
    v4 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isPrimary"));
  if (-[HMDCoordinationPrimaryElectionLogEvent didChangePrimary](self, "didChangePrimary"))
    v5 = &unk_24E96A148;
  else
    v5 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("didChangePrimary"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent electionTriggerReason](self, "electionTriggerReason") == 1)
    v6 = &unk_24E96A148;
  else
    v6 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("triggerReasonCoordinationUpdate"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent electionTriggerReason](self, "electionTriggerReason"))
    v7 = &unk_24E96A160;
  else
    v7 = &unk_24E96A148;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("triggerReasonPrimaryPingTimeout"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent electionTriggerReason](self, "electionTriggerReason") == 2)
    v8 = &unk_24E96A148;
  else
    v8 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("triggerReasonCoordinationPrimaryMesh"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent electionTriggerReason](self, "electionTriggerReason") == 3)
    v9 = &unk_24E96A148;
  else
    v9 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("triggerReasonUnknownMeshState"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent electionTriggerReason](self, "electionTriggerReason") == 4)
    v10 = &unk_24E96A148;
  else
    v10 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("triggerReasonPrimaryMissing"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent electionTriggerReason](self, "electionTriggerReason") == 5)
    v11 = &unk_24E96A148;
  else
    v11 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("triggerReasonNodesAdded"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent electionTriggerReason](self, "electionTriggerReason") == 6)
    v12 = &unk_24E96A148;
  else
    v12 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("triggerReasonCoordinationLeaderChange"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria"))
    v13 = &unk_24E96A160;
  else
    v13 = &unk_24E96A148;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("confirmationCriteriaSame"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 1)
    v14 = &unk_24E96A148;
  else
    v14 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("confirmationCriteriaEnabled"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 2)
    v15 = &unk_24E96A148;
  else
    v15 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("confirmationCriteriaCapabilities"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 3)
    v16 = &unk_24E96A148;
  else
    v16 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("confirmationCriteriaLocation"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 4)
    v17 = &unk_24E96A148;
  else
    v17 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("confirmationCriteriaProduct"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 5)
    v18 = &unk_24E96A148;
  else
    v18 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("confirmationCriteriaVersion"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 16)
    v19 = &unk_24E96A148;
  else
    v19 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("confirmationCriteriaSoftwareVersion"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 6)
    v20 = &unk_24E96A148;
  else
    v20 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("confirmationCriteriaMajorVersion"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 7)
    v21 = &unk_24E96A148;
  else
    v21 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("confirmationCriteriaMinorVersion"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 8)
    v22 = &unk_24E96A148;
  else
    v22 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("confirmationCriteriaElectionVersion"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 9)
    v23 = &unk_24E96A148;
  else
    v23 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("confirmationCriteriaReachableAccessories"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 10)
    v24 = &unk_24E96A148;
  else
    v24 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("confirmationCriteriaCurrentPrimary"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 11)
    v25 = &unk_24E96A148;
  else
    v25 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("confirmationCriteriaCurrentDevice"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 12)
    v26 = &unk_24E96A148;
  else
    v26 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("confirmationCriteriaOverride"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 13)
    v27 = &unk_24E96A148;
  else
    v27 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("confirmationCriteriaIDSIdentifier"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 14)
    v28 = &unk_24E96A148;
  else
    v28 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("confirmationCriteriaConnectionType"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent confirmationCriteria](self, "confirmationCriteria") == 15)
    v29 = &unk_24E96A148;
  else
    v29 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("confirmationCriteriaPCSEnabled"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent meshAndPrimaryCandidateCountEqual](self, "meshAndPrimaryCandidateCountEqual"))
  {
    v30 = &unk_24E96A148;
  }
  else
  {
    v30 = &unk_24E96A160;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("meshAndPrimaryCountEqual"));
  if (-[HMDCoordinationPrimaryElectionDetailedLogEvent previousPrimaryInMesh](self, "previousPrimaryInMesh"))
    v31 = &unk_24E96A148;
  else
    v31 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("previousPrimaryInMesh"));
  v32 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v32;
}

- (unint64_t)electionTriggerReason
{
  return *(_QWORD *)&self->_meshAndPrimaryCandidateCountEqual;
}

- (unint64_t)confirmationCriteria
{
  return self->_electionTriggerReason;
}

- (BOOL)meshAndPrimaryCandidateCountEqual
{
  return *(&self->super._didChangePrimary + 1);
}

- (BOOL)previousPrimaryInMesh
{
  return *(&self->super._didChangePrimary + 2);
}

@end
