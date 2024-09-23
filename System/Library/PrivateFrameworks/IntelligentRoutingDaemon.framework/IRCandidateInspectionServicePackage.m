@implementation IRCandidateInspectionServicePackage

- (IRCandidateInspectionServicePackage)initWithRules:(id)a3 classification:(int64_t)a4 orderOfExecution:(id)a5 andClassificationDescription:(id)a6 forCandidate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IRCandidateInspectionServicePackage *v17;
  IRCandidateInspectionServicePackage *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IRCandidateInspectionServicePackage;
  v17 = -[IRCandidateInspectionServicePackage init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rules, a3);
    objc_storeStrong((id *)&v18->_candidate, a7);
    v18->_classification = a4;
    objc_storeStrong((id *)&v18->_classificationDescription, a6);
    objc_storeStrong((id *)&v18->_orderOfExecution, a5);
  }

  return v18;
}

- (id)exportCandidateInspectionAsDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  IRCandidateInspectionServicePackage *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v34 = self;
  -[IRCandidateInspectionServicePackage rules](self, "rules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v8, "evaluation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "hasBoolean") & 1) != 0)
        {
          objc_msgSend(v8, "evaluation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "BOOLean"))
            v12 = CFSTR("Yes");
          else
            v12 = CFSTR("No");
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("evaluation"));

        }
        else
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Invalid"), CFSTR("evaluation"));
        }

        objc_msgSend(v8, "ruleName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v9, v13);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v5);
  }

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[IRCandidateInspectionServicePackage candidate](v34, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v21, "avOutpuDeviceIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v21, "avOutpuDeviceIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("avOutpuDeviceIdentifier"));

        }
        else
        {
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("avOutpuDeviceIdentifier"));
        }

        objc_msgSend(v21, "rapportIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v21, "rapportIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("rapportIdentifier"));

        }
        else
        {
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("rapportIdentifier"));
        }

        objc_msgSend(v21, "idsIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v21, "idsIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("idsIdentifier"));

        }
        else
        {
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("idsIdentifier"));
        }

        objc_msgSend(v14, "addObject:", v22);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v18);
  }

  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, CFSTR("rules"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, CFSTR("nodes"));
  -[IRCandidateInspectionServicePackage classification](v34, "classification");
  IRCandidateClassificationToString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("classification"));

  -[IRCandidateInspectionServicePackage candidate](v34, "candidate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "candidateIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("candidateIdentifier"));

  return v29;
}

- (IRCandidate)candidate
{
  return self->_candidate;
}

- (NSArray)rules
{
  return self->_rules;
}

- (int64_t)classification
{
  return self->_classification;
}

- (IRInspectionOrderOfExectionForCandidate)orderOfExecution
{
  return self->_orderOfExecution;
}

- (NSString)classificationDescription
{
  return self->_classificationDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescription, 0);
  objc_storeStrong((id *)&self->_orderOfExecution, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end
