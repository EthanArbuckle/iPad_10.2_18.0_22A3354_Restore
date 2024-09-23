@implementation IRCandidateInspectionGenerator

- (id)initClassification:(int64_t)a3 andClassificationDescription:(id)a4 forCandidate:(id)a5
{
  id v9;
  id v10;
  IRCandidateInspectionGenerator *v11;
  IRCandidateInspectionGenerator *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IRCandidateInspectionGenerator;
  v11 = -[IRCandidateInspectionGenerator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_candidate, a5);
    v12->_classification = a3;
    objc_storeStrong((id *)&v12->_classificationDescription, a4);
  }

  return v12;
}

- (IRCandidateInspectionGenerator)initWithClassification:(int64_t)a3 ClassificationDescription:(id)a4 sameSpaceBasedOnMiLo:(BOOL)a5 sameSpaceBasedOnBrokeredLOI:(BOOL)a6 sameSpaceBasedOnPDRFence:(BOOL)a7 sameSpaceBasedOnUWB:(BOOL)a8 sameSpaceBasedOnBLE:(BOOL)a9 candidateSelectorReasons:(id)a10 forCandidate:(id)a11
{
  id v17;
  id v18;
  IRCandidateInspectionGenerator *v19;
  IRCandidateInspectionGenerator *v20;
  id v23;
  objc_super v24;

  v17 = a4;
  v18 = a10;
  v23 = a11;
  v24.receiver = self;
  v24.super_class = (Class)IRCandidateInspectionGenerator;
  v19 = -[IRCandidateInspectionGenerator init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_candidate, a11);
    v20->_classification = a3;
    objc_storeStrong((id *)&v20->_classificationDescription, a4);
    v20->_sameSpaceBasedOnMiLo = a5;
    v20->_sameSpaceBasedOnBrokeredLOI = a6;
    v20->_sameSpaceBasedOnPDRFence = a7;
    v20->_sameSpaceBasedOnUWB = a8;
    v20->_sameSpaceBasedOnBLE = a9;
    objc_storeStrong((id *)&v20->_candidateSelectorReasons, a10);
  }

  return v20;
}

- (id)exportCandidateInspectionAsDictionary
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (-[IRCandidateInspectionGenerator sameSpaceBasedOnMiLo](self, "sameSpaceBasedOnMiLo"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sameSpaceBasedOnMiLo"));
  if (-[IRCandidateInspectionGenerator sameSpaceBasedOnBrokeredLOI](self, "sameSpaceBasedOnBrokeredLOI"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sameSpaceBasedOnBrokeredLOI"));
  if (-[IRCandidateInspectionGenerator sameSpaceBasedOnPDRFence](self, "sameSpaceBasedOnPDRFence"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sameSpaceBasedOnPDRFence"));
  if (-[IRCandidateInspectionGenerator sameSpaceBasedOnUWB](self, "sameSpaceBasedOnUWB"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sameSpaceBasedOnUWB"));
  if (-[IRCandidateInspectionGenerator sameSpaceBasedOnBLE](self, "sameSpaceBasedOnBLE"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sameSpaceBasedOnBLE"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IRCandidateInspectionGenerator candidateSelectorReasons](self, "candidateSelectorReasons", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[IRCandidateInspectionGenerator candidateSelectorReasons](self, "candidateSelectorReasons");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          v17 = CFSTR("YES");
        else
          v17 = CFSTR("NO");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v3;
}

- (BOOL)sameSpaceBasedOnMiLo
{
  return self->_sameSpaceBasedOnMiLo;
}

- (void)setSameSpaceBasedOnMiLo:(BOOL)a3
{
  self->_sameSpaceBasedOnMiLo = a3;
}

- (BOOL)sameSpaceBasedOnBrokeredLOI
{
  return self->_sameSpaceBasedOnBrokeredLOI;
}

- (void)setSameSpaceBasedOnBrokeredLOI:(BOOL)a3
{
  self->_sameSpaceBasedOnBrokeredLOI = a3;
}

- (BOOL)sameSpaceBasedOnUWB
{
  return self->_sameSpaceBasedOnUWB;
}

- (void)setSameSpaceBasedOnUWB:(BOOL)a3
{
  self->_sameSpaceBasedOnUWB = a3;
}

- (BOOL)sameSpaceBasedOnBLE
{
  return self->_sameSpaceBasedOnBLE;
}

- (void)setSameSpaceBasedOnBLE:(BOOL)a3
{
  self->_sameSpaceBasedOnBLE = a3;
}

- (BOOL)sameSpaceBasedOnPDRFence
{
  return self->_sameSpaceBasedOnPDRFence;
}

- (void)setSameSpaceBasedOnPDRFence:(BOOL)a3
{
  self->_sameSpaceBasedOnPDRFence = a3;
}

- (NSDictionary)candidateSelectorReasons
{
  return self->_candidateSelectorReasons;
}

- (IRCandidate)candidate
{
  return self->_candidate;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSString)classificationDescription
{
  return self->_classificationDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescription, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_candidateSelectorReasons, 0);
}

@end
