@implementation ApplePMPPerfStateControl

- (void)tearDown
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (self->_connection)
  {
    -[ApplePMPPerfStateControl _disableConsistentPerfState](self, "_disableConsistentPerfState");
    IOServiceClose(self->_connection);
    self->_connection = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v3 = *MEMORY[0x24BDAEC58];
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "PMP %u Connection Closed", (uint8_t *)v4, 8u);
    }
  }
}

- (BOOL)_enableConsistentPerfState:(unsigned int)a3
{
  char v5;
  unint64_t v6;
  unint64_t *stateValues;
  uint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  BOOL v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  _BYTE v23[20];
  uint64_t v24;
  uint64_t input[2];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a3 > 2)
    return 0;
  self->_powerState = a3;
  *(_OWORD *)input = 0u;
  v26 = 0u;
  v27 = 0xFFFFFFFFLL;
  if (LODWORD(self->_nDomains))
  {
    v5 = 0;
    v6 = 0;
    stateValues = self->_domainInfos[0].stateValues;
    v8 = a3;
    do
    {
      v9 = stateValues[2];
      v10 = &stateValues[v8];
      v11 = v9 == 0;
      if (v9)
        v12 = &stateValues[v8];
      else
        v12 = stateValues + 4;
      v13 = *v12;
      if (v11)
        v10 = stateValues + 5;
      v14 = *v10;
      v15 = v13 << (v5 & 0x3C);
      input[v6 >> 4] |= v15;
      v16 = v14 << (v5 & 0x3C);
      input[(v6 >> 4) + 2] |= v16;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v17 = *(stateValues - 1);
        *(_DWORD *)buf = 138413314;
        v19 = v17;
        v20 = 2048;
        v21 = v15;
        v22 = 1024;
        *(_DWORD *)v23 = v6 >> 4;
        *(_WORD *)&v23[4] = 2048;
        *(_QWORD *)&v23[6] = v16;
        *(_WORD *)&v23[14] = 1024;
        *(_DWORD *)&v23[16] = (v6 >> 4) + 2;
        _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Setting Domain %@ 0x%llx at %u, 0x%llx at %u", buf, 0x2Cu);
      }
      ++v6;
      v5 += 4;
      stateValues += 7;
    }
    while (v6 < LODWORD(self->_nDomains));
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    v19 = input[0];
    v20 = 2048;
    v21 = input[1];
    v22 = 2048;
    *(_QWORD *)v23 = v26;
    *(_WORD *)&v23[8] = 2048;
    *(_QWORD *)&v23[10] = *((_QWORD *)&v26 + 1);
    *(_WORD *)&v23[18] = 2048;
    v24 = v27;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "PMP Enable {0x%llx, 0x%llx, 0x%llx, 0x%llx, 0x%llx}", buf, 0x34u);
  }
  return SetDVFSStates(self->_connection, input) == 0;
}

- (BOOL)_disableConsistentPerfState
{
  char v3;
  unint64_t v4;
  unint64_t *p_currentMaxState;
  NSObject *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  _BYTE v17[20];
  uint64_t v18;
  uint64_t input[2];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  *(_OWORD *)input = 0u;
  v20 = 0u;
  if (LODWORD(self->_nDomains))
  {
    v3 = 0;
    v4 = 0;
    p_currentMaxState = &self->_domainInfos[0].currentMaxState;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = v3 & 0x3C;
      input[v4 >> 4] |= *(p_currentMaxState - 1) << (v3 & 0x3C);
      input[(v4 >> 4) + 2] |= *p_currentMaxState << (v3 & 0x3C);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = *(p_currentMaxState - 6);
        v9 = *(p_currentMaxState - 1) << v7;
        v10 = *p_currentMaxState << v7;
        *(_DWORD *)buf = 138413314;
        v13 = v8;
        v14 = 2048;
        v15 = v9;
        v16 = 1024;
        *(_DWORD *)v17 = v4 >> 4;
        *(_WORD *)&v17[4] = 2048;
        *(_QWORD *)&v17[6] = v10;
        *(_WORD *)&v17[14] = 1024;
        *(_DWORD *)&v17[16] = (v4 >> 4) + 2;
        _os_log_impl(&dword_21F8CF000, v6, OS_LOG_TYPE_INFO, "Setting Domain %@ 0x%llx at %u, 0x%llx at %u", buf, 0x2Cu);
      }
      ++v4;
      v3 += 4;
      p_currentMaxState += 7;
    }
    while (v4 < LODWORD(self->_nDomains));
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    v13 = input[0];
    v14 = 2048;
    v15 = input[1];
    v16 = 2048;
    *(_QWORD *)v17 = v20;
    *(_WORD *)&v17[8] = 2048;
    *(_QWORD *)&v17[10] = *((_QWORD *)&v20 + 1);
    *(_WORD *)&v17[18] = 2048;
    v18 = v21;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "PMP Disable {0x%llx, 0x%llx, 0x%llx, 0x%llx, 0x%llx}", buf, 0x34u);
  }
  self->_powerState = 3;
  return SetDVFSStates(self->_connection, input) == 0;
}

