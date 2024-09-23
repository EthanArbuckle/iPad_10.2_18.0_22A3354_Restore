@implementation MKPerformanceTable

- (MKPerformanceTable)initWithJSONFile:(id)a3 analytics:(id)a4
{
  id v6;
  id v7;
  MKPerformanceTable *v8;
  MKPerformanceTable *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPerformanceTable;
  v8 = -[MKTable init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MKPerformanceTable setAnalytics:](v8, "setAnalytics:", v7);
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPerformanceTable setBasePath:](v9, "setBasePath:", v10);

    -[MKPerformanceTable generateTableFromJSONFile:](v9, "generateTableFromJSONFile:", v6);
  }

  return v9;
}

- (void)generateTableFromJSONFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *p_super;
  MKPerformanceData *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
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
  void *v54;
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
  uint64_t j;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
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
  id v107;
  MKPerformanceData *v108;
  id obj;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  MKPerformanceTable *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
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
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  id v181;
  _QWORD v182[11];
  _BYTE v183[128];
  _QWORD v184[11];
  _QWORD v185[5];
  _QWORD v186[11];
  _QWORD v187[10];
  _BYTE v188[128];
  uint64_t v189;

  v189 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsAtPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v181 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v181);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v181;
    if (v8)
    {
      +[MKLog log](MKLog, "log");
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[MKPerformanceTable generateTableFromJSONFile:].cold.2();
    }
    else
    {
      v107 = v4;
      v10 = -[MKPerformanceData initWithDictionary:]([MKPerformanceData alloc], "initWithDictionary:", v7);
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v11 = objc_claimAutoreleasedReturnValue();
      -[MKPerformanceTable createNumberFormatterWithLocale:](self, "createNumberFormatterWithLocale:", v11);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = (void *)v11;
      -[MKPerformanceTable createTimeFormatterWithLocale:](self, "createTimeFormatterWithLocale:", v11);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPerformanceTable createSizeFormatter](self, "createSizeFormatter");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPerformanceTable createThroughputFormatter](self, "createThroughputFormatter");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = 0u;
      v178 = 0u;
      v179 = 0u;
      v180 = 0u;
      -[MKPerformanceData dataClasses](v10, "dataClasses");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v177, v188, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v178;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v178 != v16)
              objc_enumerationMutation(v12);
            v15 += objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * i), "size");
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v177, v188, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      -[MKPerformanceTable analytics](self, "analytics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "payload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "elapsedTime");

      v106 = v6;
      v105 = v7;
      v108 = v10;
      if (v20)
      {
        -[MKPerformanceTable analytics](self, "analytics");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "payload");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (double)v15 / (double)(unint64_t)objc_msgSend(v22, "elapsedTime");

      }
      else
      {
        v23 = 0.0;
      }
      v153 = (void *)MEMORY[0x24BDD17C8];
      -[MKPerformanceTable analytics](self, "analytics");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "payload");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "androidBrand");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPerformanceTable analytics](self, "analytics");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "payload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "androidModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPerformanceTable analytics](self, "analytics");
      v115 = self;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "payload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "androidAPILevel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPerformanceTable analytics](self, "analytics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "payload");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "androidVersion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "stringWithFormat:", CFSTR("%@ %@ - API %@ - M2iOS %@ "), v148, v25, v28, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v103 = (void *)v32;
      +[MKTableRow rowWithTitle:](MKTableRow, "rowWithTitle:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v33);

      +[MKTableRow separatorRow](MKTableRow, "separatorRow");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v34);

      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v169, 0);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v187[0] = v164;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v159, 0);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v187[1] = v154;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Size"), 0, 1);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v187[2] = v149;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v144, 0);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v187[3] = v139;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v137, 0);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v187[4] = v134;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v131, 0);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v187[5] = v128;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v35, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v187[6] = v36;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v37, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v187[7] = v38;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Duration"), 0, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v187[8] = v39;
      +[MKTableCell cellWithValue:formatter:columnSpan:alignment:](MKTableCell, "cellWithValue:formatter:columnSpan:alignment:", CFSTR("Throughput (MB/s)"), 0, 2, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v187[9] = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v187, 10);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableRow rowWithCells:](MKTableRow, "rowWithCells:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v42);

      +[MKTableRow separatorRow](MKTableRow, "separatorRow");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v43);

      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", CFSTR("Whole Migration"), 0);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v186[0] = v170;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v165, 0);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v186[1] = v160;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v15);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v155, v113, 2);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v186[2] = v150;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v145, 0);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v186[3] = v141;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v140, 0);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v186[4] = v135;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v132, 0);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v186[5] = v129;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v126, 0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v186[6] = v124;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v122, 0);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v186[7] = v120;
      v44 = (void *)MEMORY[0x24BDD16E0];
      -[MKAnalytics payload](v115->_analytics, "payload");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "numberWithUnsignedLongLong:", objc_msgSend(v45, "elapsedTime"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v46, v114, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v186[8] = v47;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v48, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v186[9] = v49;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v50, v112, 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v186[10] = v51;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v186, 11);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableRow rowWithCells:](MKTableRow, "rowWithCells:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v53);

      +[MKTableRow separatorRow](MKTableRow, "separatorRow");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v54);

      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", CFSTR("Data Class"), 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v185[0] = v55;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Item Count"), 0, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v185[1] = v56;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Size"), 0, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v185[2] = v57;
      +[MKTableCell cellWithValue:formatter:columnSpan:alignment:](MKTableCell, "cellWithValue:formatter:columnSpan:alignment:", CFSTR("Phase Duration"), 0, 6, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v185[3] = v58;
      +[MKTableCell cellWithValue:formatter:columnSpan:alignment:](MKTableCell, "cellWithValue:formatter:columnSpan:alignment:", CFSTR("Throughput (MB/s)"), 0, 2, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v185[4] = v59;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v185, 5);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableRow rowWithCells:](MKTableRow, "rowWithCells:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v61);

      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v171, 0);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v184[0] = v166;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v161, 0);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v184[1] = v156;
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v151, 0);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v184[2] = v146;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Prep"), 0, 1);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v184[3] = v142;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Export"), 0, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v184[4] = v62;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Queue"), 0, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v184[5] = v63;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Transfer"), 0, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v184[6] = v64;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Import"), 0, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v184[7] = v65;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Total"), 0, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v184[8] = v66;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Transfer"), 0, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v184[9] = v67;
      +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", CFSTR("Total"), 0, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v184[10] = v68;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v184, 11);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKTableRow rowWithCells:](MKTableRow, "rowWithCells:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v70);

      +[MKTableRow separatorRow](MKTableRow, "separatorRow");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v71);

      -[MKPerformanceTable displayNamesByDataClass](v115, "displayNamesByDataClass");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPerformanceTable importTimesByDataClass](v115, "importTimesByDataClass");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = 0u;
      v174 = 0u;
      v175 = 0u;
      v176 = 0u;
      -[MKPerformanceData dataClasses](v108, "dataClasses");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v183, 16);
      if (v118)
      {
        v116 = *(_QWORD *)v174;
        do
        {
          for (j = 0; j != v118; ++j)
          {
            if (*(_QWORD *)v174 != v116)
              objc_enumerationMutation(obj);
            v73 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * j);
            objc_msgSend(v73, "name");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "objectForKey:", v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            if (v75)
            {
              objc_msgSend(v73, "name");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "objectForKey:", v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v73, "preparationTime");
              v79 = v78;
              objc_msgSend(v73, "exportTime");
              v81 = v79 + v80;
              objc_msgSend(v73, "networkQueueTime");
              v83 = v81 + v82;
              objc_msgSend(v73, "transferTime");
              v85 = v83 + v84;
              objc_msgSend(v77, "doubleValue");
              v87 = v85 + v86;
              v88 = 0.0;
              if (v87 > 0.0)
                v88 = (double)(unint64_t)objc_msgSend(v73, "size") / v87;
              +[MKTableCell cellWithValue:formatter:](MKTableCell, "cellWithValue:formatter:", v75, 0);
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = v75;
              v182[0] = v167;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v73, "itemCount"));
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v162, v111, 2);
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v182[1] = v157;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v73, "size"));
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v152, v113, 2);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              v182[2] = v147;
              v89 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v73, "preparationTime");
              objc_msgSend(v89, "numberWithDouble:");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v143, v114, 2);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              v182[3] = v138;
              v90 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v73, "exportTime");
              objc_msgSend(v90, "numberWithDouble:");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v136, v114, 2);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v182[4] = v133;
              v91 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v73, "networkQueueTime");
              objc_msgSend(v91, "numberWithDouble:");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v130, v114, 2);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v182[5] = v127;
              v92 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v73, "transferTime");
              objc_msgSend(v92, "numberWithDouble:");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v123, v114, 2);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v182[6] = v121;
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v77, v114, 2);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              v182[7] = v119;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v87);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v93, v114, 2);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v182[8] = v94;
              v125 = v77;
              v95 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v73, "transferSpeed");
              objc_msgSend(v95, "numberWithDouble:");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v96, v112, 2);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v182[9] = v97;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v88);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableCell cellWithValue:formatter:alignment:](MKTableCell, "cellWithValue:formatter:alignment:", v98, v112, 2);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v182[10] = v99;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v182, 11);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKTableRow rowWithCells:](MKTableRow, "rowWithCells:", v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              -[MKTable addRow:](v115, "addRow:", v101);

              v75 = v172;
              objc_msgSend(v73, "size");

            }
          }
          v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v183, 16);
        }
        while (v118);
      }

      +[MKTableRow separatorRow](MKTableRow, "separatorRow");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTable addRow:](v115, "addRow:", v102);

      v6 = v106;
      v4 = v107;
      v7 = v105;
      v8 = 0;
      p_super = &v108->super;
    }

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKPerformanceTable generateTableFromJSONFile:].cold.1();
  }

}

