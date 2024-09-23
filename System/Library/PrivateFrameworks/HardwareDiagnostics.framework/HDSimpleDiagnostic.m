@implementation HDSimpleDiagnostic

- (HDSimpleDiagnostic)initWithExperiment:(id)a3 analysis:(id)a4
{
  id v7;
  id v8;
  HDSimpleDiagnostic *v9;
  HDSimpleDiagnostic *v10;
  NSString *summary;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSimpleDiagnostic;
  v9 = -[HDSimpleDiagnostic init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    summary = v9->_summary;
    v9->_summary = (NSString *)CFSTR("UNSPECIFIED");

    objc_storeStrong((id *)&v10->_experiment, a3);
    objc_storeStrong((id *)&v10->_analysis, a4);
  }

  return v10;
}

- (id)diagnosticDescription
{
  HDDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HDKeyedObjectParameter *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HDKeyedObjectParameter *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  HDDescription *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = -[HDDescription initWithSummary:]([HDDescription alloc], "initWithSummary:", self->_summary);
  -[HDSimpleDiagnostic experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSimpleDiagnostic analysis](self, "analysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analysisDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v31 = v3;
  if (v9)
  {
    v10 = -[HDKeyedObjectParameter initWithSummary:required:]([HDKeyedObjectParameter alloc], "initWithSummary:required:", CFSTR("parameters for the experiment"), 0);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v5, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v15);
          objc_msgSend(v5, "parameters");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "required"))
            -[HDKeyedObjectParameter setRequired:](v10, "setRequired:", 1);
          -[HDKeyedObjectParameter addKey:forName:](v10, "addKey:forName:", v18, v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }

    v3 = v31;
    -[HDDescription addParameter:forName:](v31, "addParameter:forName:", v10, CFSTR("experiment"));

  }
  objc_msgSend(v7, "parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = -[HDKeyedObjectParameter initWithSummary:required:]([HDKeyedObjectParameter alloc], "initWithSummary:required:", CFSTR("parameters for the analysis"), 0);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v7, "parameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v33;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v26);
          objc_msgSend(v7, "parameters");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v29, "required"))
            -[HDKeyedObjectParameter setRequired:](v21, "setRequired:", 1);
          -[HDKeyedObjectParameter addKey:forName:](v21, "addKey:forName:", v29, v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v24);
    }

    v3 = v31;
    -[HDDescription addParameter:forName:](v31, "addParameter:forName:", v21, CFSTR("analysis"));

  }
  return v3;
}

- (id)runWithParameters:(id)a3 host:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  char v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  id v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStartTime:", v11);

  -[HDSimpleDiagnostic diagnosticDescription](self, "diagnosticDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSimpleDiagnostic experiment](self, "experiment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSimpleDiagnostic analysis](self, "analysis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "validateAgainstValues:error:", v8, a5))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("experiment"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("analysis"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(v13, "setupWithParameters:host:error:", v15, v9, a5)
      || (objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(v14, "setupWithParameters:host:error:", v16, v9, a5))
    {
      v45 = 0;
    }
    else
    {
      v87 = 0;
      objc_msgSend(v13, "run:", &v87);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v87;
      v75 = v9;
      if (v17)
      {
        v70 = v15;
        v73 = v17;
        v19 = (void *)objc_msgSend(v17, "copy");
        v86 = v18;
        v69 = v14;
        objc_msgSend(v14, "analyzeExperimentResult:error:", v19, &v86);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v86;

        if (v20)
        {
          v71 = v21;
          v68 = v16;
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v74 = v20;
          objc_msgSend(v20, "measuredResults");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
          v14 = v69;
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v83 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(v10, "addResult:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
            }
            while (v24);
          }

          objc_msgSend(v73, "files");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = MEMORY[0x24BDAC760];
          v80[0] = MEMORY[0x24BDAC760];
          v80[1] = 3221225472;
          v80[2] = __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke;
          v80[3] = &unk_24F252FF0;
          v29 = v10;
          v81 = v29;
          objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v80);

          objc_msgSend(v74, "files");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = v28;
          v78[1] = 3221225472;
          v78[2] = __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke_2;
          v78[3] = &unk_24F252FF0;
          v31 = v29;
          v79 = v31;
          objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v78);

          v32 = (void *)objc_opt_new();
          objc_msgSend(v73, "auxiliaryData");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "count");

          if (v34)
          {
            objc_msgSend(v73, "auxiliaryData");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("experiment"));

          }
          objc_msgSend(v74, "auxiliaryData");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

          if (v37)
          {
            objc_msgSend(v74, "auxiliaryData");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v38, CFSTR("analysis"));

          }
          v39 = (void *)objc_msgSend(v32, "copy");
          objc_msgSend(v31, "setAuxiliaryData:", v39);

          v67 = v32;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v77 = v71;
            v40 = objc_msgSend(v13, "teardown:", &v77);
            v41 = v77;

            if ((v40 & 1) == 0)
            {
              objc_msgSend(v31, "error");
              v42 = objc_claimAutoreleasedReturnValue();
              v43 = (void *)v42;
              if (v42)
                v44 = (id)v42;
              else
                v44 = v41;
              objc_msgSend(v31, "failedForError:", v44, v32);

            }
            v15 = v70;
            v32 = v67;
          }
          else
          {
            v15 = v70;
            v41 = v71;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v58 = v15;
            v76 = v41;
            v59 = objc_msgSend(v69, "teardown:", &v76);
            v60 = v76;

            v72 = v60;
            if ((v59 & 1) == 0)
            {
              objc_msgSend(v31, "error");
              v61 = objc_claimAutoreleasedReturnValue();
              v62 = (void *)v61;
              if (v61)
                v63 = (id)v61;
              else
                v63 = v60;
              objc_msgSend(v31, "failedForError:", v63, v67);

            }
            v15 = v58;
            v32 = v67;
            v16 = v68;
          }
          else
          {
            v72 = v41;
            v16 = v68;
          }
          objc_msgSend(MEMORY[0x24BDBCE60], "date", v67);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setEndTime:", v64);

          objc_msgSend(v31, "attemptToSetPassed");
          v65 = v31;

          v18 = v72;
          v57 = v74;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setEndTime:", v52);

          objc_msgSend(v10, "error");
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v53;
          if (v53)
            v55 = (id)v53;
          else
            v55 = v21;
          objc_msgSend(v10, "failedForError:", v55);

          v56 = v10;
          v57 = 0;
          v18 = v21;
          v14 = v69;
          v15 = v70;
        }

        v46 = v73;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v46 = 0;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setEndTime:", v47);

        objc_msgSend(v10, "error");
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)v48;
        if (v48)
          v50 = (id)v48;
        else
          v50 = v18;
        objc_msgSend(v10, "failedForError:", v50);

        v51 = v10;
      }

      v45 = v10;
      v9 = v75;
    }

  }
  else
  {
    v45 = 0;
  }

  return v45;
}

void __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("experiment-%@"), a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFile:forName:", v6, v7);

}

void __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("analysis-%@"), a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFile:forName:", v6, v7);

}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HDExperiment)experiment
{
  return self->_experiment;
}

- (void)setExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_experiment, a3);
}

- (HDAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_analysis, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