- (BOOL)_open:(unsigned int)a3
{
  mach_error_t v3;

  v3 = IOServiceOpen(a3, *MEMORY[0x24BDAEC58], 0, &self->_connection);
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    -[ApplePMPPerfStateControl _open:].cold.1(v3);
  return v3 == 0;
}

- (void)_copySelectorsForService
{
  uint64_t v2;
  int v3;

  v2 = 0;
  v3 = 2;
  if (!self->_currentPMPVersion)
    v3 = 13;
  do
  {
    gClientMethodSelectors[v2] = v3 + v2;
    ++v2;
  }
  while (v2 != 5);
}

- (BOOL)setupConnectionForPowerState:(unsigned int)a3
{
  mach_port_t v5;
  const __CFDictionary *v6;
  uint64_t MatchingService;
  const __CFDictionary *v8;
  uint64_t v9;
  unsigned int currentPMPVersion;
  $8C24219F9D2EBCE5C72C8FC7CFBBB360 *domainInfos;
  kern_return_t v12;
  mach_error_t v13;
  uint64_t v14;
  unint64_t nDomains;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  size_t v19;
  kern_return_t v20;
  mach_error_t v21;
  __CFString *v22;
  uint64_t v23;
  void **p_name;
  _OWORD *v25;
  void *v26;
  uint64_t *v27;
  mach_port_t connection;
  kern_return_t v29;
  mach_error_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  $8C24219F9D2EBCE5C72C8FC7CFBBB360 *v37;
  void *v38;
  void *v39;
  unsigned int v41;
  size_t outputStructCnt;
  uint8_t outputStruct[8];
  _QWORD v44[3];
  uint32_t outputCnt[8];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[32];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  self->_currentPMPVersion = 0;
  v5 = *MEMORY[0x24BDD8B20];
  v6 = IOServiceMatching("ApplePMP");
  MatchingService = IOServiceGetMatchingService(v5, v6);
  if (!(_DWORD)MatchingService)
  {
    v8 = IOServiceMatching("ApplePMPv2");
    v9 = IOServiceGetMatchingService(v5, v8);
    if (!(_DWORD)v9)
      return v9;
    MatchingService = v9;
    self->_currentPMPVersion = 1;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    currentPMPVersion = self->_currentPMPVersion;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = currentPMPVersion;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Setting PMP Version %u", buf, 8u);
  }
  -[ApplePMPPerfStateControl _copySelectorsForService](self, "_copySelectorsForService");
  domainInfos = self->_domainInfos;
  bzero(self->_domainInfos, 0x700uLL);
  LODWORD(v9) = -[ApplePMPPerfStateControl _open:](self, "_open:", MatchingService);
  if ((_DWORD)v9)
  {
    LODWORD(v9) = self->_connection;
    if (!(_DWORD)v9)
    {
LABEL_12:
      self->_nDomains = 0;
      return v9;
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    memset(buf, 0, sizeof(buf));
    outputCnt[0] = 1;
    v12 = IOConnectCallMethod(v9, gClientMethodSelectors[0], 0, 0, 0, 0, (uint64_t *)buf, outputCnt, 0, 0);
    if (v12)
    {
      v13 = v12;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[ApplePMPPerfStateControl setupConnectionForPowerState:].cold.1(v13);
      LOBYTE(v9) = 0;
      goto LABEL_12;
    }
    v14 = *(_QWORD *)buf;
    self->_nDomains = *(_QWORD *)buf;
    if (v14)
    {
      v41 = a3;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        nDomains = self->_nDomains;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = nDomains;
        _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Number of Domains %llu", buf, 0xCu);
      }
      if (self->_nDomains)
      {
        v16 = 0;
        while (1)
        {
          LODWORD(v9) = self->_connection;
          if (!(_DWORD)v9)
            break;
          v17 = self->_currentPMPVersion;
          *(_QWORD *)buf = v16;
          *(_QWORD *)outputStruct = 0;
          v44[0] = 0;
          v18 = v17 == 0;
          v19 = 16;
          if (v18)
            v19 = 10;
          outputStructCnt = v19;
          v20 = IOConnectCallMethod(v9, dword_25551F6D8, (const uint64_t *)buf, 1u, 0, 0, 0, 0, outputStruct, &outputStructCnt);
          if (v20)
          {
            v21 = v20;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(v21));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              outputCnt[0] = 67109378;
              outputCnt[1] = v21;
              LOWORD(outputCnt[2]) = 2112;
              *(_QWORD *)((char *)&outputCnt[2] + 2) = v38;
              _os_log_fault_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "_getDVFSDomainName (0x%x - %@)", (uint8_t *)outputCnt, 0x12u);

            }
          }
          if (outputStructCnt)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", outputStruct);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (!v22)
              goto LABEL_49;
          }
          else
          {
            v22 = &stru_24E4716F0;
          }
          if (!-[__CFString length](v22, "length"))
            goto LABEL_49;
          v23 = -[__CFString copy](v22, "copy");
          p_name = (void **)&domainInfos[v16].name;
          v26 = *p_name;
          v25 = p_name + 5;
          *p_name = (void *)v23;
          v27 = (uint64_t *)(p_name + 6);

          connection = self->_connection;
          if (connection)
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            memset(outputCnt, 0, sizeof(outputCnt));
            *(_QWORD *)buf = v16;
            LODWORD(outputStructCnt) = 3;
            v29 = IOConnectCallMethod(connection, dword_25551F6D4, (const uint64_t *)buf, 1u, 0, 0, (uint64_t *)outputCnt, (uint32_t *)&outputStructCnt, 0, 0);
            if (v29)
            {
              v30 = v29;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(v30));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)outputStruct = 67109378;
                *(_DWORD *)&outputStruct[4] = v30;
                LOWORD(v44[0]) = 2112;
                *(_QWORD *)((char *)v44 + 2) = v39;
                _os_log_fault_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "_getNumDVFSStates (0x%x - %@)", outputStruct, 0x12u);

              }
            }
            v31 = *(_QWORD *)outputCnt;
            if (*(_QWORD *)outputCnt)
              *v25 = *(_OWORD *)&outputCnt[2];
          }
          else
          {
            v31 = 0;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            v32 = *(_QWORD *)v25;
            v33 = *v27;
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v32;
            LOWORD(v53) = 2048;
            *(_QWORD *)((char *)&v53 + 2) = v33;
            _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%llu states in Domains %@, Current Range: [%llu -> %llu]", buf, 0x2Au);
          }
          if (!v31)
          {
LABEL_49:

            goto LABEL_50;
          }
          if (objc_msgSend(&unk_24E476540, "count"))
          {
            v34 = 0;
            while (1)
            {
              objc_msgSend(&unk_24E476540, "objectAtIndexedSubscript:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[__CFString hasPrefix:](v22, "hasPrefix:", v35))
              {
                v36 = objc_msgSend(v35, "length") + 1;
                if (v36 >= -[__CFString length](v22, "length"))
                  break;
              }

              if (++v34 >= (unint64_t)objc_msgSend(&unk_24E476540, "count"))
                goto LABEL_47;
            }
            v37 = &domainInfos[v16];
            v37->stateValues[2] = v31 - 1;
            v37->stateValues[0] = 0;
            v37->stateValues[1] = (unint64_t)(v31 - 1) >> 1;

          }
LABEL_47:

          if (++v16 >= self->_nDomains)
            goto LABEL_48;
        }
      }
      else
      {
LABEL_48:
        LOBYTE(v9) = -[ApplePMPPerfStateControl _enableConsistentPerfState:](self, "_enableConsistentPerfState:", v41);
      }
    }
    else
    {
LABEL_50:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 1768; i != -24; i -= 56)

}

- (void)_open:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(a1));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "IOServiceOpen (0x%x - %@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)setupConnectionForPowerState:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(a1));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "_getNumDVFSDomains (0x%x - %@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