- (void)writeToDisk
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
  objc_super v24;

  v18 = (void *)MEMORY[0x24BDD17C8];
  -[MKPerformanceTable analytics](self, "analytics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "payload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "androidBrand");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPerformanceTable analytics](self, "analytics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "androidModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPerformanceTable analytics](self, "analytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "androidAPILevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPerformanceTable analytics](self, "analytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "androidVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("perf-results_%@_%@_api-%@_v%@.csv"), v17, v4, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/ "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("-"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKPerformanceTable basePath](self, "basePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)MKPerformanceTable;
  -[MKTable writeToDisk:](&v24, sel_writeToDisk_, v16);

}

- (id)createNumberFormatterWithLocale:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BDD16F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setLocale:", v4);

  objc_msgSend(v5, "setNumberStyle:", 1);
  objc_msgSend(v5, "setMaximumFractionDigits:", 1);
  objc_msgSend(v5, "setRoundingMode:", 6);
  return v5;
}

- (id)createTimeFormatterWithLocale:(id)a3
{
  id v3;
  MKTimeFormatter *v4;

  v3 = a3;
  v4 = objc_alloc_init(MKTimeFormatter);
  -[MKTimeFormatter setLocale:](v4, "setLocale:", v3);

  return v4;
}

- (id)createSizeFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1490]);
  objc_msgSend(v2, "setCountStyle:", 0);
  objc_msgSend(v2, "setAllowsNonnumericFormatting:", 0);
  objc_msgSend(v2, "setZeroPadsFractionDigits:", 1);
  objc_msgSend(v2, "setAllowedUnits:", 12);
  return v2;
}

- (id)createThroughputFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1490]);
  objc_msgSend(v2, "setCountStyle:", 0);
  objc_msgSend(v2, "setAllowedUnits:", 12);
  objc_msgSend(v2, "setIncludesUnit:", 0);
  objc_msgSend(v2, "setZeroPadsFractionDigits:", 1);
  return v2;
}

- (id)displayNamesByDataClass
{
  return &unk_24E36C830;
}

- (id)importTimesByDataClass
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
  id v14;
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
  _QWORD v45[12];
  _QWORD v46[14];

  v46[12] = *MEMORY[0x24BDAC8D0];
  v45[0] = CFSTR("accessibility_settings");
  -[MKPerformanceTable analytics](self, "analytics");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "payload");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "accessibilitySettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "importElapsedTime");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v41;
  v45[1] = CFSTR("accounts");
  -[MKPerformanceTable analytics](self, "analytics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "payload");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "accounts");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "importElapsedTime");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v37;
  v46[2] = &unk_24E36BF88;
  v45[2] = CFSTR("application");
  v45[3] = CFSTR("calendars");
  -[MKPerformanceTable analytics](self, "analytics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "payload");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "calendars");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "importElapsedTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v33;
  v45[4] = CFSTR("contacts");
  -[MKPerformanceTable analytics](self, "analytics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "payload");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "contacts");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "importElapsedTime");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v29;
  v45[5] = CFSTR("display_settings");
  -[MKPerformanceTable analytics](self, "analytics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "payload");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displaySettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "importElapsedTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v25;
  v45[6] = CFSTR("files");
  -[MKPerformanceTable analytics](self, "analytics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "files");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "importElapsedTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v21;
  v45[7] = CFSTR("messages");
  -[MKPerformanceTable analytics](self, "analytics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "importElapsedTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v17;
  v45[8] = CFSTR("photos");
  -[MKPerformanceTable analytics](self, "analytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "photos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importElapsedTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v4;
  v45[9] = CFSTR("videos");
  -[MKPerformanceTable analytics](self, "analytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "importElapsedTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[9] = v8;
  v45[10] = CFSTR("whatsapp_container");
  -[MKPerformanceTable analytics](self, "analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "whatsapp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "importElapsedTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = CFSTR("whatsapp_placeholder");
  v46[10] = v12;
  v46[11] = &unk_24E36BF88;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MKAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (NSString)basePath
{
  return self->_basePath;
}

- (void)setBasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
}

- (void)generateTableFromJSONFile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "%@: Failed to read performance data from %@");
}

- (void)generateTableFromJSONFile:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "%@: Failed to deserialize JSON data. error=%@");
}

@end
