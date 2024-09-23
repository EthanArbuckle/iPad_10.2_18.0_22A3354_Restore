uint64_t one-time initialization function for logger()
{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ModelEvaluation", 0xFuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataValidation", 0xEuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static SQLiteDB.logger);
  __swift_project_value_buffer(v1, (uint64_t)static SQLiteDB.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sql", 3uLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static WifiModel.logger);
  __swift_project_value_buffer(v1, (uint64_t)static WifiModel.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("WifiModel", 9uLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static CellularModel.logger);
  __swift_project_value_buffer(v1, (uint64_t)static CellularModel.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CellularModel", 0xDuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static DataWriter.logger);
  __swift_project_value_buffer(v1, (uint64_t)static DataWriter.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataWriter", 0xAuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static MediaML.logger);
  __swift_project_value_buffer(v1, (uint64_t)static MediaML.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MediaML", 7uLL, 1);
  return Logger.init(subsystem:category:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

Swift::Double __swiftcall meanAbsolutePercentageError(yRealList:yPredList:)(Swift::OpaquePointer yRealList, Swift::OpaquePointer yPredList)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  Swift::Double result;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE **v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t *v65;
  uint32_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  NSObject *v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int v92;
  uint64_t *v93;
  uint64_t *v94;
  _BYTE **v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t *v101;
  uint32_t v102;
  int v103;
  NSObject *v104;
  uint64_t v105;
  Swift::Double v106;
  Swift::Double v107;
  uint64_t v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void **v117;
  uint64_t v118;
  _QWORD *v119;
  unint64_t v120;
  uint64_t *v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  uint64_t v127;
  void *rawValue;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  unint64_t v133;
  char *v134;
  void *v135;
  uint64_t v136;
  double v137;
  Swift::Double v138;
  uint64_t v139;
  uint64_t v140;
  Swift::Double v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _BYTE *v147;
  uint64_t v148;
  uint32_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  _QWORD v154[3];
  uint64_t (*v155)(uint64_t, uint64_t, uint64_t);
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  _BYTE *v159;
  uint64_t v160;
  uint32_t v161;
  uint64_t v162;
  uint64_t v163;

  rawValue = yRealList._rawValue;
  v135 = yPredList._rawValue;
  v126 = -1.0;
  v163 = 0;
  v162 = 0;
  v127 = 0;
  v150 = 0;
  v142 = 0;
  v138 = 0.0;
  v137 = 0.0;
  v129 = type metadata accessor for Logger();
  v130 = *(_QWORD *)(v129 - 8);
  v131 = (*(_QWORD *)(v130 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](rawValue);
  v132 = (char *)&v47 - v131;
  v133 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v134 = (char *)&v47 - v133;
  v163 = v4;
  v162 = v5;
  v136 = MEMORY[0x242696274]();
  v6 = MEMORY[0x242696274](v135);
  if (v136 != v6)
  {
    v22 = v132;
    v23 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v22, v23, v129);
    swift_bridgeObjectRetain();
    v62 = 24;
    v72 = 7;
    v67 = swift_allocObject();
    *(_QWORD *)(v67 + 16) = rawValue;
    swift_bridgeObjectRetain();
    v73 = swift_allocObject();
    *(_QWORD *)(v73 + 16) = v135;
    v84 = Logger.logObject.getter();
    v85 = static os_log_type_t.error.getter();
    v65 = &v160;
    v160 = 22;
    v63 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v64 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v66 = v161;
    v69 = 17;
    v75 = swift_allocObject();
    *(_BYTE *)(v75 + 16) = 0;
    v76 = swift_allocObject();
    v70 = 8;
    *(_BYTE *)(v76 + 16) = 8;
    v71 = 32;
    v24 = swift_allocObject();
    v25 = v67;
    v68 = v24;
    *(_QWORD *)(v24 + 16) = partial apply for implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:);
    *(_QWORD *)(v24 + 24) = v25;
    v26 = swift_allocObject();
    v27 = v68;
    v77 = v26;
    *(_QWORD *)(v26 + 16) = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
    *(_QWORD *)(v26 + 24) = v27;
    v78 = swift_allocObject();
    *(_BYTE *)(v78 + 16) = 0;
    v79 = swift_allocObject();
    *(_BYTE *)(v79 + 16) = v70;
    v28 = swift_allocObject();
    v29 = v73;
    v74 = v28;
    *(_QWORD *)(v28 + 16) = partial apply for implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:);
    *(_QWORD *)(v28 + 24) = v29;
    v30 = swift_allocObject();
    v31 = v74;
    v81 = v30;
    *(_QWORD *)(v30 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(_QWORD *)(v30 + 24) = v31;
    v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v80 = _allocateUninitializedArray<A>(_:)();
    v82 = v32;
    swift_retain();
    v33 = v75;
    v34 = v82;
    *v82 = partial apply for closure #1 in OSLogArguments.append(_:);
    v34[1] = v33;
    swift_retain();
    v35 = v76;
    v36 = v82;
    v82[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v36[3] = v35;
    swift_retain();
    v37 = v77;
    v38 = v82;
    v82[4] = partial apply for closure #1 in OSLogArguments.append<A>(_:);
    v38[5] = v37;
    swift_retain();
    v39 = v78;
    v40 = v82;
    v82[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v40[7] = v39;
    swift_retain();
    v41 = v79;
    v42 = v82;
    v82[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v42[9] = v41;
    swift_retain();
    v43 = v81;
    v44 = v82;
    v82[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v44[11] = v43;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v84, (os_log_type_t)v85))
    {
      v45 = v127;
      v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v54 = 0;
      v56 = createStorage<A>(capacity:type:)(0);
      v57 = createStorage<A>(capacity:type:)(v54);
      v58 = &v159;
      v159 = v55;
      v59 = &v158;
      v158 = v56;
      v60 = &v157;
      v157 = v57;
      serialize(_:at:)(0, &v159);
      serialize(_:at:)(2, v58);
      v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v156 = v75;
      closure #1 in osLogInternal(_:log:type:)(&v155, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60);
      v61 = v45;
      if (v45)
      {
        __break(1u);
      }
      else
      {
        v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v156 = v76;
        closure #1 in osLogInternal(_:log:type:)(&v155, (uint64_t)&v159, (uint64_t)&v158, (uint64_t)&v157);
        v52 = 0;
        v46 = v52;
        v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
        v156 = v77;
        closure #1 in osLogInternal(_:log:type:)(&v155, (uint64_t)&v159, (uint64_t)&v158, (uint64_t)&v157);
        v51 = v46;
        v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v156 = v78;
        closure #1 in osLogInternal(_:log:type:)(&v155, (uint64_t)&v159, (uint64_t)&v158, (uint64_t)&v157);
        v50 = 0;
        v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v156 = v79;
        closure #1 in osLogInternal(_:log:type:)(&v155, (uint64_t)&v159, (uint64_t)&v158, (uint64_t)&v157);
        v49 = 0;
        v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v156 = v81;
        closure #1 in osLogInternal(_:log:type:)(&v155, (uint64_t)&v159, (uint64_t)&v158, (uint64_t)&v157);
        _os_log_impl(&dword_241527000, v84, (os_log_type_t)v85, "Length mismatch between yRealList(%ld) and yPredList(%ld", v55, v66);
        v48 = 0;
        destroyStorage<A>(_:count:)(v56, 0, v53);
        destroyStorage<A>(_:count:)(v57, v48, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696394](v55, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v130 + 8))(v132, v129);
    return v126;
  }
  v7 = v127;
  v119 = v154;
  v154[0] = rawValue;
  v117 = &v153;
  v153 = v135;
  v118 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  v120 = lazy protocol witness table accessor for type [Double] and conformance [A]();
  zip<A, B>(_:_:)();
  v151 = v154[1];
  v152 = v154[2];
  v121 = &v47;
  MEMORY[0x24BDAC7A8](&v47);
  v8 = &v47 - 4;
  v122 = &v47 - 4;
  v8[2] = (uint64_t)closure #1 in meanAbsolutePercentageError(yRealList:yPredList:);
  v8[3] = 0;
  v123 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Zip2Sequence<[Double], [Double]>);
  lazy protocol witness table accessor for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>();
  v9 = Sequence.filter(_:)();
  v124 = v7;
  v125 = v9;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    v116 = v125;
    v150 = v125;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Double, Double));
    if (MEMORY[0x242696268](v116, v11) <= 0)
    {
      v16 = v134;
      v17 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v16, v17, v129);
      v104 = Logger.logObject.getter();
      v103 = static os_log_type_t.error.getter();
      v101 = &v148;
      v148 = 2;
      v99 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v100 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v102 = v149;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v105 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v104, (os_log_type_t)v103))
      {
        v18 = v124;
        v89 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v87 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v88 = 0;
        v90 = createStorage<A>(capacity:type:)(0);
        v91 = createStorage<A>(capacity:type:)(v88);
        v95 = &v147;
        v147 = v89;
        v96 = &v146;
        v146 = v90;
        v93 = &v145;
        v145 = v91;
        v92 = 0;
        serialize(_:at:)(0, &v147);
        serialize(_:at:)(v92, v95);
        v144 = v105;
        v94 = &v47;
        MEMORY[0x24BDAC7A8](&v47);
        v19 = v96;
        v20 = &v47 - 6;
        v97 = &v47 - 6;
        v20[2] = (uint64_t)v95;
        v20[3] = (uint64_t)v19;
        v20[4] = v21;
        v98 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v18)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_241527000, v104, (os_log_type_t)v103, "Length of non-zero yReal & yPred is zero", v89, v102);
          v86 = 0;
          destroyStorage<A>(_:count:)(v90, 0, v87);
          destroyStorage<A>(_:count:)(v91, v86, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x242696394](v89, MEMORY[0x24BEE4260]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v130 + 8))(v134, v129);
      swift_bridgeObjectRelease();
      return v126;
    }
    v12 = v124;
    v143 = v116;
    v110 = &v47;
    MEMORY[0x24BDAC7A8](&v47);
    v13 = &v47 - 4;
    v111 = &v47 - 4;
    v13[2] = (uint64_t)closure #2 in meanAbsolutePercentageError(yRealList:yPredList:);
    v13[3] = 0;
    v112 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(Double, Double)]);
    v14 = lazy protocol witness table accessor for type [(Double, Double)] and conformance [A]();
    v15 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double), (uint64_t)v111, v112, MEMORY[0x24BEE13C8], MEMORY[0x24BEE4078], v14, MEMORY[0x24BEE40A8], v113);
    v114 = v12;
    v115 = v15;
    if (!v12)
    {
      v109 = v115;
      v142 = v115;
      v140 = v115;
      v139 = 0;
      Sequence.reduce<A>(_:_:)();
      v106 = Double.init(_:)(v141);
      v138 = v106;
      v137 = (double)MEMORY[0x242696274](v109);
      v107 = v106 / v137;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v107;
    }
  }
  __break(1u);
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return MEMORY[0x242696274]();
}

uint64_t sub_24152A6CC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)();
}

uint64_t implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return MEMORY[0x242696274]();
}

uint64_t sub_24152A724()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)();
}

BOOL closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)(double a1, double a2)
{
  return a1 > 0.0 && a2 > 0.0;
}

uint64_t thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Bool)(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]) & 1;
}

double closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  double v1;
  Swift::Double v2;
  Swift::Double v3;

  abs<A>(_:)();
  v1 = Double.init(_:)(v3);
  abs<A>(_:)();
  return v1 / Double.init(_:)(v2);
}

void thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double)(double *a1@<X0>, double (*a2)(double, double)@<X1>, double *a3@<X8>)
{
  *a3 = a2(*a1, a1[1]);
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[2];
  void (*v16)(char *, _QWORD);
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void (*v30)(char *, char *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t AssociatedTypeWitness;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  Swift::Int v60;
  char v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v30 = a1;
  v31 = a2;
  v53 = a3;
  v44 = a4;
  v32 = a5;
  v52 = a6;
  v34 = a8;
  v35 = "Fatal error";
  v36 = "Index out of bounds";
  v37 = "Swift/Collection.swift";
  v38 = "Range requires lowerBound <= upperBound";
  v39 = "Swift/Range.swift";
  v40 = "Index out of range";
  v67 = a3;
  v66 = a4;
  v65 = a5;
  v41 = *(_QWORD *)(a5 - 8);
  v42 = (*(_QWORD *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v43 = (char *)v15 - v42;
  v45 = 0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v47 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v48 = (*(_QWORD *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x24BDAC7A8](v45);
  v49 = (char *)v15 - v48;
  v50 = (*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)v15 - v50;
  v54 = swift_getAssociatedTypeWitness();
  v55 = *(_QWORD *)(v54 - 8);
  v56 = (*(_QWORD *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x24BDAC7A8](v53);
  v57 = (char *)v15 - v56;
  v58 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)v15 - v58;
  v60 = dispatch thunk of Collection.count.getter();
  if (v60)
  {
    v64 = MEMORY[0x2426964B4](v44);
    v29 = type metadata accessor for ContiguousArray();
    ContiguousArray.reserveCapacity(_:)(v60);
    result = dispatch thunk of Collection.startIndex.getter();
    if (v60 >= 0)
    {
      v27 = 0;
      for (i = v33; ; i = v18)
      {
        v25 = i;
        v26 = v27;
        if (v27 == v60)
          goto LABEL_17;
        if (v26 < 0 || v26 >= v60)
          goto LABEL_16;
        v62 = v26;
        if (v60 < 0)
          goto LABEL_15;
        if (v26 >= v60)
          break;
        v24 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          return result;
        }
        v63 = 0;
        v23 = v24;
LABEL_18:
        v22 = v23;
        if ((v63 & 1) != 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v57, v59, v54);
          _expectEnd<A>(of:is:)();
          (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
          v19 = v64;
          swift_retain();
          swift_release();
          v20 = v19;
          v21 = v25;
          return v20;
        }
        v17 = &v61;
        v16 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
        (*(void (**)(char *))(v47 + 16))(v49);
        v16(v17, 0);
        v14 = v25;
        v30(v49, v43);
        v18 = v14;
        if (v14)
        {
          (*(void (**)(char *, uint64_t))(v47 + 8))(v49, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v55 + 8))(v59, v54);
          outlined destroy of ContiguousArray<A1>();
          (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v34, v43, v32);
          return v15[1];
        }
        (*(void (**)(char *, uint64_t))(v47 + 8))(v49, AssociatedTypeWitness);
        ContiguousArray.append(_:)();
        dispatch thunk of Collection.formIndex(after:)();
        result = v18;
        v27 = v22;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_15:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_16:
      _fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
LABEL_17:
      v62 = 0;
      v63 = 1;
      v23 = v26;
      goto LABEL_18;
    }
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v20 = static Array._allocateUninitialized(_:)();
  v21 = v33;
  return v20;
}

double implicit closure #3 in meanAbsolutePercentageError(yRealList:yPredList:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 + *a2;
  *a3 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE4518], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return v0;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return v0;
  }
  return v2;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1)
{
  if (a1)
    return static UnsafeMutablePointer.allocate(capacity:)();
  else
    return 0;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t destroyStorage<A>(_:count:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = result;
  if (result)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    return MEMORY[0x242696394](v3, a3);
  }
  return result;
}

Swift::Void __swiftcall Array._endMutation()()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v15 = a1;
  v18 = a6;
  v13[1] = a7;
  v22 = a6;
  v16 = *(_QWORD *)(a6 - 8);
  v13[0] = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](a1);
  v17 = (uint64_t)v13 - v13[0];
  v8(v7);
  v14 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  v20 = *v15;
  v21 = v20 + v14;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v17, partial apply for closure #1 in serialize<A>(_:at:), (uint64_t)v19, v18, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], v13[2]);
  v9 = v16;
  v10 = v17;
  v11 = v18;
  *v15 += v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = a2;
  v13 = a5;
  v14 = a8;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = *(_QWORD *)(a5 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v12 - v16;
  v20 = v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  result = v17();
  v19 = v8;
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v18, v13);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_24152B5E0()
{
  return swift_deallocObject();
}

_BYTE **partial apply for closure #1 in OSLogArguments.append(_:)(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_24152B610()
{
  return swift_deallocObject();
}

_BYTE **closure #1 in OSLogArguments.append(_:)partial apply(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_24152B640()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_24152B688()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t sub_24152B78C()
{
  return swift_deallocObject();
}

uint64_t sub_24152B7BC()
{
  return swift_deallocObject();
}

uint64_t sub_24152B7EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_24152B834()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x242696A18]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
  type metadata accessor for Array();
  Array._endMutation()();
}

unint64_t lazy protocol witness table accessor for type [Double] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Double] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Double] and conformance [A]);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Double] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12B8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Double] and conformance [A]);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x242696A24](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Bool)(double *a1)
{
  uint64_t v1;

  return thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Bool)(a1, *(uint64_t (**)(double, double))(v1 + 16)) & 1;
}

unint64_t lazy protocol witness table accessor for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>;
  if (!lazy protocol witness table cache variable for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Zip2Sequence<[Double], [Double]>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE2620], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>);
    return v1;
  }
  return v3;
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return v1;
  }
  return v3;
}

void partial apply for thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double)(double *a1@<X0>, double *a2@<X8>)
{
  uint64_t v2;

  thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double)(a1, *(double (**)(double, double))(v2 + 16), a2);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of ContiguousArray<A1>()
{
  swift_release();
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return closure #1 in serialize<A>(_:at:)();
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

Swift::Double __swiftcall getMean(nums:)(Swift::OpaquePointer nums)
{
  double v3;
  Swift::Double v4;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  lazy protocol witness table accessor for type [Double] and conformance [A]();
  Sequence.reduce<A>(_:_:)();
  v3 = Double.init(_:)(v4);
  return v3 / (double)MEMORY[0x242696274](nums._rawValue);
}

double implicit closure #1 in getMean(nums:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 + *a2;
  *a3 = result;
  return result;
}

Swift::Double __swiftcall getMedian(nums:)(Swift::OpaquePointer nums)
{
  Swift::Double result;
  double v3;
  Swift::Double v4;
  Swift::Double v5;
  Swift::Double v6;
  double v8;
  uint64_t v9;

  v9 = MEMORY[0x242696274]() / 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  lazy protocol witness table accessor for type [Double] and conformance [A]();
  Sequence<>.sorted()();
  if (MEMORY[0x242696274]() % 2)
  {
    specialized Array.subscript.getter();
    v5 = Double.init(_:)(v4);
    swift_bridgeObjectRelease();
    return v5;
  }
  specialized Array.subscript.getter();
  v8 = result;
  if (!__OFSUB__(v9, 1))
  {
    specialized Array.subscript.getter();
    v6 = Double.init(_:)((v8 + v3) / 2.0);
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

{
  Swift::Double result;
  Swift::Double v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = MEMORY[0x242696280]() / 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  lazy protocol witness table accessor for type [Int] and conformance [A]();
  v8 = Sequence<>.sorted()();
  if (MEMORY[0x242696280]() % 2)
  {
    v4 = (double)MEMORY[0x2426962C8](v7, v8);
    swift_bridgeObjectRelease();
    return v4;
  }
  v6 = MEMORY[0x2426962C8](v7, v8);
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    v9 = MEMORY[0x2426962C8](v7 - 1, v8);
    if (!__OFADD__(v6, v9))
    {
      swift_bridgeObjectRelease();
      return (double)((v6 + v9) / 2);
    }
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [Int] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Int] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Int] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Int]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Int] and conformance [A]);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Int] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Int] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Int]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12B8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Int] and conformance [A]);
    return v1;
  }
  return v3;
}

uint64_t getSteadyList(windowSize:rssiThreshold:rssiList:)(uint64_t a1)
{
  uint64_t result;
  char v2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v15 = MEMORY[0x242696280]();
  v13 = a1 / 2;
  v25 = _allocateUninitializedArray<A>(_:)();
  if (v15 < 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  specialized Collection<>.makeIterator()();
  while (1)
  {
    result = specialized IndexingIterator.next()();
    v12 = result;
    if ((v2 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      outlined destroy of [Int]();
      return v25;
    }
    if (v13 < v15)
    {
      if (result >= v13)
      {
        if (__OFSUB__(result, v13))
          goto LABEL_49;
        result = max<A>(_:_:)();
        v24 = v18;
        if (__OFADD__(v12, v13))
          goto LABEL_50;
        if (__OFSUB__(v15, 1))
          goto LABEL_51;
        min<A>(_:_:)();
        v23 = v17;
      }
      else
      {
        v24 = 0;
        if (__OFADD__(result, v13))
          goto LABEL_52;
        if (__OFSUB__(v15, 1))
          goto LABEL_53;
        min<A>(_:_:)();
        v23 = v16;
      }
    }
    else
    {
      v24 = 0;
      if (__OFSUB__(v15, 1))
        goto LABEL_54;
      v23 = v15 - 1;
    }
    if (v23 < v24)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClosedRange<Int>);
    lazy protocol witness table accessor for type [Int] and conformance [A]();
    lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>();
    MutableCollection.subscript.getter();
    outlined destroy of [Int]();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Int>);
    lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>();
    Sequence<>.max()();
    if ((v22 & 1) != 0)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
      v11 = v21;
    }
    result = Sequence<>.min()();
    if ((v20 & 1) != 0)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
      v10 = v19;
    }
    if (__OFSUB__(v11, v10))
      break;
    abs<A>(_:)();
    specialized Array.append(_:)();
    swift_unknownObjectRelease();
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Int]()
{
  swift_bridgeObjectRelease();
}

unint64_t lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>;
  if (!lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ClosedRange<Int>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE08F8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>);
    return v1;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<Int>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE2180], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>);
    return v1;
  }
  return v3;
}

uint64_t getFlatList(durationThreshold:steadyList:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  char v6;
  BOOL v20;
  uint64_t v21;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v33 = MEMORY[0x242696280]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (start: Int, end: Int, count: Int));
  v2 = _allocateUninitializedArray<A>(_:)();
  result = v33;
  v37 = v2;
  v36 = 0;
  v35 = 0;
  if (v33 < a1)
  {
LABEL_93:
    swift_bridgeObjectRetain();
    outlined destroy of [(start: Int, end: Int, count: Int)]();
    return v37;
  }
  if (!__OFSUB__(v33, 2))
  {
    if (v33 - 2 < 0)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    specialized Collection<>.makeIterator()();
    while (1)
    {
      v34 = specialized IndexingIterator.next()();
      if ((v6 & 1) != 0)
        goto LABEL_93;
      v30 = MEMORY[0x2426962C8](v34, a2, v5) != 0;
      result = swift_bridgeObjectRetain();
      if (v30)
      {
        v29 = 0;
      }
      else
      {
        if (__OFADD__(v34, 1))
          goto LABEL_107;
        v29 = MEMORY[0x2426962C8](v34 + 1, a2) == 1;
      }
      result = swift_bridgeObjectRelease();
      if (v29)
      {
        v36 = 0;
        if (__OFADD__(v34, 1))
          goto LABEL_106;
        v35 = v34 + 1;
      }
      else
      {
        v28 = MEMORY[0x2426962C8](v34, a2) != 1;
        result = swift_bridgeObjectRetain();
        if (v28)
        {
          v27 = 0;
        }
        else
        {
          if (__OFADD__(v34, 1))
            goto LABEL_105;
          v27 = MEMORY[0x2426962C8](v34 + 1, a2) == 0;
        }
        result = swift_bridgeObjectRelease();
        if (v27)
        {
          v36 = 0;
          if (__OFSUB__(v34, v35))
            goto LABEL_102;
          if (v34 - v35 >= a1)
          {
            if (__OFSUB__(v34, v35))
              goto LABEL_103;
            if (__OFADD__(v34 - v35, 1))
              goto LABEL_104;
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
            result = Array.append(_:)();
          }
        }
        else
        {
          v26 = MEMORY[0x2426962C8](v34, a2) != 1;
          result = swift_bridgeObjectRetain();
          if (v26)
          {
            v25 = 0;
          }
          else
          {
            if (__OFADD__(v34, 1))
              goto LABEL_101;
            v25 = MEMORY[0x2426962C8](v34 + 1, a2) == 1;
          }
          result = swift_bridgeObjectRelease();
          if (v25)
          {
            v36 = 1;
          }
          else
          {
            v24 = MEMORY[0x2426962C8](v34, a2) != 0;
            result = swift_bridgeObjectRetain();
            if (v24)
            {
              v23 = 0;
            }
            else
            {
              if (__OFADD__(v34, 1))
                goto LABEL_100;
              v23 = MEMORY[0x2426962C8](v34 + 1, a2) == 0;
            }
            result = swift_bridgeObjectRelease();
            if (v23)
              v36 = 0;
          }
        }
      }
      if (__OFSUB__(v33, 2))
        goto LABEL_95;
      if (v34 == v33 - 2 && (v36 & 1) == 1)
      {
        v21 = v33 - 1;
        if (__OFSUB__(v33, 1))
          goto LABEL_98;
        if (__OFSUB__(v21, v35))
          goto LABEL_99;
        v20 = v21 - v35 >= a1;
      }
      else
      {
        v20 = 0;
      }
      if (v20)
      {
        if (__OFSUB__(v33, 1))
          goto LABEL_96;
        if (__OFSUB__(v33, v35))
          goto LABEL_97;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
        Array.append(_:)();
      }
    }
  }
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  __break(1u);
LABEL_100:
  __break(1u);
LABEL_101:
  __break(1u);
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
  return result;
}

uint64_t getReducedData(flatList:rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Double v13;
  Swift::Double v14;
  Swift::Double v15;
  Swift::Double v16;
  Swift::Double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t nums;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
  v34 = _allocateUninitializedArray<A>(_:)();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (start: Int, end: Int, count: Int));
  if (MEMORY[0x242696268](a1, v1) > 0)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
    lazy protocol witness table accessor for type [(start: Int, end: Int, count: Int)] and conformance [A]();
    Collection<>.makeIterator()();
    while (1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[(start: Int, end: Int, count: Int)]>);
      IndexingIterator.next()();
      if ((v33 & 1) != 0)
        break;
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClosedRange<Int>);
      lazy protocol witness table accessor for type [Double] and conformance [A]();
      lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Double>);
      lazy protocol witness table accessor for type ArraySlice<Double> and conformance ArraySlice<A>();
      nums = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
      lazy protocol witness table accessor for type [Int] and conformance [A]();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Int>);
      lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>();
      v21 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      v20 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      v19 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      v18 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      lazy protocol witness table accessor for type [String] and conformance [A]();
      MutableCollection.subscript.getter();
      outlined destroy of [String]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<String>);
      lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>();
      Array.init<A>(_:)();
      v13 = getMedian(nums:)((Swift::OpaquePointer)nums);
      v14 = getMedian(nums:)((Swift::OpaquePointer)v21);
      v15 = getMedian(nums:)((Swift::OpaquePointer)v20);
      v16 = getMedian(nums:)((Swift::OpaquePointer)v19);
      v17 = getMedian(nums:)((Swift::OpaquePointer)v18);
      lazy protocol witness table accessor for type [Int] and conformance [A]();
      Sequence<>.min()();
      if ((v30 & 1) != 0)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      else
      {
        v12 = v29;
      }
      Sequence<>.min()();
      if ((v28 & 1) != 0)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      else
      {
        v11 = v27;
      }
      lazy protocol witness table accessor for type [String] and conformance [A]();
      Sequence<>.min()();
      if (v26)
      {
        v9 = v25;
        v10 = v26;
      }
      else
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      v24 = MEMORY[0x242696280](v21);
      specialized _allocateUninitializedArray<A>(_:)();
      v8 = v2;
      v3 = MEMORY[0x24BEE13C8];
      v4 = MEMORY[0x24BEE13C8];
      v2[3] = MEMORY[0x24BEE13C8];
      *(Swift::Double *)v2 = v13;
      v2[7] = v4;
      *((Swift::Double *)v2 + 4) = v14;
      v2[11] = v3;
      *((Swift::Double *)v2 + 8) = v15;
      v2[15] = v3;
      *((Swift::Double *)v2 + 12) = v16;
      v2[19] = v3;
      *((Swift::Double *)v2 + 16) = v17;
      v5 = MEMORY[0x24BEE1768];
      v7 = MEMORY[0x24BEE1768];
      v2[23] = MEMORY[0x24BEE1768];
      v2[20] = v12;
      v2[27] = v5;
      v2[24] = v11;
      swift_bridgeObjectRetain();
      v8[31] = MEMORY[0x24BEE0D00];
      v8[28] = v9;
      v8[29] = v10;
      v8[35] = v7;
      v8[32] = v24;
      _finalizeUninitializedArray<A>(_:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[Any]]);
      Array.append(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    outlined destroy of IndexingIterator<[(start: Int, end: Int, count: Int)]>();
  }
  swift_bridgeObjectRetain();
  outlined destroy of [[Any]]();
  return v34;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [[Any]]()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Double]()
{
  swift_bridgeObjectRelease();
}

unint64_t lazy protocol witness table accessor for type ArraySlice<Double> and conformance ArraySlice<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<Double>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE2180], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>);
    return v1;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12B8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [String]()
{
  swift_bridgeObjectRelease();
}

unint64_t lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<String>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE2180], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>);
    return v1;
  }
  return v3;
}

uint64_t preprocessData(rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)()
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = getSteadyList(windowSize:rssiThreshold:rssiList:)(7);
  v2 = getFlatList(durationThreshold:steadyList:)(3, v3);
  v1 = getReducedData(flatList:rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Bool __swiftcall checkValidInterfaceType(data:)(Swift::OpaquePointer data)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v9[4];
  char v10;
  void *rawValue;

  rawValue = data._rawValue;
  v10 = 0;
  kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x2426960C4](v9);
  outlined destroy of String();
  if (v9[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v6 = v8;
      v7 = 0;
    }
    else
    {
      v6 = 0;
      v7 = 1;
    }
    v4 = v6;
    v5 = v7;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v9);
    v4 = 0;
    v5 = 1;
  }
  if ((v5 & 1) != 0)
    return 0;
  if (v4 != *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
    && v4 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
    return 0;
  }
  v10 = 1;
  return 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String()
{
  swift_bridgeObjectRelease();
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

Swift::Bool __swiftcall checkValidThroughputTrue(data:)(Swift::OpaquePointer data)
{
  double v3;
  char v4;
  double v5;
  char v6;
  double v7;
  _QWORD v8[4];
  char v9;
  void *rawValue;

  rawValue = data._rawValue;
  v9 = 0;
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x2426960C4](v8);
  outlined destroy of String();
  if (v8[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = v7;
      v6 = 0;
    }
    else
    {
      v5 = 0.0;
      v6 = 1;
    }
    v3 = v5;
    v4 = v6;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8);
    v3 = 0.0;
    v4 = 1;
  }
  if ((v4 & 1) != 0)
    return 0;
  if (v3 <= 0.0)
    return 0;
  v9 = 1;
  return 1;
}

Swift::Bool __swiftcall validateAppName(text:)(Swift::String text)
{
  NSRegularExpression *v1;
  void *v2;
  uint64_t v3;
  Swift::Bool result;
  BOOL v5;
  id v6;
  id v7;
  Swift::String pattern;
  void *v10;
  id v11[2];
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSRegularExpressionOptions v20;
  Swift::String v21;

  v19 = 0;
  v17 = 0;
  v18 = 0;
  v13 = 0;
  v21 = text;
  type metadata accessor for NSRegularExpression();
  pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Za-z0-9./]{1,155}$", 0x16uLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  v10 = v2;
  if (v3)
  {
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v19 = v2;
    v17 = 0;
    v18 = String.count.getter();
    swift_bridgeObjectRetain();
    v6 = (id)MEMORY[0x242696118](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    v14 = 0;
    v15 = v18;
    v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

unint64_t type metadata accessor for NSRegularExpression()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSRegularExpression;
  if (!lazy cache variable for type metadata for NSRegularExpression)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpression);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for NSRegularExpressionOptions()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = lazy cache variable for type metadata for NSRegularExpressionOptions;
  if (!lazy cache variable for type metadata for NSRegularExpressionOptions)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpressionOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSRegularExpression.__allocating_init(pattern:options:)(NSRegularExpression *__return_ptr retstr, Swift::String pattern, NSRegularExpressionOptions options)
{
  id v3;
  void *object;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = pattern._countAndFlagsBits;
  object = pattern._object;
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  @nonobjc NSRegularExpression.init(pattern:options:)(countAndFlagsBits, (uint64_t)object, options);
}

uint64_t type metadata accessor for NSMatchingOptions()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = lazy cache variable for type metadata for NSMatchingOptions;
  if (!lazy cache variable for type metadata for NSMatchingOptions)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSMatchingOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

unint64_t type metadata accessor for NSTextCheckingResult()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSTextCheckingResult;
  if (!lazy cache variable for type metadata for NSTextCheckingResult)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSTextCheckingResult);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A];
  if (!lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A]);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [NSTextCheckingResult]()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of NSTextCheckingResult?(id *a1)
{

}

Swift::Bool __swiftcall validateSessionID(text:)(Swift::String text)
{
  NSRegularExpression *v1;
  void *v2;
  uint64_t v3;
  Swift::Bool result;
  BOOL v5;
  id v6;
  id v7;
  Swift::String pattern;
  void *v10;
  id v11[2];
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSRegularExpressionOptions v20;
  Swift::String v21;

  v19 = 0;
  v17 = 0;
  v18 = 0;
  v13 = 0;
  v21 = text;
  type metadata accessor for NSRegularExpression();
  pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}$", 0x3EuLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  v10 = v2;
  if (v3)
  {
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v19 = v2;
    v17 = 0;
    v18 = String.count.getter();
    swift_bridgeObjectRetain();
    v6 = (id)MEMORY[0x242696118](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    v14 = 0;
    v15 = v18;
    v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

Swift::Bool __swiftcall validateSSID(text:)(Swift::String text)
{
  Swift::String *v1;
  Swift::String v2;
  char v3;
  Swift::String v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  Swift::String *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  int v23;
  _BOOL4 v24;
  Swift::Int v25;
  _BOOL4 v26;
  uint64_t countAndFlagsBits;
  uint64_t v28;
  Swift::Int v29;
  void *object;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  Swift::String v35;

  countAndFlagsBits = text._countAndFlagsBits;
  object = text._object;
  v33 = 0;
  v28 = 0;
  v35 = text;
  v34 = 0;
  v29 = String.count.getter();
  v31 = *maxSSIDLength.unsafeMutableAddressor() >= v29;
  swift_bridgeObjectRetain();
  if (v31)
  {
    v25 = String.count.getter();
    v26 = v25 < *minSSIDLength.unsafeMutableAddressor();
  }
  else
  {
    v26 = 1;
  }
  v24 = v26;
  swift_bridgeObjectRelease();
  if (v26)
  {
    v23 = 0;
  }
  else
  {
    v16 = MEMORY[0x24BEE0D00];
    v15 = _allocateUninitializedArray<A>(_:)();
    v14 = v1;
    v12 = 6;
    v13 = 1;
    *v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("select", 6uLL, 1);
    v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("delete", 6uLL, 1);
    v3 = v13;
    v14[1] = v2;
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop table", 0xAuLL, v3 & 1);
    v5 = v15;
    v14[2] = v4;
    _finalizeUninitializedArray<A>(_:)();
    v17 = v5;
    v33 = v5;
    v32 = v5;
    swift_bridgeObjectRetain();
    v18 = &v9;
    v19 = 32;
    MEMORY[0x24BDAC7A8]();
    v6 = (char *)&v9 - v19;
    v20 = v6;
    *((_QWORD *)v6 + 2) = countAndFlagsBits;
    *((_QWORD *)v6 + 3) = v7;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A]();
    v22 = Sequence.contains(where:)();
    v10 = v22;
    swift_bridgeObjectRelease();
    v11 = v10 ^ 1;
    v34 = (v10 ^ 1) & 1;
    swift_bridgeObjectRelease();
    v23 = v11;
  }
  return v23 & 1;
}

uint64_t closure #1 in validateSSID(text:)()
{
  char v1;

  String.lowercased()();
  lazy protocol witness table accessor for type String and conformance String();
  lazy protocol witness table accessor for type String and conformance String();
  v1 = BidirectionalCollection<>.starts<A>(with:)();
  outlined destroy of String();
  return v1 & 1;
}

uint64_t partial apply for closure #1 in validateSSID(text:)()
{
  return closure #1 in validateSSID(text:)() & 1;
}

Swift::Bool __swiftcall checkValidTextInputs(data:)(Swift::OpaquePointer data)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  Swift::Int v8;
  Swift::String v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE **v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint32_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  NSObject *v85;
  int v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE **v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t *v99;
  uint32_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  NSObject *v112;
  int v113;
  uint64_t v114;
  void *v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE **v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t *v128;
  uint32_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  NSObject *v141;
  int v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  Swift::String v153;
  Swift::String *v154;
  uint64_t v156;
  int v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  int v161;
  Swift::String v162;
  Swift::String *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  Swift::String v174;
  Swift::String *v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  char *v190;
  unint64_t v191;
  char *v192;
  unint64_t v193;
  char *v194;
  Swift::String v195;
  void *rawValue;
  Swift::String *v197;
  uint64_t v198;
  void *v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  _QWORD v203[4];
  uint64_t (*v204)(uint64_t, uint64_t, uint64_t);
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  _BYTE *v208;
  uint64_t v209;
  uint32_t v210;
  uint64_t v211;
  void *v212;
  Swift::String v213;
  _QWORD v214[4];
  uint64_t v215;
  char v216;
  Swift::Int v217;
  char v218;
  Swift::String v219;
  _QWORD v220[4];
  uint64_t (*v221)(uint64_t, uint64_t, uint64_t);
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _BYTE *v225;
  uint64_t v226;
  uint32_t v227;
  uint64_t v228;
  void *v229;
  Swift::String v230;
  _QWORD v231[4];
  uint64_t (*v232)(uint64_t, uint64_t, uint64_t);
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  _BYTE *v236;
  uint64_t v237;
  uint32_t v238;
  uint64_t v239;
  void *v240;
  Swift::String v241;
  _QWORD v242[4];
  char v243;
  uint64_t v244;

  rawValue = data._rawValue;
  v244 = 0;
  v243 = 0;
  v239 = 0;
  v240 = 0;
  v186 = 0;
  v228 = 0;
  v229 = 0;
  v211 = 0;
  v212 = 0;
  v187 = type metadata accessor for Logger();
  v188 = *(_QWORD *)(v187 - 8);
  v189 = (*(_QWORD *)(v188 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](rawValue);
  v190 = (char *)&v59 - v189;
  v191 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v1);
  v192 = (char *)&v59 - v191;
  v193 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v194 = (char *)&v59 - v193;
  v244 = v5;
  v243 = 0;
  v195 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v197 = &v241;
  v241 = v195;
  MEMORY[0x2426960C4](v242);
  outlined destroy of String();
  if (v242[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v184 = v198;
      v185 = v199;
    }
    else
    {
      v184 = 0;
      v185 = 0;
    }
    v182 = v184;
    v183 = v185;
  }
  else
  {
    v60 = 0;
    outlined destroy of Any?((uint64_t)v242);
    v182 = (uint64_t)v60;
    v183 = v60;
  }
  v180 = v183;
  v181 = v182;
  if (!v183)
  {
    v116 = 0;
    return v116 & 1;
  }
  v178 = v181;
  v179 = v180;
  v6._countAndFlagsBits = v181;
  v6._object = v180;
  v176 = v180;
  v177 = v181;
  v239 = v181;
  v240 = v180;
  if (validateAppName(text:)(v6))
  {
    v174 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v175 = &v230;
    v230 = v174;
    MEMORY[0x2426960C4](v231);
    outlined destroy of String();
    if (v231[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v172 = v200;
        v173 = v201;
      }
      else
      {
        v172 = 0;
        v173 = 0;
      }
      v170 = v172;
      v171 = v173;
    }
    else
    {
      v87 = 0;
      outlined destroy of Any?((uint64_t)v231);
      v170 = (uint64_t)v87;
      v171 = v87;
    }
    v168 = v171;
    v169 = v170;
    if (!v171)
    {
      swift_bridgeObjectRelease();
      v116 = 0;
      return v116 & 1;
    }
    v166 = v169;
    v167 = v168;
    v7._countAndFlagsBits = v169;
    v7._object = v168;
    v164 = v168;
    v165 = v169;
    v228 = v169;
    v229 = v168;
    if (validateSessionID(text:)(v7))
    {
      v162 = *kMediaML_interfaceType.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v163 = &v219;
      v219 = v162;
      MEMORY[0x2426960C4](v220);
      outlined destroy of String();
      if (v220[3])
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v160 = v202;
          v161 = 0;
        }
        else
        {
          v160 = 0;
          v161 = 1;
        }
        v158 = v160;
        v159 = v161;
      }
      else
      {
        v114 = 0;
        outlined destroy of Any?((uint64_t)v220);
        v158 = v114;
        v159 = 1;
      }
      v157 = v159;
      v156 = v158;
      v8 = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
      v215 = v156;
      v216 = v157 & 1;
      v217 = v8;
      v218 = 0;
      if (!((v157 & 1) == 0
          && (outlined init with copy of Int?((uint64_t)&v215, (uint64_t)v203), (v218 & 1) == 0)
          && v203[0] == v217))
        goto LABEL_45;
      v153 = *kMediaML_ssid.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v154 = &v213;
      v213 = v153;
      MEMORY[0x2426960C4](v214);
      outlined destroy of String();
      if (v214[3])
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v151 = v203[2];
          v152 = (void *)v203[3];
        }
        else
        {
          v151 = 0;
          v152 = 0;
        }
        v149 = v151;
        v150 = v152;
      }
      else
      {
        v115 = 0;
        outlined destroy of Any?((uint64_t)v214);
        v149 = (uint64_t)v115;
        v150 = v115;
      }
      v147 = v150;
      v148 = v149;
      if (v150)
      {
        v145 = v148;
        v146 = v147;
        v9._countAndFlagsBits = v148;
        v9._object = v147;
        v143 = v147;
        v144 = v148;
        v211 = v148;
        v212 = v147;
        if (validateSSID(text:)(v9))
        {
          swift_bridgeObjectRelease();
LABEL_45:
          v243 = 1;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v116 = 1;
          return v116 & 1;
        }
        v10 = v194;
        v11 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v188 + 16))(v10, v11, v187);
        swift_bridgeObjectRetain();
        v131 = 32;
        v132 = 7;
        v12 = swift_allocObject();
        v13 = v143;
        v133 = v12;
        *(_QWORD *)(v12 + 16) = v144;
        *(_QWORD *)(v12 + 24) = v13;
        v141 = Logger.logObject.getter();
        v142 = static os_log_type_t.error.getter();
        v128 = &v209;
        v209 = 12;
        v126 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v127 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        v129 = v210;
        v130 = 17;
        v135 = swift_allocObject();
        *(_BYTE *)(v135 + 16) = 32;
        v136 = swift_allocObject();
        *(_BYTE *)(v136 + 16) = 8;
        v14 = swift_allocObject();
        v15 = v133;
        v134 = v14;
        *(_QWORD *)(v14 + 16) = partial apply for implicit closure #3 in checkValidTextInputs(data:);
        *(_QWORD *)(v14 + 24) = v15;
        v16 = swift_allocObject();
        v17 = v134;
        v138 = v16;
        *(_QWORD *)(v16 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
        *(_QWORD *)(v16 + 24) = v17;
        v140 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v137 = _allocateUninitializedArray<A>(_:)();
        v139 = v18;
        swift_retain();
        v19 = v135;
        v20 = v139;
        *v139 = closure #1 in OSLogArguments.append(_:)partial apply;
        v20[1] = v19;
        swift_retain();
        v21 = v136;
        v22 = v139;
        v139[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v22[3] = v21;
        swift_retain();
        v23 = v138;
        v24 = v139;
        v139[4] = closure #1 in OSLogArguments.append(_:)partial apply;
        v24[5] = v23;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v141, (os_log_type_t)v142))
        {
          v25 = v186;
          v119 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          v118 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v120 = createStorage<A>(capacity:type:)(0);
          v121 = createStorage<A>(capacity:type:)(1);
          v122 = &v208;
          v208 = v119;
          v123 = &v207;
          v207 = v120;
          v124 = &v206;
          v206 = v121;
          serialize(_:at:)(2, &v208);
          serialize(_:at:)(1, v122);
          v204 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v205 = v135;
          closure #1 in osLogInternal(_:log:type:)(&v204, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124);
          v125 = v25;
          if (v25)
          {
            __break(1u);
          }
          else
          {
            v204 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v205 = v136;
            closure #1 in osLogInternal(_:log:type:)(&v204, (uint64_t)&v208, (uint64_t)&v207, (uint64_t)&v206);
            v117 = 0;
            v204 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v205 = v138;
            closure #1 in osLogInternal(_:log:type:)(&v204, (uint64_t)&v208, (uint64_t)&v207, (uint64_t)&v206);
            _os_log_impl(&dword_241527000, v141, (os_log_type_t)v142, "ssid in data directory failed validation: %s", v119, v129);
            destroyStorage<A>(_:count:)(v120, 0, v118);
            destroyStorage<A>(_:count:)(v121, 1, MEMORY[0x24BEE4AD8] + 8);
            MEMORY[0x242696394](v119, MEMORY[0x24BEE4260]);
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v188 + 8))(v194, v187);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v116 = 0;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v116 = 0;
      }
    }
    else
    {
      v26 = v192;
      v27 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v188 + 16))(v26, v27, v187);
      swift_bridgeObjectRetain();
      v102 = 32;
      v103 = 7;
      v28 = swift_allocObject();
      v29 = v164;
      v104 = v28;
      *(_QWORD *)(v28 + 16) = v165;
      *(_QWORD *)(v28 + 24) = v29;
      v112 = Logger.logObject.getter();
      v113 = static os_log_type_t.error.getter();
      v99 = &v226;
      v226 = 12;
      v97 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v98 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v100 = v227;
      v101 = 17;
      v106 = swift_allocObject();
      *(_BYTE *)(v106 + 16) = 32;
      v107 = swift_allocObject();
      *(_BYTE *)(v107 + 16) = 8;
      v30 = swift_allocObject();
      v31 = v104;
      v105 = v30;
      *(_QWORD *)(v30 + 16) = partial apply for implicit closure #2 in checkValidTextInputs(data:);
      *(_QWORD *)(v30 + 24) = v31;
      v32 = swift_allocObject();
      v33 = v105;
      v109 = v32;
      *(_QWORD *)(v32 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
      *(_QWORD *)(v32 + 24) = v33;
      v111 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v108 = _allocateUninitializedArray<A>(_:)();
      v110 = v34;
      swift_retain();
      v35 = v106;
      v36 = v110;
      *v110 = closure #1 in OSLogArguments.append(_:)partial apply;
      v36[1] = v35;
      swift_retain();
      v37 = v107;
      v38 = v110;
      v110[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v38[3] = v37;
      swift_retain();
      v39 = v109;
      v40 = v110;
      v110[4] = closure #1 in OSLogArguments.append(_:)partial apply;
      v40[5] = v39;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v112, (os_log_type_t)v113))
      {
        v41 = v186;
        v90 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v91 = createStorage<A>(capacity:type:)(0);
        v92 = createStorage<A>(capacity:type:)(1);
        v93 = &v225;
        v225 = v90;
        v94 = &v224;
        v224 = v91;
        v95 = &v223;
        v223 = v92;
        serialize(_:at:)(2, &v225);
        serialize(_:at:)(1, v93);
        v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v222 = v106;
        closure #1 in osLogInternal(_:log:type:)(&v221, (uint64_t)v93, (uint64_t)v94, (uint64_t)v95);
        v96 = v41;
        if (v41)
        {
          __break(1u);
        }
        else
        {
          v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v222 = v107;
          closure #1 in osLogInternal(_:log:type:)(&v221, (uint64_t)&v225, (uint64_t)&v224, (uint64_t)&v223);
          v88 = 0;
          v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v222 = v109;
          closure #1 in osLogInternal(_:log:type:)(&v221, (uint64_t)&v225, (uint64_t)&v224, (uint64_t)&v223);
          _os_log_impl(&dword_241527000, v112, (os_log_type_t)v113, "sessionID in data directory failed validation: %s", v90, v100);
          destroyStorage<A>(_:count:)(v91, 0, v89);
          destroyStorage<A>(_:count:)(v92, 1, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x242696394](v90, MEMORY[0x24BEE4260]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v188 + 8))(v192, v187);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v116 = 0;
    }
  }
  else
  {
    v42 = v190;
    v43 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v188 + 16))(v42, v43, v187);
    swift_bridgeObjectRetain();
    v75 = 32;
    v76 = 7;
    v44 = swift_allocObject();
    v45 = v176;
    v77 = v44;
    *(_QWORD *)(v44 + 16) = v177;
    *(_QWORD *)(v44 + 24) = v45;
    v85 = Logger.logObject.getter();
    v86 = static os_log_type_t.error.getter();
    v72 = &v237;
    v237 = 12;
    v70 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v71 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v73 = v238;
    v74 = 17;
    v79 = swift_allocObject();
    *(_BYTE *)(v79 + 16) = 32;
    v80 = swift_allocObject();
    *(_BYTE *)(v80 + 16) = 8;
    v46 = swift_allocObject();
    v47 = v77;
    v78 = v46;
    *(_QWORD *)(v46 + 16) = partial apply for implicit closure #1 in checkValidTextInputs(data:);
    *(_QWORD *)(v46 + 24) = v47;
    v48 = swift_allocObject();
    v49 = v78;
    v82 = v48;
    *(_QWORD *)(v48 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
    *(_QWORD *)(v48 + 24) = v49;
    v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v81 = _allocateUninitializedArray<A>(_:)();
    v83 = v50;
    swift_retain();
    v51 = v79;
    v52 = v83;
    *v83 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    v52[1] = v51;
    swift_retain();
    v53 = v80;
    v54 = v83;
    v83[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v54[3] = v53;
    swift_retain();
    v55 = v82;
    v56 = v83;
    v83[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v56[5] = v55;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v85, (os_log_type_t)v86))
    {
      v57 = v186;
      v63 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v64 = createStorage<A>(capacity:type:)(0);
      v65 = createStorage<A>(capacity:type:)(1);
      v66 = &v236;
      v236 = v63;
      v67 = &v235;
      v235 = v64;
      v68 = &v234;
      v234 = v65;
      serialize(_:at:)(2, &v236);
      serialize(_:at:)(1, v66);
      v232 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
      v233 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v232, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68);
      v69 = v57;
      if (v57)
      {
        __break(1u);
      }
      else
      {
        v232 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v233 = v80;
        closure #1 in osLogInternal(_:log:type:)(&v232, (uint64_t)&v236, (uint64_t)&v235, (uint64_t)&v234);
        v61 = 0;
        v232 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v233 = v82;
        closure #1 in osLogInternal(_:log:type:)(&v232, (uint64_t)&v236, (uint64_t)&v235, (uint64_t)&v234);
        _os_log_impl(&dword_241527000, v85, (os_log_type_t)v86, "AppName in data directory failed validation: %s", v63, v73);
        destroyStorage<A>(_:count:)(v64, 0, v62);
        destroyStorage<A>(_:count:)(v65, 1, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696394](v63, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v188 + 8))(v190, v187);
    swift_bridgeObjectRelease();
    v116 = 0;
  }
  return v116 & 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in checkValidTextInputs(data:)()
{
  swift_bridgeObjectRetain();
}

uint64_t sub_241530CDC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in checkValidTextInputs(data:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #1 in checkValidTextInputs(data:)();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in checkValidTextInputs(data:)()
{
  swift_bridgeObjectRetain();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #3 in checkValidTextInputs(data:)()
{
  swift_bridgeObjectRetain();
}

Swift::Bool __swiftcall checkValidNumericInputRange(data:)(Swift::OpaquePointer data)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  _QWORD *v142;
  uint64_t v143;
  Swift::Int v145;
  Swift::Int v146;
  Swift::Int v147;
  Swift::Int v148;
  Swift::Int v149;
  Swift::Int v150;
  double v151;
  double v152;
  Swift::Int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint8_t *v158;
  uint64_t v159;
  uint64_t v160;
  _BYTE **v161;
  uint64_t *v162;
  uint64_t *v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t *v167;
  uint32_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  NSObject *v180;
  int v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint8_t *v186;
  uint64_t v187;
  uint64_t v188;
  _BYTE **v189;
  uint64_t *v190;
  uint64_t *v191;
  uint64_t v192;
  unint64_t v193;
  unint64_t v194;
  uint64_t *v195;
  uint32_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  _QWORD *v206;
  uint64_t v207;
  NSObject *v208;
  int v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint8_t *v214;
  uint64_t v215;
  uint64_t v216;
  _BYTE **v217;
  uint64_t *v218;
  uint64_t *v219;
  uint64_t v220;
  unint64_t v221;
  unint64_t v222;
  uint64_t *v223;
  uint32_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  _QWORD *v234;
  uint64_t v235;
  NSObject *v236;
  int v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint8_t *v242;
  uint64_t v243;
  uint64_t v244;
  _BYTE **v245;
  uint64_t *v246;
  uint64_t *v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  uint64_t *v251;
  uint32_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  _QWORD *v262;
  uint64_t v263;
  NSObject *v264;
  int v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint8_t *v270;
  uint64_t v271;
  uint64_t v272;
  _BYTE **v273;
  uint64_t *v274;
  uint64_t *v275;
  uint64_t v276;
  unint64_t v277;
  unint64_t v278;
  uint64_t *v279;
  uint32_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  _QWORD *v290;
  uint64_t v291;
  NSObject *v292;
  int v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint8_t *v298;
  uint64_t v299;
  uint64_t v300;
  _BYTE **v301;
  uint64_t *v302;
  uint64_t *v303;
  uint64_t v304;
  unint64_t v305;
  unint64_t v306;
  uint64_t *v307;
  uint32_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  _QWORD *v318;
  uint64_t v319;
  NSObject *v320;
  int v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint8_t *v326;
  uint64_t v327;
  uint64_t v328;
  _BYTE **v329;
  uint64_t *v330;
  uint64_t *v331;
  uint64_t v332;
  unint64_t v333;
  unint64_t v334;
  uint64_t *v335;
  uint32_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  _QWORD *v346;
  uint64_t v347;
  NSObject *v348;
  int v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint8_t *v354;
  uint64_t v355;
  uint64_t v356;
  _BYTE **v357;
  uint64_t *v358;
  uint64_t *v359;
  uint64_t v360;
  unint64_t v361;
  unint64_t v362;
  uint64_t *v363;
  uint32_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  _QWORD *v374;
  uint64_t v375;
  NSObject *v376;
  int v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint8_t *v382;
  uint64_t v383;
  uint64_t v384;
  _BYTE **v385;
  uint64_t *v386;
  uint64_t *v387;
  uint64_t v388;
  unint64_t v389;
  unint64_t v390;
  uint64_t *v391;
  uint32_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  _QWORD *v402;
  uint64_t v403;
  NSObject *v404;
  int v405;
  int v406;
  Swift::Int v416;
  Swift::Int v417;
  int v418;
  Swift::Int v419;
  int v420;
  Swift::Double v421;
  Swift::String v422;
  Swift::String *v423;
  double v424;
  int v425;
  double v426;
  int v427;
  Swift::Double v428;
  Swift::String v429;
  Swift::String *v430;
  double v431;
  int v432;
  double v433;
  int v434;
  Swift::Int v435;
  Swift::String v436;
  Swift::String *v437;
  Swift::Int v438;
  int v439;
  Swift::Int v440;
  int v441;
  Swift::Int v442;
  Swift::String v443;
  Swift::String *v444;
  Swift::Int v445;
  int v446;
  Swift::Int v447;
  int v448;
  Swift::Int v449;
  Swift::String v450;
  Swift::String *v451;
  Swift::Int v452;
  int v453;
  Swift::Int v454;
  int v455;
  Swift::Int v456;
  Swift::String v457;
  Swift::String *v458;
  Swift::Int v459;
  int v460;
  Swift::Int v461;
  int v462;
  Swift::Int v463;
  Swift::String v464;
  Swift::String *v465;
  Swift::Int v466;
  int v467;
  Swift::Int v468;
  int v469;
  Swift::Int v470;
  Swift::String v471;
  Swift::String *v472;
  Swift::Int v473;
  int v474;
  Swift::Int v475;
  int v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  unint64_t v481;
  char *v482;
  unint64_t v483;
  char *v484;
  unint64_t v485;
  char *v486;
  unint64_t v487;
  char *v488;
  unint64_t v489;
  char *v490;
  unint64_t v491;
  char *v492;
  unint64_t v493;
  char *v494;
  unint64_t v495;
  char *v496;
  unint64_t v497;
  char *v498;
  Swift::String v499;
  uint64_t v500;
  Swift::String *v501;
  Swift::Int v502;
  Swift::Int v503;
  Swift::Int v504;
  Swift::Int v505;
  Swift::Int v506;
  Swift::Int v507;
  double v508;
  double v509;
  Swift::Int v510;
  uint64_t (*v511)(uint64_t, uint64_t, uint64_t);
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  _BYTE *v515;
  uint64_t v516;
  uint32_t v517;
  uint64_t (*v518)(uint64_t, uint64_t, uint64_t);
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  _BYTE *v522;
  uint64_t v523;
  uint32_t v524;
  uint64_t (*v525)(uint64_t, uint64_t, uint64_t);
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  _BYTE *v529;
  uint64_t v530;
  uint32_t v531;
  uint64_t (*v532)(uint64_t, uint64_t, uint64_t);
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  _BYTE *v536;
  uint64_t v537;
  uint32_t v538;
  uint64_t (*v539)(uint64_t, uint64_t, uint64_t);
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  _BYTE *v543;
  uint64_t v544;
  uint32_t v545;
  uint64_t (*v546)(uint64_t, uint64_t, uint64_t);
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  _BYTE *v550;
  uint64_t v551;
  uint32_t v552;
  uint64_t (*v553)(uint64_t, uint64_t, uint64_t);
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  _BYTE *v557;
  uint64_t v558;
  uint32_t v559;
  uint64_t (*v560)(uint64_t, uint64_t, uint64_t);
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  _BYTE *v564;
  uint64_t v565;
  uint32_t v566;
  uint64_t (*v567)(uint64_t, uint64_t, uint64_t);
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  _BYTE *v571;
  uint64_t v572;
  uint32_t v573;
  Swift::Int v574;
  Swift::Int v575;
  char v576;
  Swift::String v577;
  _QWORD v578[4];
  Swift::Int v579;
  double v580;
  double v581;
  char v582;
  Swift::String v583;
  _QWORD v584[4];
  double v585;
  double v586;
  double v587;
  char v588;
  Swift::String v589;
  _QWORD v590[4];
  double v591;
  Swift::Int v592;
  Swift::Int v593;
  char v594;
  Swift::String v595;
  _QWORD v596[4];
  Swift::Int v597;
  Swift::Int v598;
  Swift::Int v599;
  char v600;
  Swift::String v601;
  _QWORD v602[4];
  Swift::Int v603;
  Swift::Int v604;
  Swift::Int v605;
  char v606;
  Swift::String v607;
  _QWORD v608[4];
  Swift::Int v609;
  Swift::Int v610;
  Swift::Int v611;
  char v612;
  Swift::String v613;
  _QWORD v614[4];
  Swift::Int v615;
  Swift::Int v616;
  Swift::Int v617;
  char v618;
  Swift::String v619;
  _QWORD v620[4];
  Swift::Int v621;
  Swift::Int v622;
  Swift::Int v623;
  char v624;
  Swift::String v625;
  _QWORD v626[4];
  Swift::Int v627;
  char v628;
  uint64_t v629;

  v500 = MEMORY[0x24BDAC7A8](data._rawValue);
  v629 = 0;
  v628 = 0;
  v622 = 0;
  v616 = 0;
  v610 = 0;
  v604 = 0;
  v598 = 0;
  v592 = 0;
  v586 = 0.0;
  v580 = 0.0;
  v574 = 0;
  v477 = 0;
  v478 = type metadata accessor for Logger();
  v479 = *(_QWORD *)(v478 - 8);
  v480 = *(_QWORD *)(v479 + 64);
  v481 = (v480 + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](v500);
  v482 = (char *)&v145 - v481;
  v483 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v1);
  v484 = (char *)&v145 - v483;
  v485 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v486 = (char *)&v145 - v485;
  v487 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v488 = (char *)&v145 - v487;
  v489 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v490 = (char *)&v145 - v489;
  v491 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v492 = (char *)&v145 - v491;
  v493 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v494 = (char *)&v145 - v493;
  v495 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v496 = (char *)&v145 - v495;
  v497 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v498 = (char *)&v145 - v497;
  v629 = v17;
  v628 = 0;
  v499 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v501 = &v625;
  v625 = v499;
  MEMORY[0x2426960C4](v626);
  outlined destroy of String();
  if (v626[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v475 = v502;
      v476 = 0;
    }
    else
    {
      v475 = 0;
      v476 = 1;
    }
    v473 = v475;
    v474 = v476;
  }
  else
  {
    v145 = 0;
    outlined destroy of Any?((uint64_t)v626);
    v473 = v145;
    v474 = 1;
  }
  v623 = v473;
  v624 = v474 & 1;
  if ((v474 & 1) != 0)
    v627 = 0;
  else
    v627 = v623;
  v470 = v627;
  v622 = v627;
  v471 = *kMediaML_rsrp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v472 = &v619;
  v619 = v471;
  MEMORY[0x2426960C4](v620);
  outlined destroy of String();
  if (v620[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v468 = v503;
      v469 = 0;
    }
    else
    {
      v468 = 0;
      v469 = 1;
    }
    v466 = v468;
    v467 = v469;
  }
  else
  {
    v146 = 0;
    outlined destroy of Any?((uint64_t)v620);
    v466 = v146;
    v467 = 1;
  }
  v617 = v466;
  v618 = v467 & 1;
  if ((v467 & 1) != 0)
    v621 = 0;
  else
    v621 = v617;
  v463 = v621;
  v616 = v621;
  v464 = *kMediaML_rsrq.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v465 = &v613;
  v613 = v464;
  MEMORY[0x2426960C4](v614);
  outlined destroy of String();
  if (v614[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v461 = v504;
      v462 = 0;
    }
    else
    {
      v461 = 0;
      v462 = 1;
    }
    v459 = v461;
    v460 = v462;
  }
  else
  {
    v147 = 0;
    outlined destroy of Any?((uint64_t)v614);
    v459 = v147;
    v460 = 1;
  }
  v611 = v459;
  v612 = v460 & 1;
  if ((v460 & 1) != 0)
    v615 = 0;
  else
    v615 = v611;
  v456 = v615;
  v610 = v615;
  v457 = *kMediaML_rscp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v458 = &v607;
  v607 = v457;
  MEMORY[0x2426960C4](v608);
  outlined destroy of String();
  if (v608[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v454 = v505;
      v455 = 0;
    }
    else
    {
      v454 = 0;
      v455 = 1;
    }
    v452 = v454;
    v453 = v455;
  }
  else
  {
    v148 = 0;
    outlined destroy of Any?((uint64_t)v608);
    v452 = v148;
    v453 = 1;
  }
  v605 = v452;
  v606 = v453 & 1;
  if ((v453 & 1) != 0)
    v609 = 0;
  else
    v609 = v605;
  v449 = v609;
  v604 = v609;
  v450 = *kMediaML_noise.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v451 = &v601;
  v601 = v450;
  MEMORY[0x2426960C4](v602);
  outlined destroy of String();
  if (v602[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v447 = v506;
      v448 = 0;
    }
    else
    {
      v447 = 0;
      v448 = 1;
    }
    v445 = v447;
    v446 = v448;
  }
  else
  {
    v149 = 0;
    outlined destroy of Any?((uint64_t)v602);
    v445 = v149;
    v446 = 1;
  }
  v599 = v445;
  v600 = v446 & 1;
  if ((v446 & 1) != 0)
    v603 = 0;
  else
    v603 = v599;
  v442 = v603;
  v598 = v603;
  v443 = *kMediaML_bars.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v444 = &v595;
  v595 = v443;
  MEMORY[0x2426960C4](v596);
  outlined destroy of String();
  if (v596[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v440 = v507;
      v441 = 0;
    }
    else
    {
      v440 = 0;
      v441 = 1;
    }
    v438 = v440;
    v439 = v441;
  }
  else
  {
    v150 = 0;
    outlined destroy of Any?((uint64_t)v596);
    v438 = v150;
    v439 = 1;
  }
  v593 = v438;
  v594 = v439 & 1;
  if ((v439 & 1) != 0)
    v597 = 0;
  else
    v597 = v593;
  v435 = v597;
  v592 = v597;
  v436 = *kMediaML_rxRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v437 = &v589;
  v589 = v436;
  MEMORY[0x2426960C4](v590);
  outlined destroy of String();
  if (v590[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v433 = v508;
      v434 = 0;
    }
    else
    {
      v433 = 0.0;
      v434 = 1;
    }
    v431 = v433;
    v432 = v434;
  }
  else
  {
    v151 = 0.0;
    outlined destroy of Any?((uint64_t)v590);
    v431 = v151;
    v432 = 1;
  }
  v587 = v431;
  v588 = v432 & 1;
  if ((v432 & 1) != 0)
    v591 = 0.0;
  else
    v591 = v587;
  v428 = v591;
  v586 = v591;
  v429 = *kMediaML_txRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v430 = &v583;
  v583 = v429;
  MEMORY[0x2426960C4](v584);
  outlined destroy of String();
  if (v584[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v426 = v509;
      v427 = 0;
    }
    else
    {
      v426 = 0.0;
      v427 = 1;
    }
    v424 = v426;
    v425 = v427;
  }
  else
  {
    v152 = 0.0;
    outlined destroy of Any?((uint64_t)v584);
    v424 = v152;
    v425 = 1;
  }
  v581 = v424;
  v582 = v425 & 1;
  if ((v425 & 1) != 0)
    v585 = 0.0;
  else
    v585 = v581;
  v421 = v585;
  v580 = v585;
  v422 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v423 = &v577;
  v577 = v422;
  MEMORY[0x2426960C4](v578);
  outlined destroy of String();
  if (v578[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v419 = v510;
      v420 = 0;
    }
    else
    {
      v419 = 0;
      v420 = 1;
    }
    v417 = v419;
    v418 = v420;
  }
  else
  {
    v153 = 0;
    outlined destroy of Any?((uint64_t)v578);
    v417 = v153;
    v418 = 1;
  }
  v575 = v417;
  v576 = v418 & 1;
  if ((v418 & 1) != 0)
    v579 = 0;
  else
    v579 = v575;
  v416 = v579;
  v574 = v579;
  if (v470 <= 0 && v470 >= *minSignalStrength.unsafeMutableAddressor())
  {
    if (v463 <= 0 && v463 >= *minSignalStrength.unsafeMutableAddressor())
    {
      if (v456 <= 0 && v456 >= *minSignalStrength.unsafeMutableAddressor())
      {
        if (v449 <= 0 && v449 >= *minSignalStrength.unsafeMutableAddressor())
        {
          if (v442 <= 0 && v442 >= *minNoise.unsafeMutableAddressor())
          {
            if (v435 >= 0 && *maxBars.unsafeMutableAddressor() >= v435)
            {
              if (v428 >= 0.0 && v428 <= *maxRxRate.unsafeMutableAddressor())
              {
                if (v421 >= 0.0 && v421 <= *maxTxRate.unsafeMutableAddressor())
                {
                  if (v416 > 0 && *maxThroughput.unsafeMutableAddressor() >= v416)
                  {
                    v628 = 1;
                    v406 = 1;
                  }
                  else
                  {
                    v18 = v498;
                    v19 = logger.unsafeMutableAddressor();
                    (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v18, v19, v478);
                    v395 = 7;
                    v396 = swift_allocObject();
                    *(_QWORD *)(v396 + 16) = v416;
                    v404 = Logger.logObject.getter();
                    v405 = static os_log_type_t.error.getter();
                    v391 = &v516;
                    v516 = 12;
                    v389 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    v390 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    lazy protocol witness table accessor for type Int and conformance Int();
                    UnsignedInteger<>.init<A>(_:)();
                    v392 = v517;
                    v393 = 17;
                    v398 = swift_allocObject();
                    *(_BYTE *)(v398 + 16) = 0;
                    v399 = swift_allocObject();
                    *(_BYTE *)(v399 + 16) = 8;
                    v394 = 32;
                    v20 = swift_allocObject();
                    v21 = v396;
                    v397 = v20;
                    *(_QWORD *)(v20 + 16) = partial apply for implicit closure #27 in checkValidNumericInputRange(data:);
                    *(_QWORD *)(v20 + 24) = v21;
                    v22 = swift_allocObject();
                    v23 = v397;
                    v401 = v22;
                    *(_QWORD *)(v22 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
                    *(_QWORD *)(v22 + 24) = v23;
                    v403 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                    v400 = _allocateUninitializedArray<A>(_:)();
                    v402 = v24;
                    swift_retain();
                    v25 = v398;
                    v26 = v402;
                    *v402 = closure #1 in OSLogArguments.append(_:)partial apply;
                    v26[1] = v25;
                    swift_retain();
                    v27 = v399;
                    v28 = v402;
                    v402[2] = closure #1 in OSLogArguments.append(_:)partial apply;
                    v28[3] = v27;
                    swift_retain();
                    v29 = v401;
                    v30 = v402;
                    v402[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
                    v30[5] = v29;
                    _finalizeUninitializedArray<A>(_:)();
                    swift_bridgeObjectRelease();
                    if (os_log_type_enabled(v404, (os_log_type_t)v405))
                    {
                      v31 = v477;
                      v382 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                      v380 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                      v381 = 0;
                      v383 = createStorage<A>(capacity:type:)(0);
                      v384 = createStorage<A>(capacity:type:)(v381);
                      v385 = &v515;
                      v515 = v382;
                      v386 = &v514;
                      v514 = v383;
                      v387 = &v513;
                      v513 = v384;
                      serialize(_:at:)(0, &v515);
                      serialize(_:at:)(1, v385);
                      v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                      v512 = v398;
                      closure #1 in osLogInternal(_:log:type:)(&v511, (uint64_t)v385, (uint64_t)v386, (uint64_t)v387);
                      v388 = v31;
                      if (v31)
                      {
                        __break(1u);
                      }
                      else
                      {
                        v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                        v512 = v399;
                        closure #1 in osLogInternal(_:log:type:)(&v511, (uint64_t)&v515, (uint64_t)&v514, (uint64_t)&v513);
                        v379 = 0;
                        v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
                        v512 = v401;
                        closure #1 in osLogInternal(_:log:type:)(&v511, (uint64_t)&v515, (uint64_t)&v514, (uint64_t)&v513);
                        _os_log_impl(&dword_241527000, v404, (os_log_type_t)v405, "throughput_true in data directory failed validation: %ld", v382, v392);
                        v378 = 0;
                        destroyStorage<A>(_:count:)(v383, 0, v380);
                        destroyStorage<A>(_:count:)(v384, v378, MEMORY[0x24BEE4AD8] + 8);
                        MEMORY[0x242696394](v382, MEMORY[0x24BEE4260]);
                        swift_release();
                        swift_release();
                        swift_release();
                      }
                    }
                    else
                    {
                      swift_release();
                      swift_release();
                      swift_release();
                    }

                    (*(void (**)(char *, uint64_t))(v479 + 8))(v498, v478);
                    v406 = 0;
                  }
                }
                else
                {
                  v32 = v496;
                  v33 = logger.unsafeMutableAddressor();
                  (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v32, v33, v478);
                  v367 = 7;
                  v368 = swift_allocObject();
                  *(Swift::Double *)(v368 + 16) = v421;
                  v376 = Logger.logObject.getter();
                  v377 = static os_log_type_t.error.getter();
                  v363 = &v523;
                  v523 = 12;
                  v361 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  v362 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  lazy protocol witness table accessor for type Int and conformance Int();
                  UnsignedInteger<>.init<A>(_:)();
                  v364 = v524;
                  v365 = 17;
                  v370 = swift_allocObject();
                  *(_BYTE *)(v370 + 16) = 0;
                  v371 = swift_allocObject();
                  *(_BYTE *)(v371 + 16) = 8;
                  v366 = 32;
                  v34 = swift_allocObject();
                  v35 = v368;
                  v369 = v34;
                  *(_QWORD *)(v34 + 16) = partial apply for implicit closure #25 in checkValidNumericInputRange(data:);
                  *(_QWORD *)(v34 + 24) = v35;
                  v36 = swift_allocObject();
                  v37 = v369;
                  v373 = v36;
                  *(_QWORD *)(v36 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
                  *(_QWORD *)(v36 + 24) = v37;
                  v375 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                  v372 = _allocateUninitializedArray<A>(_:)();
                  v374 = v38;
                  swift_retain();
                  v39 = v370;
                  v40 = v374;
                  *v374 = closure #1 in OSLogArguments.append(_:)partial apply;
                  v40[1] = v39;
                  swift_retain();
                  v41 = v371;
                  v42 = v374;
                  v374[2] = closure #1 in OSLogArguments.append(_:)partial apply;
                  v42[3] = v41;
                  swift_retain();
                  v43 = v373;
                  v44 = v374;
                  v374[4] = closure #1 in OSLogArguments.append(_:)partial apply;
                  v44[5] = v43;
                  _finalizeUninitializedArray<A>(_:)();
                  swift_bridgeObjectRelease();
                  if (os_log_type_enabled(v376, (os_log_type_t)v377))
                  {
                    v45 = v477;
                    v354 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                    v352 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                    v353 = 0;
                    v355 = createStorage<A>(capacity:type:)(0);
                    v356 = createStorage<A>(capacity:type:)(v353);
                    v357 = &v522;
                    v522 = v354;
                    v358 = &v521;
                    v521 = v355;
                    v359 = &v520;
                    v520 = v356;
                    serialize(_:at:)(0, &v522);
                    serialize(_:at:)(1, v357);
                    v518 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                    v519 = v370;
                    closure #1 in osLogInternal(_:log:type:)(&v518, (uint64_t)v357, (uint64_t)v358, (uint64_t)v359);
                    v360 = v45;
                    if (v45)
                    {
                      __break(1u);
                    }
                    else
                    {
                      v518 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                      v519 = v371;
                      closure #1 in osLogInternal(_:log:type:)(&v518, (uint64_t)&v522, (uint64_t)&v521, (uint64_t)&v520);
                      v351 = 0;
                      v518 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                      v519 = v373;
                      closure #1 in osLogInternal(_:log:type:)(&v518, (uint64_t)&v522, (uint64_t)&v521, (uint64_t)&v520);
                      _os_log_impl(&dword_241527000, v376, (os_log_type_t)v377, "txRate in data directory failed validation: %f", v354, v364);
                      v350 = 0;
                      destroyStorage<A>(_:count:)(v355, 0, v352);
                      destroyStorage<A>(_:count:)(v356, v350, MEMORY[0x24BEE4AD8] + 8);
                      MEMORY[0x242696394](v354, MEMORY[0x24BEE4260]);
                      swift_release();
                      swift_release();
                      swift_release();
                    }
                  }
                  else
                  {
                    swift_release();
                    swift_release();
                    swift_release();
                  }

                  (*(void (**)(char *, uint64_t))(v479 + 8))(v496, v478);
                  v406 = 0;
                }
              }
              else
              {
                v46 = v494;
                v47 = logger.unsafeMutableAddressor();
                (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v46, v47, v478);
                v339 = 7;
                v340 = swift_allocObject();
                *(Swift::Double *)(v340 + 16) = v428;
                v348 = Logger.logObject.getter();
                v349 = static os_log_type_t.error.getter();
                v335 = &v530;
                v530 = 12;
                v333 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                v334 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                lazy protocol witness table accessor for type Int and conformance Int();
                UnsignedInteger<>.init<A>(_:)();
                v336 = v531;
                v337 = 17;
                v342 = swift_allocObject();
                *(_BYTE *)(v342 + 16) = 0;
                v343 = swift_allocObject();
                *(_BYTE *)(v343 + 16) = 8;
                v338 = 32;
                v48 = swift_allocObject();
                v49 = v340;
                v341 = v48;
                *(_QWORD *)(v48 + 16) = partial apply for implicit closure #23 in checkValidNumericInputRange(data:);
                *(_QWORD *)(v48 + 24) = v49;
                v50 = swift_allocObject();
                v51 = v341;
                v345 = v50;
                *(_QWORD *)(v50 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
                *(_QWORD *)(v50 + 24) = v51;
                v347 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                v344 = _allocateUninitializedArray<A>(_:)();
                v346 = v52;
                swift_retain();
                v53 = v342;
                v54 = v346;
                *v346 = closure #1 in OSLogArguments.append(_:)partial apply;
                v54[1] = v53;
                swift_retain();
                v55 = v343;
                v56 = v346;
                v346[2] = closure #1 in OSLogArguments.append(_:)partial apply;
                v56[3] = v55;
                swift_retain();
                v57 = v345;
                v58 = v346;
                v346[4] = partial apply for closure #1 in OSLogArguments.append(_:);
                v58[5] = v57;
                _finalizeUninitializedArray<A>(_:)();
                swift_bridgeObjectRelease();
                if (os_log_type_enabled(v348, (os_log_type_t)v349))
                {
                  v59 = v477;
                  v326 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                  v324 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                  v325 = 0;
                  v327 = createStorage<A>(capacity:type:)(0);
                  v328 = createStorage<A>(capacity:type:)(v325);
                  v329 = &v529;
                  v529 = v326;
                  v330 = &v528;
                  v528 = v327;
                  v331 = &v527;
                  v527 = v328;
                  serialize(_:at:)(0, &v529);
                  serialize(_:at:)(1, v329);
                  v525 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                  v526 = v342;
                  closure #1 in osLogInternal(_:log:type:)(&v525, (uint64_t)v329, (uint64_t)v330, (uint64_t)v331);
                  v332 = v59;
                  if (v59)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v525 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                    v526 = v343;
                    closure #1 in osLogInternal(_:log:type:)(&v525, (uint64_t)&v529, (uint64_t)&v528, (uint64_t)&v527);
                    v323 = 0;
                    v525 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
                    v526 = v345;
                    closure #1 in osLogInternal(_:log:type:)(&v525, (uint64_t)&v529, (uint64_t)&v528, (uint64_t)&v527);
                    _os_log_impl(&dword_241527000, v348, (os_log_type_t)v349, "rxRate in data directory failed validation: %f", v326, v336);
                    v322 = 0;
                    destroyStorage<A>(_:count:)(v327, 0, v324);
                    destroyStorage<A>(_:count:)(v328, v322, MEMORY[0x24BEE4AD8] + 8);
                    MEMORY[0x242696394](v326, MEMORY[0x24BEE4260]);
                    swift_release();
                    swift_release();
                    swift_release();
                  }
                }
                else
                {
                  swift_release();
                  swift_release();
                  swift_release();
                }

                (*(void (**)(char *, uint64_t))(v479 + 8))(v494, v478);
                v406 = 0;
              }
            }
            else
            {
              v60 = v492;
              v61 = logger.unsafeMutableAddressor();
              (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v60, v61, v478);
              v311 = 7;
              v312 = swift_allocObject();
              *(_QWORD *)(v312 + 16) = v435;
              v320 = Logger.logObject.getter();
              v321 = static os_log_type_t.error.getter();
              v307 = &v537;
              v537 = 12;
              v305 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              v306 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              lazy protocol witness table accessor for type Int and conformance Int();
              UnsignedInteger<>.init<A>(_:)();
              v308 = v538;
              v309 = 17;
              v314 = swift_allocObject();
              *(_BYTE *)(v314 + 16) = 0;
              v315 = swift_allocObject();
              *(_BYTE *)(v315 + 16) = 8;
              v310 = 32;
              v62 = swift_allocObject();
              v63 = v312;
              v313 = v62;
              *(_QWORD *)(v62 + 16) = partial apply for implicit closure #21 in checkValidNumericInputRange(data:);
              *(_QWORD *)(v62 + 24) = v63;
              v64 = swift_allocObject();
              v65 = v313;
              v317 = v64;
              *(_QWORD *)(v64 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
              *(_QWORD *)(v64 + 24) = v65;
              v319 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
              v316 = _allocateUninitializedArray<A>(_:)();
              v318 = v66;
              swift_retain();
              v67 = v314;
              v68 = v318;
              *v318 = closure #1 in OSLogArguments.append(_:)partial apply;
              v68[1] = v67;
              swift_retain();
              v69 = v315;
              v70 = v318;
              v318[2] = closure #1 in OSLogArguments.append(_:)partial apply;
              v70[3] = v69;
              swift_retain();
              v71 = v317;
              v72 = v318;
              v318[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
              v72[5] = v71;
              _finalizeUninitializedArray<A>(_:)();
              swift_bridgeObjectRelease();
              if (os_log_type_enabled(v320, (os_log_type_t)v321))
              {
                v73 = v477;
                v298 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                v296 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                v297 = 0;
                v299 = createStorage<A>(capacity:type:)(0);
                v300 = createStorage<A>(capacity:type:)(v297);
                v301 = &v536;
                v536 = v298;
                v302 = &v535;
                v535 = v299;
                v303 = &v534;
                v534 = v300;
                serialize(_:at:)(0, &v536);
                serialize(_:at:)(1, v301);
                v532 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                v533 = v314;
                closure #1 in osLogInternal(_:log:type:)(&v532, (uint64_t)v301, (uint64_t)v302, (uint64_t)v303);
                v304 = v73;
                if (v73)
                {
                  __break(1u);
                }
                else
                {
                  v532 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                  v533 = v315;
                  closure #1 in osLogInternal(_:log:type:)(&v532, (uint64_t)&v536, (uint64_t)&v535, (uint64_t)&v534);
                  v295 = 0;
                  v532 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
                  v533 = v317;
                  closure #1 in osLogInternal(_:log:type:)(&v532, (uint64_t)&v536, (uint64_t)&v535, (uint64_t)&v534);
                  _os_log_impl(&dword_241527000, v320, (os_log_type_t)v321, "bars in data directory failed validation: %ld", v298, v308);
                  v294 = 0;
                  destroyStorage<A>(_:count:)(v299, 0, v296);
                  destroyStorage<A>(_:count:)(v300, v294, MEMORY[0x24BEE4AD8] + 8);
                  MEMORY[0x242696394](v298, MEMORY[0x24BEE4260]);
                  swift_release();
                  swift_release();
                  swift_release();
                }
              }
              else
              {
                swift_release();
                swift_release();
                swift_release();
              }

              (*(void (**)(char *, uint64_t))(v479 + 8))(v492, v478);
              v406 = 0;
            }
          }
          else
          {
            v74 = v490;
            v75 = logger.unsafeMutableAddressor();
            (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v74, v75, v478);
            v283 = 7;
            v284 = swift_allocObject();
            *(_QWORD *)(v284 + 16) = v442;
            v292 = Logger.logObject.getter();
            v293 = static os_log_type_t.error.getter();
            v279 = &v544;
            v544 = 12;
            v277 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            v278 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type Int and conformance Int();
            UnsignedInteger<>.init<A>(_:)();
            v280 = v545;
            v281 = 17;
            v286 = swift_allocObject();
            *(_BYTE *)(v286 + 16) = 0;
            v287 = swift_allocObject();
            *(_BYTE *)(v287 + 16) = 8;
            v282 = 32;
            v76 = swift_allocObject();
            v77 = v284;
            v285 = v76;
            *(_QWORD *)(v76 + 16) = partial apply for implicit closure #19 in checkValidNumericInputRange(data:);
            *(_QWORD *)(v76 + 24) = v77;
            v78 = swift_allocObject();
            v79 = v285;
            v289 = v78;
            *(_QWORD *)(v78 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
            *(_QWORD *)(v78 + 24) = v79;
            v291 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
            v288 = _allocateUninitializedArray<A>(_:)();
            v290 = v80;
            swift_retain();
            v81 = v286;
            v82 = v290;
            *v290 = closure #1 in OSLogArguments.append(_:)partial apply;
            v82[1] = v81;
            swift_retain();
            v83 = v287;
            v84 = v290;
            v290[2] = closure #1 in OSLogArguments.append(_:)partial apply;
            v84[3] = v83;
            swift_retain();
            v85 = v289;
            v86 = v290;
            v290[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
            v86[5] = v85;
            _finalizeUninitializedArray<A>(_:)();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v292, (os_log_type_t)v293))
            {
              v87 = v477;
              v270 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
              v268 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              v269 = 0;
              v271 = createStorage<A>(capacity:type:)(0);
              v272 = createStorage<A>(capacity:type:)(v269);
              v273 = &v543;
              v543 = v270;
              v274 = &v542;
              v542 = v271;
              v275 = &v541;
              v541 = v272;
              serialize(_:at:)(0, &v543);
              serialize(_:at:)(1, v273);
              v539 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
              v540 = v286;
              closure #1 in osLogInternal(_:log:type:)(&v539, (uint64_t)v273, (uint64_t)v274, (uint64_t)v275);
              v276 = v87;
              if (v87)
              {
                __break(1u);
              }
              else
              {
                v539 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                v540 = v287;
                closure #1 in osLogInternal(_:log:type:)(&v539, (uint64_t)&v543, (uint64_t)&v542, (uint64_t)&v541);
                v267 = 0;
                v539 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
                v540 = v289;
                closure #1 in osLogInternal(_:log:type:)(&v539, (uint64_t)&v543, (uint64_t)&v542, (uint64_t)&v541);
                _os_log_impl(&dword_241527000, v292, (os_log_type_t)v293, "noise in data directory failed validation: %ld", v270, v280);
                v266 = 0;
                destroyStorage<A>(_:count:)(v271, 0, v268);
                destroyStorage<A>(_:count:)(v272, v266, MEMORY[0x24BEE4AD8] + 8);
                MEMORY[0x242696394](v270, MEMORY[0x24BEE4260]);
                swift_release();
                swift_release();
                swift_release();
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
            }

            (*(void (**)(char *, uint64_t))(v479 + 8))(v490, v478);
            v406 = 0;
          }
        }
        else
        {
          v88 = v488;
          v89 = logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v88, v89, v478);
          v255 = 7;
          v256 = swift_allocObject();
          *(_QWORD *)(v256 + 16) = v449;
          v264 = Logger.logObject.getter();
          v265 = static os_log_type_t.error.getter();
          v251 = &v551;
          v551 = 12;
          v249 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          v250 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          v252 = v552;
          v253 = 17;
          v258 = swift_allocObject();
          *(_BYTE *)(v258 + 16) = 0;
          v259 = swift_allocObject();
          *(_BYTE *)(v259 + 16) = 8;
          v254 = 32;
          v90 = swift_allocObject();
          v91 = v256;
          v257 = v90;
          *(_QWORD *)(v90 + 16) = partial apply for implicit closure #17 in checkValidNumericInputRange(data:);
          *(_QWORD *)(v90 + 24) = v91;
          v92 = swift_allocObject();
          v93 = v257;
          v261 = v92;
          *(_QWORD *)(v92 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
          *(_QWORD *)(v92 + 24) = v93;
          v263 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          v260 = _allocateUninitializedArray<A>(_:)();
          v262 = v94;
          swift_retain();
          v95 = v258;
          v96 = v262;
          *v262 = closure #1 in OSLogArguments.append(_:)partial apply;
          v96[1] = v95;
          swift_retain();
          v97 = v259;
          v98 = v262;
          v262[2] = closure #1 in OSLogArguments.append(_:)partial apply;
          v98[3] = v97;
          swift_retain();
          v99 = v261;
          v100 = v262;
          v262[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
          v100[5] = v99;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v264, (os_log_type_t)v265))
          {
            v101 = v477;
            v242 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            v240 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            v241 = 0;
            v243 = createStorage<A>(capacity:type:)(0);
            v244 = createStorage<A>(capacity:type:)(v241);
            v245 = &v550;
            v550 = v242;
            v246 = &v549;
            v549 = v243;
            v247 = &v548;
            v548 = v244;
            serialize(_:at:)(0, &v550);
            serialize(_:at:)(1, v245);
            v546 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v547 = v258;
            closure #1 in osLogInternal(_:log:type:)(&v546, (uint64_t)v245, (uint64_t)v246, (uint64_t)v247);
            v248 = v101;
            if (v101)
            {
              __break(1u);
            }
            else
            {
              v546 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
              v547 = v259;
              closure #1 in osLogInternal(_:log:type:)(&v546, (uint64_t)&v550, (uint64_t)&v549, (uint64_t)&v548);
              v239 = 0;
              v546 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
              v547 = v261;
              closure #1 in osLogInternal(_:log:type:)(&v546, (uint64_t)&v550, (uint64_t)&v549, (uint64_t)&v548);
              _os_log_impl(&dword_241527000, v264, (os_log_type_t)v265, "rscp in data directory failed validation: %ld", v242, v252);
              v238 = 0;
              destroyStorage<A>(_:count:)(v243, 0, v240);
              destroyStorage<A>(_:count:)(v244, v238, MEMORY[0x24BEE4AD8] + 8);
              MEMORY[0x242696394](v242, MEMORY[0x24BEE4260]);
              swift_release();
              swift_release();
              swift_release();
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(char *, uint64_t))(v479 + 8))(v488, v478);
          v406 = 0;
        }
      }
      else
      {
        v102 = v486;
        v103 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v102, v103, v478);
        v227 = 7;
        v228 = swift_allocObject();
        *(_QWORD *)(v228 + 16) = v456;
        v236 = Logger.logObject.getter();
        v237 = static os_log_type_t.error.getter();
        v223 = &v558;
        v558 = 12;
        v221 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v222 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        v224 = v559;
        v225 = 17;
        v230 = swift_allocObject();
        *(_BYTE *)(v230 + 16) = 0;
        v231 = swift_allocObject();
        *(_BYTE *)(v231 + 16) = 8;
        v226 = 32;
        v104 = swift_allocObject();
        v105 = v228;
        v229 = v104;
        *(_QWORD *)(v104 + 16) = partial apply for implicit closure #15 in checkValidNumericInputRange(data:);
        *(_QWORD *)(v104 + 24) = v105;
        v106 = swift_allocObject();
        v107 = v229;
        v233 = v106;
        *(_QWORD *)(v106 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
        *(_QWORD *)(v106 + 24) = v107;
        v235 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v232 = _allocateUninitializedArray<A>(_:)();
        v234 = v108;
        swift_retain();
        v109 = v230;
        v110 = v234;
        *v234 = closure #1 in OSLogArguments.append(_:)partial apply;
        v110[1] = v109;
        swift_retain();
        v111 = v231;
        v112 = v234;
        v234[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v112[3] = v111;
        swift_retain();
        v113 = v233;
        v114 = v234;
        v234[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v114[5] = v113;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v236, (os_log_type_t)v237))
        {
          v115 = v477;
          v214 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v213 = 0;
          v215 = createStorage<A>(capacity:type:)(0);
          v216 = createStorage<A>(capacity:type:)(v213);
          v217 = &v557;
          v557 = v214;
          v218 = &v556;
          v556 = v215;
          v219 = &v555;
          v555 = v216;
          serialize(_:at:)(0, &v557);
          serialize(_:at:)(1, v217);
          v553 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v554 = v230;
          closure #1 in osLogInternal(_:log:type:)(&v553, (uint64_t)v217, (uint64_t)v218, (uint64_t)v219);
          v220 = v115;
          if (v115)
          {
            __break(1u);
          }
          else
          {
            v553 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v554 = v231;
            closure #1 in osLogInternal(_:log:type:)(&v553, (uint64_t)&v557, (uint64_t)&v556, (uint64_t)&v555);
            v211 = 0;
            v553 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
            v554 = v233;
            closure #1 in osLogInternal(_:log:type:)(&v553, (uint64_t)&v557, (uint64_t)&v556, (uint64_t)&v555);
            _os_log_impl(&dword_241527000, v236, (os_log_type_t)v237, "rsrq in data directory failed validation: %ld", v214, v224);
            v210 = 0;
            destroyStorage<A>(_:count:)(v215, 0, v212);
            destroyStorage<A>(_:count:)(v216, v210, MEMORY[0x24BEE4AD8] + 8);
            MEMORY[0x242696394](v214, MEMORY[0x24BEE4260]);
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v479 + 8))(v486, v478);
        v406 = 0;
      }
    }
    else
    {
      v116 = v484;
      v117 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v116, v117, v478);
      v199 = 7;
      v200 = swift_allocObject();
      *(_QWORD *)(v200 + 16) = v463;
      v208 = Logger.logObject.getter();
      v209 = static os_log_type_t.error.getter();
      v195 = &v565;
      v565 = 12;
      v193 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v194 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v196 = v566;
      v197 = 17;
      v202 = swift_allocObject();
      *(_BYTE *)(v202 + 16) = 0;
      v203 = swift_allocObject();
      *(_BYTE *)(v203 + 16) = 8;
      v198 = 32;
      v118 = swift_allocObject();
      v119 = v200;
      v201 = v118;
      *(_QWORD *)(v118 + 16) = partial apply for implicit closure #13 in checkValidNumericInputRange(data:);
      *(_QWORD *)(v118 + 24) = v119;
      v120 = swift_allocObject();
      v121 = v201;
      v205 = v120;
      *(_QWORD *)(v120 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(_QWORD *)(v120 + 24) = v121;
      v207 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v204 = _allocateUninitializedArray<A>(_:)();
      v206 = v122;
      swift_retain();
      v123 = v202;
      v124 = v206;
      *v206 = closure #1 in OSLogArguments.append(_:)partial apply;
      v124[1] = v123;
      swift_retain();
      v125 = v203;
      v126 = v206;
      v206[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v126[3] = v125;
      swift_retain();
      v127 = v205;
      v128 = v206;
      v206[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v128[5] = v127;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v208, (os_log_type_t)v209))
      {
        v129 = v477;
        v186 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v184 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v185 = 0;
        v187 = createStorage<A>(capacity:type:)(0);
        v188 = createStorage<A>(capacity:type:)(v185);
        v189 = &v564;
        v564 = v186;
        v190 = &v563;
        v563 = v187;
        v191 = &v562;
        v562 = v188;
        serialize(_:at:)(0, &v564);
        serialize(_:at:)(1, v189);
        v560 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v561 = v202;
        closure #1 in osLogInternal(_:log:type:)(&v560, (uint64_t)v189, (uint64_t)v190, (uint64_t)v191);
        v192 = v129;
        if (v129)
        {
          __break(1u);
        }
        else
        {
          v560 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v561 = v203;
          closure #1 in osLogInternal(_:log:type:)(&v560, (uint64_t)&v564, (uint64_t)&v563, (uint64_t)&v562);
          v183 = 0;
          v560 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
          v561 = v205;
          closure #1 in osLogInternal(_:log:type:)(&v560, (uint64_t)&v564, (uint64_t)&v563, (uint64_t)&v562);
          _os_log_impl(&dword_241527000, v208, (os_log_type_t)v209, "rsrp in data directory failed validation: %ld", v186, v196);
          v182 = 0;
          destroyStorage<A>(_:count:)(v187, 0, v184);
          destroyStorage<A>(_:count:)(v188, v182, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x242696394](v186, MEMORY[0x24BEE4260]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v479 + 8))(v484, v478);
      v406 = 0;
    }
  }
  else
  {
    v130 = v482;
    v131 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v130, v131, v478);
    v171 = 7;
    v172 = swift_allocObject();
    *(_QWORD *)(v172 + 16) = v470;
    v180 = Logger.logObject.getter();
    v181 = static os_log_type_t.error.getter();
    v167 = &v572;
    v572 = 12;
    v165 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v166 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v168 = v573;
    v169 = 17;
    v174 = swift_allocObject();
    *(_BYTE *)(v174 + 16) = 0;
    v175 = swift_allocObject();
    *(_BYTE *)(v175 + 16) = 8;
    v170 = 32;
    v132 = swift_allocObject();
    v133 = v172;
    v173 = v132;
    *(_QWORD *)(v132 + 16) = partial apply for implicit closure #11 in checkValidNumericInputRange(data:);
    *(_QWORD *)(v132 + 24) = v133;
    v134 = swift_allocObject();
    v135 = v173;
    v177 = v134;
    *(_QWORD *)(v134 + 16) = _sSiIegd_SiIegr_TRTA_0;
    *(_QWORD *)(v134 + 24) = v135;
    v179 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v176 = _allocateUninitializedArray<A>(_:)();
    v178 = v136;
    swift_retain();
    v137 = v174;
    v138 = v178;
    *v178 = closure #1 in OSLogArguments.append(_:)partial apply;
    v138[1] = v137;
    swift_retain();
    v139 = v175;
    v140 = v178;
    v178[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v140[3] = v139;
    swift_retain();
    v141 = v177;
    v142 = v178;
    v178[4] = _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    v142[5] = v141;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v180, (os_log_type_t)v181))
    {
      v143 = v477;
      v158 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v156 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v157 = 0;
      v159 = createStorage<A>(capacity:type:)(0);
      v160 = createStorage<A>(capacity:type:)(v157);
      v161 = &v571;
      v571 = v158;
      v162 = &v570;
      v570 = v159;
      v163 = &v569;
      v569 = v160;
      serialize(_:at:)(0, &v571);
      serialize(_:at:)(1, v161);
      v567 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v568 = v174;
      closure #1 in osLogInternal(_:log:type:)(&v567, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163);
      v164 = v143;
      if (v143)
      {
        __break(1u);
      }
      else
      {
        v567 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v568 = v175;
        closure #1 in osLogInternal(_:log:type:)(&v567, (uint64_t)&v571, (uint64_t)&v570, (uint64_t)&v569);
        v155 = 0;
        v567 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
        v568 = v177;
        closure #1 in osLogInternal(_:log:type:)(&v567, (uint64_t)&v571, (uint64_t)&v570, (uint64_t)&v569);
        _os_log_impl(&dword_241527000, v180, (os_log_type_t)v181, "rssi in data directory failed validation: %ld", v158, v168);
        v154 = 0;
        destroyStorage<A>(_:count:)(v159, 0, v156);
        destroyStorage<A>(_:count:)(v160, v154, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696394](v158, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v479 + 8))(v482, v478);
    v406 = 0;
  }
  return v406 & 1;
}

id @nonobjc NSRegularExpression.init(pattern:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v5;
  id v6;
  id v7;
  id v9;
  uint64_t v10;

  v7 = (id)MEMORY[0x242696118]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)();
  v9 = objc_msgSend(v6, sel_initWithPattern_options_error_, v7, a3, v10);
  v3 = 0;

  if (v9)
  {

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRelease();
    return (id)v5;
  }
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSMatchingOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSRegularExpressionOptions protocol witness for OptionSet.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, NSRegularExpressionOptions *a2@<X8>)
{
  NSRegularExpressionOptions result;

  result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSMatchingOptions protocol witness for OptionSet.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, NSMatchingOptions *a2@<X8>)
{
  NSMatchingOptions result;

  result = NSMatchingOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

NSRegularExpressionOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSRegularExpressionOptions result;

  result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSRegularExpressionOptions@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = NSRegularExpressionOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

NSMatchingOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSMatchingOptions result;

  result = NSMatchingOptions.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSMatchingOptions@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = NSMatchingOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v8;

  v4 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0, 0, 1, a1, a2);
  v15 = v3;
  v16 = v4;
  v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x24BEE2520];
    v13[0] = a1;
    v13[1] = a2;
    v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  char v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD v21[4];
  char v22;
  char v23;
  uint64_t v24;

  v17 = (_QWORD *)result;
  v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3)
          __break(1u);
        v16 = a3 - (_QWORD)a2;
      }
      else
      {
        v16 = 0;
      }
      v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v21, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter();
          *v17 = a2;
          v11 = 0;
          v12 = v15;
          v13 = 1;
          v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          v22 = v13 & 1;
          v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *v17 = v7;
    v11 = v6;
    v12 = v8;
    v13 = 0;
    v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = _StringObject.sharedUTF8.getter();
  if (!result)
    goto LABEL_29;
  v10 = result;
LABEL_21:
  *v17 = v10;
  if (a6 < 0)
  {
    v9 = 0;
LABEL_25:
    v11 = (_QWORD *)v9;
    v12 = a5 & 0xFFFFFFFFFFFFLL;
    v13 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(const void *a1, size_t a2, void *__dst)
{
  memcpy(__dst, a1, a2);
  return __dst;
}

_QWORD *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain();
  v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease();
  result = (_QWORD *)v5;
  if (!__OFSUB__(v5, 1))
    return v6;
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v7 = String.UTF8View._foreignCount()();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
    return (_QWORD *)specialized ContiguousArray.init()();
  v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0);
  swift_retain();
  swift_release();
  result = (_QWORD *)_StringGuts.copyUTF8(into:)();
  v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    outlined destroy of String.UTF8View();
    if (v6 == (_QWORD *)v7)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v4;
  if ((result & 1) == 0)
  {
    v2 = specialized Array.count.getter(*v3);
    result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 + 1, 1, *v3);
    *v3 = result;
  }
  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 < result + 1)
  {
    result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *v2 = result;
  }
  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 1;
  v4 = *v2;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v4 + 16) = v5;
  swift_release();
  v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void specialized Array._endMutation()()
{
  _QWORD *v0;

  *v0 = *v0;
}

{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

{
  return specialized Array._getCount()(a1);
}

{
  return specialized Array._getCount()(a1);
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  size_t v4;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < a1)
    v7 = a1;
  else
    v7 = a2;
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v6 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (_QWORD)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    swift_retain();
    return (_QWORD *)v3;
  }
}

uint64_t specialized ContiguousArray.init()()
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  swift_retain();
  return v1;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result;
  char *v5;
  size_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v16;

  swift_retain();
  result = swift_retain();
  v16 = *(_QWORD *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2)
        v11 = a2;
      else
        v11 = 2 * v16;
    }
    else
    {
      v11 = *(_QWORD *)(a4 + 24) >> 1;
    }
  }
  else
  {
    v11 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v11 < v10)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v11;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v8 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * (v6 - (_QWORD)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * v9;
    }
    swift_release();
    v7 = (char *)v8;
  }
  else
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    swift_retain();
    v7 = v5;
  }
  if ((a1 & 1) != 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v10, v7 + 32);
    *(_QWORD *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

{
  return *(_QWORD *)(a1 + 16);
}

{
  return *(_QWORD *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result)
    return (char *)memmove(a3, result, a2);
  return result;
}

uint64_t sub_241535F58()
{
  return swift_deallocObject();
}

_BYTE **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_241535F88()
{
  return swift_deallocObject();
}

uint64_t sub_241535FB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241536000()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *partial apply for closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_241536048()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in checkValidTextInputs(data:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #2 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_241536090()
{
  return swift_deallocObject();
}

uint64_t sub_2415360C0()
{
  return swift_deallocObject();
}

uint64_t sub_2415360F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241536138()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *closure #1 in OSLogArguments.append(_:)partial apply(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_241536180()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in checkValidTextInputs(data:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #3 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_2415361C8()
{
  return swift_deallocObject();
}

uint64_t sub_2415361F8()
{
  return swift_deallocObject();
}

uint64_t sub_241536228()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536270()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined init with copy of Int?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = a2;
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(a1 + 8);
  return result;
}

uint64_t sub_2415362D4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #11 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #11 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241536304()
{
  return swift_deallocObject();
}

uint64_t sub_241536334()
{
  return swift_deallocObject();
}

uint64_t sub_241536364()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_2415363AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t sub_241536448()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #13 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241536478()
{
  return swift_deallocObject();
}

uint64_t sub_2415364A8()
{
  return swift_deallocObject();
}

uint64_t sub_2415364D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536520()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415365BC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #15 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #15 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2415365EC()
{
  return swift_deallocObject();
}

uint64_t sub_24153661C()
{
  return swift_deallocObject();
}

uint64_t sub_24153664C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536694()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536730()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #17 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #17 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241536760()
{
  return swift_deallocObject();
}

uint64_t sub_241536790()
{
  return swift_deallocObject();
}

uint64_t sub_2415367C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536808()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415368A4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #19 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #19 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2415368D4()
{
  return swift_deallocObject();
}

uint64_t sub_241536904()
{
  return swift_deallocObject();
}

uint64_t sub_241536934()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24153697C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536A18()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #21 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #21 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241536A48()
{
  return swift_deallocObject();
}

uint64_t sub_241536A78()
{
  return swift_deallocObject();
}

uint64_t sub_241536AA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536AF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536B8C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #23 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #23 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_241536BBC()
{
  return swift_deallocObject();
}

uint64_t sub_241536BEC()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_241536C3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

_QWORD *closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  _QWORD *result;
  uint64_t v5;

  a4();
  v5 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = a1;
  *a1 = v5 + 8;
  return result;
}

uint64_t sub_241536CE8()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *partial apply for closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_241536D30()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #25 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #25 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_241536D60()
{
  return swift_deallocObject();
}

uint64_t sub_241536D90()
{
  return swift_deallocObject();
}

uint64_t sub_241536DC0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241536E08()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *closure #1 in OSLogArguments.append(_:)partial apply(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_241536E50()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #27 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #27 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241536E80()
{
  return swift_deallocObject();
}

uint64_t sub_241536EB0()
{
  return swift_deallocObject();
}

uint64_t sub_241536EE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241536F28()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t base witness table accessor for RawRepresentable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for RawRepresentable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
    return v0;
  }
  return v2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View()
{
  swift_bridgeObjectRelease();
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BDCFB40], MEMORY[0x24BEE0D00]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return v0;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE01C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return v1;
  }
  return v3;
}

uint64_t SQLError.description.getter(int a1, uint64_t a2, void *a3)
{
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v11;
  Swift::String v12;

  v11._countAndFlagsBits = a2;
  v11._object = a3;
  swift_bridgeObjectRetain();
  if (v11._object)
  {
    v12 = v11;
  }
  else
  {
    v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SQL Error", 9uLL, 1);
    outlined destroy of String?();
  }
  countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(": ", 2uLL, 1)._countAndFlagsBits;
  v8 = MEMORY[0x242696154](v12._countAndFlagsBits, v12._object, countAndFlagsBits);
  v9 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!sqlite3_errstr(a1))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v5 = String.init(cString:)();
  v7 = MEMORY[0x242696154](v8, v9, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?()
{
  swift_bridgeObjectRelease();
}

uint64_t SQLError.errorDescription.getter(int a1, uint64_t a2, void *a3)
{
  return SQLError.description.getter(a1, a2, a3);
}

uint64_t SQLError.code.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*SQLError.code.modify())()
{
  return SQLError.code.modify;
}

uint64_t variable initialization expression of SQLError.desc()
{
  return 0;
}

uint64_t SQLError.desc.getter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t SQLError.desc.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRetain();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*SQLError.desc.modify())()
{
  return SQLError.desc.modify;
}

uint64_t default argument 1 of SQLError.init(code:desc:)()
{
  return 0;
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance SQLError()
{
  uint64_t v0;

  return SQLError.errorDescription.getter(*(_DWORD *)v0, *(_QWORD *)(v0 + 8), *(void **)(v0 + 16));
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance SQLError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance SQLError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance SQLError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SQLError()
{
  uint64_t v0;

  return SQLError.description.getter(*(_DWORD *)v0, *(_QWORD *)(v0 + 8), *(void **)(v0 + 16));
}

uint64_t protocol witness for Error._domain.getter in conformance SQLError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance SQLError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SQLError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SQLError()
{
  return Error._getEmbeddedNSError()();
}

void DBError.description.getter(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_241537A44()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("statement returned no rows", 0x1AuLL, 1)._countAndFlagsBits;
}

void DBError.errorDescription.getter(char a1)
{
  DBError.description.getter(a1);
}

void static DBError.__derived_enum_equals(_:_:)(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_241537B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_241537BBC
                                                                                       + dword_241537C24[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_241537BCC()
{
  uint64_t v1;

  return v1 == 0;
}

void DBError.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_241537C84()
{
  return Hasher.combine<A>(_:)();
}

uint64_t DBError.hashValue.getter()
{
  lazy protocol witness table accessor for type DBError and conformance DBError();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type DBError and conformance DBError()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    v0 = MEMORY[0x242696A30](&protocol conformance descriptor for DBError, &type metadata for DBError);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    v0 = MEMORY[0x242696A30](&protocol conformance descriptor for DBError, &type metadata for DBError);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    v0 = MEMORY[0x242696A30](&protocol conformance descriptor for DBError, &type metadata for DBError);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DBError(char *a1)
{
  char v1;

  static DBError.__derived_enum_equals(_:_:)(*a1);
  return v1 & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance DBError()
{
  return DBError.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance DBError(uint64_t a1)
{
  char *v1;

  DBError.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DBError(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

void protocol witness for LocalizedError.errorDescription.getter in conformance DBError()
{
  char *v0;

  DBError.errorDescription.getter(*v0);
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance DBError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance DBError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance DBError()
{
  return LocalizedError.helpAnchor.getter();
}

void protocol witness for CustomStringConvertible.description.getter in conformance DBError()
{
  char *v0;

  DBError.description.getter(*v0);
}

uint64_t protocol witness for Error._domain.getter in conformance DBError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance DBError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance DBError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance DBError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t SQLiteDB.logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static SQLiteDB.logger);
}

uint64_t SQLiteDB.Location.path.getter()
{
  const void *v0;
  char *v1;
  void *v2;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  const void *v14;
  char *v15;

  v14 = 0;
  v15 = 0;
  v6 = 0;
  v12 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v12 - 8);
  v7 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v8 = (char *)&v4 - v7;
  v15 = (char *)&v4 - v7;
  v10 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SQLiteDB.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0 = (const void *)MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v4 - v10;
  v14 = v0;
  outlined init with copy of SQLiteDB.Location(v0, (char *)&v4 - v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v13, 1, v12) == 1)
  {
    v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(":memory:", 8uLL, 1);
  }
  else
  {
    v1 = v8;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v13, v12);
    v15 = v1;
    v4._countAndFlagsBits = URL.path.getter();
    v4._object = v2;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v12);
    v5 = v4;
  }
  return v5._countAndFlagsBits;
}

uint64_t type metadata accessor for SQLiteDB.Location()
{
  uint64_t v1;

  v1 = type metadata singleton initialization cache for SQLiteDB.Location;
  if (!type metadata singleton initialization cache for SQLiteDB.Location)
    return swift_getSingletonMetadata();
  return v1;
}

void *outlined init with copy of SQLiteDB.Location(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = type metadata accessor for SQLiteDB.Location();
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t SQLiteDB.DBHandle.__allocating_init(location:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = SQLiteDB.DBHandle.init(location:)(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t SQLiteDB.DBHandle.init(location:)(uint64_t a1)
{
  uint64_t v1;
  Swift::String v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  unsigned int v13;
  sqlite3 *v14[2];

  v14[1] = *(sqlite3 **)MEMORY[0x24BDAC8D0];
  *(_BYTE *)(v1 + 24) = 0;
  v14[0] = 0;
  SQLiteDB.Location.path.getter();
  v12 = String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  v13 = sqlite3_open_v2((const char *)(v12 + 32), v14, 32774, 0);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (!v14[0] || v13)
  {
    v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to open database", 0x17uLL, 1);
    v10 = SQLError.init(code:desc:)(v13, v3._countAndFlagsBits, v3._object);
    v8 = v4;
    v9 = v5;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)v6 = v10;
    *(_QWORD *)(v6 + 8) = v8;
    *(_QWORD *)(v6 + 16) = v9;
    swift_willThrow();
    swift_deallocPartialClassInstance();
    outlined destroy of SQLiteDB.Location(a1);
    return v7;
  }
  else
  {
    *(sqlite3 **)(v1 + 16) = v14[0];
    outlined destroy of SQLiteDB.Location(a1);
    return v1;
  }
}

unint64_t lazy protocol witness table accessor for type SQLError and conformance SQLError()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type SQLError and conformance SQLError;
  if (!lazy protocol witness table cache variable for type SQLError and conformance SQLError)
  {
    v0 = MEMORY[0x242696A30](&protocol conformance descriptor for SQLError, &type metadata for SQLError);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type SQLError and conformance SQLError);
    return v0;
  }
  return v2;
}

uint64_t outlined destroy of SQLiteDB.Location(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t SQLiteDB.DBHandle.close()()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  char v3;

  swift_beginAccess();
  v3 = *(_BYTE *)(v0 + 24);
  result = swift_endAccess();
  if ((v3 & 1) == 0)
  {
    swift_beginAccess();
    *(_BYTE *)(v2 + 24) = 1;
    swift_endAccess();
    return sqlite3_close_v2(*(sqlite3 **)(v2 + 16));
  }
  return result;
}

uint64_t SQLiteDB.DBHandle.deinit()
{
  uint64_t v1;

  SQLiteDB.DBHandle.close()();
  return v1;
}

uint64_t SQLiteDB.DBHandle.__deallocating_deinit()
{
  SQLiteDB.DBHandle.deinit();
  return swift_deallocClassInstance();
}

uint64_t SQLiteDB.Statement.handle.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SQLiteDB.Statement.sqlString.getter()
{
  uint64_t v0;
  uint64_t v2;
  char *v4;

  v4 = sqlite3_expanded_sql(*(sqlite3_stmt **)(v0 + 16));
  if (!v4)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  v2 = String.init(cString:)();
  $defer #1 () in SQLiteDB.Statement.sqlString.getter(v4);
  return v2;
}

void $defer #1 () in SQLiteDB.Statement.sqlString.getter(void *a1)
{
  sqlite3_free(a1);
}

uint64_t variable initialization expression of SQLiteDB.Statement.finished()
{
  return 0;
}

uint64_t key path getter for SQLiteDB.Statement.finished : SQLiteDB.Statement@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 104))(v2) & 1;
  return swift_release();
}

uint64_t key path setter for SQLiteDB.Statement.finished : SQLiteDB.Statement(char *a1)
{
  char v2;

  v2 = *a1;
  swift_retain();
  SQLiteDB.Statement.finished.setter(v2 & 1);
  return swift_release();
}

uint64_t SQLiteDB.Statement.finished.getter()
{
  uint64_t v0;
  char v2;

  swift_beginAccess();
  v2 = *(_BYTE *)(v0 + 24);
  swift_endAccess();
  return v2 & 1;
}

uint64_t SQLiteDB.Statement.finished.setter(char a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_BYTE *)(v1 + 24) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*SQLiteDB.Statement.finished.modify())()
{
  swift_beginAccess();
  return SQLiteDB.Statement.finished.modify;
}

uint64_t SQLiteDB.Statement.finished.modify()
{
  return swift_endAccess();
}

uint64_t SQLiteDB.Statement.__allocating_init(handle:)(uint64_t a1)
{
  swift_allocObject();
  return SQLiteDB.Statement.init(handle:)(a1);
}

uint64_t SQLiteDB.Statement.init(handle:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = v1;
  *(_BYTE *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t SQLiteDB.Statement.step()()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  Swift::String v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _BYTE *v15;
  unsigned int v16;

  v16 = sqlite3_step(*(sqlite3_stmt **)(v0 + 16));
  if (v16 == 100)
  {
    swift_retain();
    return ((uint64_t (*)())SQLiteDB.Row.init(statement:))();
  }
  else
  {
    if (v16 != 101)
    {
      DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Statement ((", 0xCuLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v1);
      v2 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 96))(v2);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      outlined destroy of String();
      v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(")) could not be executed", 0x18uLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of DefaultStringInterpolation();
      v4 = String.init(stringInterpolation:)();
      v12 = SQLError.init(code:desc:)(v16, v4, v5);
      v10 = v6;
      v11 = v7;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      swift_allocError();
      *(_DWORD *)v8 = v12;
      *(_QWORD *)(v8 + 8) = v10;
      *(_QWORD *)(v8 + 16) = v11;
      swift_willThrow();
      return v13;
    }
    swift_beginAccess();
    v15[24] = 1;
    swift_endAccess();
    return 0;
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DefaultStringInterpolation()
{
  swift_bridgeObjectRelease();
}

uint64_t SQLiteDB.Statement.forEach(handler:)(void (*a1)(void))
{
  uint64_t result;
  uint64_t v3;

  while (1)
  {
    result = SQLiteDB.Statement.step()();
    if (v3 || !result)
      break;
    a1();
    swift_release();
    v3 = 0;
  }
  return result;
}

uint64_t SQLiteDB.Statement.queryOneRow<A>(handler:)@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  _BYTE v19[12];
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _BOOL4 v23;
  _BYTE v24[12];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;

  v32 = a4;
  v33 = a1;
  v34 = a2;
  v35 = a3;
  v48 = 0;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  v44 = 0;
  v49 = a3;
  v36 = *(_QWORD *)(a3 - 8);
  v37 = (*(_QWORD *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v38 = (char *)v14 - v37;
  v48 = (char *)v14 - v37;
  v46 = MEMORY[0x24BDAC7A8](a1);
  v47 = v6;
  v45 = v4;
  result = SQLiteDB.Statement.step()();
  v39 = v5;
  v40 = result;
  v41 = v5;
  if (v5)
  {
    v17 = v41;
  }
  else
  {
    v31 = v40;
    if (v40)
    {
      v30 = v31;
      v8 = v39;
      v27 = v31;
      v44 = v31;
      v33();
      v28 = v8;
      v29 = v8;
      v9 = SQLiteDB.Statement.step()();
      *(_DWORD *)&v24[8] = 0;
      v25 = v9;
      v26 = 0;
      v43 = v9;
      *(_QWORD *)v24 = v9 != 0;
      v23 = v9 != 0;
      outlined destroy of SQLiteDB.Row?();
      if (v23)
      {
        for (i = *(_QWORD *)&v24[4]; ; i = *(_QWORD *)&v19[4])
        {
          v10 = i;
          v11 = SQLiteDB.Statement.step()();
          *(_QWORD *)&v19[4] = v10;
          v20 = v11;
          v21 = v10;
          if (v10)
            break;
          v42 = v20;
          *(_QWORD *)v19 = v20 != 0;
          v18 = v20 != 0;
          outlined destroy of SQLiteDB.Row?();
          if (!v18)
          {
            lazy protocol witness table accessor for type DBError and conformance DBError();
            v16 = swift_allocError();
            *v12 = 1;
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v35);
            swift_release();
            result = v16;
            v17 = v16;
            return result;
          }
        }
        v14[0] = v21;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v35);
        return swift_release();
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v32, v38, v35);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v35);
        return swift_release();
      }
    }
    else
    {
      lazy protocol witness table accessor for type DBError and conformance DBError();
      v15 = swift_allocError();
      *v13 = 0;
      swift_willThrow();
      result = v15;
      v17 = v15;
    }
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of SQLiteDB.Row?()
{
  swift_release();
}

uint64_t SQLiteDB.Statement.queryOne<A>()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BYTE v4[16];
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = a1;
  v7 = v2;
  v5 = a1;
  v6 = a2;
  return (*(uint64_t (**)(uint64_t (*)(uint64_t), _BYTE *))(*(_QWORD *)v2 + 152))(partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>(), v4);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t (*)(uint64_t), _BYTE *, uint64_t);
  _BYTE v6[16];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = v2;
  v7 = a1;
  v8 = a2;
  v5 = *(uint64_t (**)(uint64_t (*)(uint64_t), _BYTE *, uint64_t))(*(_QWORD *)v2 + 152);
  v3 = type metadata accessor for Optional();
  return v5(partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>(), v6, v3);
}

uint64_t closure #1 in SQLiteDB.Statement.queryOne<A>()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v4;

  if (SQLiteDB.Row.count.getter(a1) == 1)
  {
    swift_retain();
    return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 8))(a1, 0);
  }
  else
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    swift_allocError();
    *v4 = 2;
    return swift_willThrow();
  }
}

{
  _BYTE *v4;

  if (SQLiteDB.Row.count.getter(a1) == 1)
  {
    swift_retain();
    return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 8))(a1, 0);
  }
  else
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    swift_allocError();
    *v4 = 2;
    return swift_willThrow();
  }
}

uint64_t partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in SQLiteDB.Statement.queryOne<A>()(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

{
  uint64_t v1;

  return closure #1 in SQLiteDB.Statement.queryOne<A>()(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t SQLiteDB.Row.count.getter(uint64_t a1)
{
  sqlite3_stmt *pStmt;

  swift_retain();
  pStmt = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  return sqlite3_column_count(pStmt);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Statement.execute()()
{
  _BYTE v0[12];
  uint64_t v1;
  uint64_t v2;

  while (1)
  {
    *(_DWORD *)&v0[8] = HIDWORD(v2);
    v1 = SQLiteDB.Statement.step()();
    if (v2)
      break;
    outlined destroy of SQLiteDB.Row?();
    if (!v1)
      break;
    *(_QWORD *)v0 = 1;
    v2 = *(_QWORD *)&v0[4];
  }
}

uint64_t SQLiteDB.Statement.bind(at:to:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(v6, a1, v4);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(*(_QWORD *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0)
    return (_QWORD *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  return result;
}

_QWORD *SQLiteDB.Statement.bind(values:)(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE __dst[40];
  _BYTE v8[48];
  uint64_t v9;
  _QWORD v10[8];
  _QWORD v11[5];

  memset(v11, 0, 32);
  v11[4] = a1;
  v10[6] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SQLBindable]);
  lazy protocol witness table accessor for type [SQLBindable] and conformance [A]();
  Sequence.enumerated()();
  v10[5] = v10[7];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<[SQLBindable]>);
  EnumeratedSequence.makeIterator()();
  for (i = v5; ; i = 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<[SQLBindable]>.Iterator);
    EnumeratedSequence.Iterator.next()();
    outlined init with take of (offset: Int, element: SQLBindable)?(v8, &v9);
    if (!v10[3])
    {
      result = v11;
      outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator();
      return result;
    }
    v3 = v9;
    result = outlined init with take of SQLBindable(v10, __dst);
    if (__OFADD__(v3, 1))
      break;
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v4 + 184))(v3 + 1, __dst);
    if (i)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
      result = v11;
      outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator();
      return result;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [SQLBindable] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [SQLBindable] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SQLBindable] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SQLBindable]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [SQLBindable] and conformance [A]);
    return v1;
  }
  return v3;
}

void *outlined init with take of (offset: Int, element: SQLBindable)?(const void *a1, void *a2)
{
  memcpy(a2, a1, 0x30uLL);
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator()
{
  swift_bridgeObjectRelease();
}

void *outlined init with take of SQLBindable(const void *a1, void *__dst)
{
  memcpy(__dst, a1, 0x28uLL);
  return __dst;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

uint64_t SQLiteDB.Statement.deinit()
{
  uint64_t v0;
  uint64_t v2;

  sqlite3_finalize(*(sqlite3_stmt **)(v0 + 16));
  return v2;
}

uint64_t SQLiteDB.Statement.__deallocating_deinit()
{
  SQLiteDB.Statement.deinit();
  return swift_deallocClassInstance();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Row.statement.getter()
{
  swift_retain();
}

uint64_t SQLiteDB.Row.get<A>(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_retain();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a1);
}

{
  swift_retain();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a1);
}

uint64_t variable initialization expression of SQLiteDB.Transaction.finalized()
{
  return 0;
}

uint64_t key path getter for SQLiteDB.Transaction.finalized : SQLiteDB.Transaction@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 96))(v2) & 1;
  return swift_release();
}

uint64_t key path setter for SQLiteDB.Transaction.finalized : SQLiteDB.Transaction(char *a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;

  v4 = *a1;
  v3 = *a2;
  swift_retain();
  (*(void (**)(_QWORD))(*(_QWORD *)v3 + 104))(v4 & 1);
  return swift_release();
}

uint64_t SQLiteDB.Transaction.finalized.getter()
{
  uint64_t v0;
  char v2;

  swift_beginAccess();
  v2 = *(_BYTE *)(v0 + 24);
  swift_endAccess();
  return v2 & 1;
}

uint64_t SQLiteDB.Transaction.finalized.setter(char a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_BYTE *)(v1 + 24) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*SQLiteDB.Transaction.finalized.modify())()
{
  swift_beginAccess();
  return SQLiteDB.Transaction.finalized.modify;
}

uint64_t SQLiteDB.Transaction.finalized.modify()
{
  return swift_endAccess();
}

uint64_t SQLiteDB.Transaction.__allocating_init(_:)(uint64_t a1)
{
  swift_allocObject();
  return SQLiteDB.Transaction.init(_:)(a1);
}

uint64_t SQLiteDB.Transaction.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v4;

  *(_BYTE *)(v1 + 24) = 0;
  swift_retain();
  *(_QWORD *)(v1 + 16) = a1;
  swift_release();
  return v4;
}

uint64_t SQLiteDB.Transaction.withStatement<A>(sql:handler:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v3;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v17;

  if (((*(uint64_t (**)(void))(*(_QWORD *)v3 + 96))() & 1) != 0)
  {
    v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    v11 = SQLError.init(code:desc:)(1, v5._countAndFlagsBits, v5._object);
    v9 = v6;
    v10 = v7;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    v12 = swift_allocError();
    *(_DWORD *)v8 = v11;
    *(_QWORD *)(v8 + 8) = v9;
    *(_QWORD *)(v8 + 16) = v10;
    swift_willThrow();
    return v12;
  }
  else
  {
    swift_retain();
    v13 = SQLiteDB.makeStatement(with:)(a1, a2);
    if (!v17)
    {
      swift_release();
      swift_retain();
      a3(v13);
      swift_release();
    }
    return swift_release();
  }
}

uint64_t SQLiteDB.makeStatement(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v29 = a1;
  v30 = a2;
  v38 = 0;
  v36 = 0;
  v35 = 0;
  v42 = a1;
  v43 = a2;
  v41 = v2;
  v33 = *(_QWORD *)(v2 + 112);
  swift_retain();
  v32 = &v40;
  swift_beginAccess();
  v34 = *(unsigned __int8 *)(v33 + 24);
  swift_endAccess();
  swift_release();
  if ((v34 & 1) != 0)
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    v13[0] = swift_allocError();
    *v12 = 3;
    swift_willThrow();
    v18 = v13[0];
  }
  else
  {
    v25 = &v39;
    v39 = 0;
    v3 = v31;
    v26 = String.utf8CString.getter();
    v38 = v26;
    swift_retain();
    swift_retain();
    v27 = v13;
    MEMORY[0x24BDAC7A8](v13);
    ContiguousArray.withUnsafeBufferPointer<A>(_:)();
    v28 = v3;
    if (v3)
    {
      __break(1u);
    }
    else
    {
      swift_release();
      swift_release();
      v22 = v37;
      v36 = v37;
      v23 = v39;
      if (v39)
      {
        v21 = v23;
        v20 = v23;
        v35 = v23;
        if (!v22)
        {
          type metadata accessor for SQLiteDB.Statement();
          v19 = SQLiteDB.Statement.__allocating_init(handle:)(v20);
          swift_release();
          return v19;
        }
      }
      v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to prepare statement", 0x1BuLL, 1);
      v13[1] = v5._countAndFlagsBits;
      v16 = SQLError.init(code:desc:)(v22, v5._countAndFlagsBits, v5._object);
      v14 = v6;
      v15 = v7;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      v8 = swift_allocError();
      v9 = v14;
      v10 = v15;
      v17 = v8;
      *(_DWORD *)v11 = v16;
      *(_QWORD *)(v11 + 8) = v9;
      *(_QWORD *)(v11 + 16) = v10;
      swift_willThrow();
      swift_release();
      v18 = v17;
    }
  }
  return v24;
}

Swift::Int64 __swiftcall SQLiteDB.Transaction.changes()()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  sqlite3 *v4;

  v2 = *(_QWORD *)(v0 + 16);
  swift_retain();
  v3 = *(_QWORD *)(v2 + 112);
  swift_retain();
  swift_release();
  v4 = *(sqlite3 **)(v3 + 16);
  swift_release();
  return sqlite3_changes64(v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Transaction.commit()()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  if (((*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))() & 1) != 0)
  {
    v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    v7 = SQLError.init(code:desc:)(1, v1._countAndFlagsBits, v1._object);
    v5 = v2;
    v6 = v3;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)v4 = v7;
    *(_QWORD *)(v4 + 8) = v5;
    *(_QWORD *)(v4 + 16) = v6;
    swift_willThrow();
  }
  else
  {
    swift_retain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("COMMIT", 6uLL, 1);
    SQLiteDB.executeRaw(_:)();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 104))(1);
  }
}

uint64_t SQLiteDB.executeRaw(_:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  sqlite3 *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v18 = *(_QWORD *)(v0 + 112);
  swift_retain();
  swift_beginAccess();
  v19 = *(_BYTE *)(v18 + 24);
  swift_endAccess();
  swift_release();
  if ((v19 & 1) != 0)
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    v7 = swift_allocError();
    *v6 = 3;
    swift_willThrow();
    return v7;
  }
  else
  {
    v13 = *(_QWORD *)(v17 + 112);
    swift_retain();
    v14 = *(sqlite3 **)(v13 + 16);
    swift_release();
    swift_bridgeObjectRetain();
    v15 = String.utf8CString.getter();
    swift_retain();
    swift_release();
    swift_retain();
    swift_bridgeObjectRelease();
    v16 = sqlite3_exec(v14, (const char *)(v15 + 32), 0, 0, 0);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    result = v16;
    if (v16)
    {
      v8 = default argument 1 of SQLError.init(code:desc:)();
      v11 = SQLError.init(code:desc:)(v16, v8, v2);
      v9 = v3;
      v10 = v4;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      v12 = swift_allocError();
      *(_DWORD *)v5 = v11;
      *(_QWORD *)(v5 + 8) = v9;
      *(_QWORD *)(v5 + 16) = v10;
      swift_willThrow();
      return v12;
    }
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Transaction.rollback()()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  if (((*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))() & 1) != 0)
  {
    v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    v7 = SQLError.init(code:desc:)(1, v1._countAndFlagsBits, v1._object);
    v5 = v2;
    v6 = v3;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)v4 = v7;
    *(_QWORD *)(v4 + 8) = v5;
    *(_QWORD *)(v4 + 16) = v6;
    swift_willThrow();
  }
  else
  {
    swift_retain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ROLLBACK", 8uLL, 1);
    SQLiteDB.executeRaw(_:)();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 104))(1);
  }
}

uint64_t SQLiteDB.Transaction.deinit()
{
  uint64_t v1;

  swift_release();
  return v1;
}

uint64_t SQLiteDB.Transaction.__deallocating_deinit()
{
  SQLiteDB.Transaction.deinit();
  return swift_deallocClassInstance();
}

uint64_t SQLiteDB.__allocating_init(_:)(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = SQLiteDB.init(_:)(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t SQLiteDB.init(_:)(const void *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t countAndFlagsBits;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  sqlite3 *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  uint64_t v39;
  const char *v40;
  sqlite3 *v41;
  uint64_t v42;
  void *object;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  const void *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v49 = a1;
  v45 = *v1;
  v59 = 0;
  v58 = 0;
  v57 = 0;
  v56 = 0;
  v55 = 0;
  v48 = 0;
  v47 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SQLiteDB.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v46);
  v51 = (char *)v21 - v47;
  v59 = v3;
  v58 = v2;
  swift_defaultActor_initialize();
  type metadata accessor for SQLiteDB.DBHandle();
  outlined init with copy of SQLiteDB.Location(v49, v51);
  v4 = v50;
  v5 = SQLiteDB.DBHandle.__allocating_init(location:)((uint64_t)v51);
  v52 = v4;
  v53 = v5;
  v54 = v4;
  if (v4)
  {
    v32 = v54;
    v33 = v46;
  }
  else
  {
    v39 = v53;
    v57 = v53;
    v41 = *(sqlite3 **)(v53 + 16);
    object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PRAGMA journal_mode=WAL;", 0x18uLL, 1)._object;
    v42 = String.utf8CString.getter();
    swift_retain();
    swift_release();
    swift_retain();
    v40 = (const char *)(v42 + 32);
    swift_bridgeObjectRelease();
    v44 = sqlite3_exec(v41, v40, 0, 0, 0);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v56 = v44;
    if (v44)
    {
      v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to enable WAL", 0x14uLL, 1);
      v21[3] = v14._countAndFlagsBits;
      v24 = SQLError.init(code:desc:)(v44, v14._countAndFlagsBits, v14._object);
      v22 = v15;
      v23 = v16;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      v17 = swift_allocError();
      v18 = v22;
      v19 = v23;
      v25 = v17;
      *(_DWORD *)v20 = v24;
      *(_QWORD *)(v20 + 8) = v18;
      *(_QWORD *)(v20 + 16) = v19;
      swift_willThrow();
      swift_release();
      v32 = v25;
      v33 = v46;
    }
    else
    {
      v35 = *(sqlite3 **)(v39 + 16);
      v37 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PRAGMA foreign_keys=ON;", 0x17uLL, 1)._object;
      v36 = String.utf8CString.getter();
      swift_retain();
      swift_release();
      swift_retain();
      v34 = (const char *)(v36 + 32);
      swift_bridgeObjectRelease();
      v38 = sqlite3_exec(v35, v34, 0, 0, 0);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v55 = v38;
      if (!v38)
      {
        swift_retain();
        *(_QWORD *)(v46 + 112) = v39;
        swift_release();
        outlined destroy of SQLiteDB.Location((uint64_t)v49);
        return v46;
      }
      v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to enable FK", 0x13uLL, 1);
      countAndFlagsBits = v7._countAndFlagsBits;
      v30 = SQLError.init(code:desc:)(v38, v7._countAndFlagsBits, v7._object);
      v28 = v8;
      v29 = v9;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      v10 = swift_allocError();
      v11 = v28;
      v12 = v29;
      v31 = v10;
      *(_DWORD *)v13 = v30;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(v13 + 16) = v12;
      swift_willThrow();
      swift_release();
      v32 = v31;
      v33 = v46;
    }
  }
  v21[1] = v33;
  v21[2] = v32;
  swift_defaultActor_destroy();
  swift_deallocPartialClassInstance();
  outlined destroy of SQLiteDB.Location((uint64_t)v49);
  return v26;
}

uint64_t closure #1 in SQLiteDB.makeStatement(with:)@<X0>(uint64_t a1@<X2>, sqlite3_stmt **a2@<X4>, _DWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v6;
  sqlite3 *v7;
  const char *v8;
  int v9;

  v6 = *(_QWORD *)(a1 + 112);
  swift_retain();
  v7 = *(sqlite3 **)(v6 + 16);
  swift_release();
  v8 = (const char *)UnsafeBufferPointer.baseAddress.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  ContiguousArray.count.getter();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  result = sqlite3_prepare_v2(v7, v8, v9, a2, 0);
  *a3 = result;
  return result;
}

uint64_t partial apply for closure #1 in SQLiteDB.makeStatement(with:)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;

  return closure #1 in SQLiteDB.makeStatement(with:)(*(_QWORD *)(v1 + 16), *(sqlite3_stmt ***)(v1 + 32), a1);
}

uint64_t type metadata accessor for SQLiteDB.Statement()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SQLiteDB.DBHandle()
{
  return objc_opt_self();
}

uint64_t SQLiteDB.withStatement<A>(sql:handler:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t result;

  result = SQLiteDB.makeStatement(with:)(a1, a2);
  if (!v3)
  {
    a3();
    return swift_release();
  }
  return result;
}

uint64_t SQLiteDB.withTransaction<A>(handler:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *object;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;

  v24 = a4;
  v25 = a1;
  v26 = a2;
  v27 = a3;
  v41 = 0;
  v39 = 0;
  v40 = 0;
  v38 = 0;
  v37 = 0;
  v42 = a3;
  v28 = *(_QWORD *)(a3 - 8);
  v29 = (*(_QWORD *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v30 = (char *)&v13 - v29;
  v41 = (char *)&v13 - v29;
  v39 = MEMORY[0x24BDAC7A8](a1);
  v40 = v5;
  v38 = v4;
  type metadata accessor for SQLiteDB.Transaction();
  swift_retain();
  v32 = SQLiteDB.Transaction.__allocating_init(_:)(v31);
  v37 = v32;
  v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("BEGIN TRANSACTION", 0x11uLL, 1);
  v7 = v33;
  object = v6._object;
  SQLiteDB.executeRaw(_:)();
  v35 = v7;
  v36 = v7;
  if (v7)
  {
    v15 = v36;
    swift_bridgeObjectRelease();
    result = swift_release();
    v16 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = v35;
    v9 = v25(v32);
    v22 = v8;
    v23 = v8;
    if (v8)
    {
      v14 = v23;
      result = swift_release();
      v16 = v14;
    }
    else
    {
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 96))(v9) & 1) != 0)
      {
        v18 = v22;
        goto LABEL_7;
      }
      v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("COMMIT", 6uLL, 1);
      v11 = v22;
      v19 = v10._object;
      SQLiteDB.executeRaw(_:)();
      v20 = v11;
      v21 = v11;
      if (!v11)
      {
        swift_bridgeObjectRelease();
        v18 = v20;
LABEL_7:
        v17 = v18;
        (*(void (**)(uint64_t, char *, uint64_t))(v28 + 16))(v24, v30, v27);
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
        return swift_release();
      }
      v13 = v21;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
      return swift_release();
    }
  }
  return result;
}

uint64_t type metadata accessor for SQLiteDB.Transaction()
{
  return objc_opt_self();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.execute(_:)(Swift::String a1)
{
  SQLiteDB.executeRaw(_:)();
}

Swift::Void __swiftcall SQLiteDB.close()()
{
  swift_retain();
  SQLiteDB.DBHandle.close()();
  swift_release();
}

uint64_t SQLiteDB.deinit()
{
  uint64_t v1;

  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t SQLiteDB.__deallocating_deinit()
{
  SQLiteDB.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t SQLiteDB.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance SQLiteDB()
{
  return SQLiteDB.unownedExecutor.getter();
}

uint64_t SQLNullableType<>.init(with:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  sqlite3_stmt *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;

  v10 = a5;
  v18 = a1;
  v19 = a2;
  v11 = a3;
  v12 = a4;
  v28 = 0;
  v27 = 0;
  v26 = 0;
  v29 = a3;
  v13 = *(_QWORD *)(a3 - 8);
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v10 - v14;
  v16 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v17 = (char *)&v10 - v16;
  v28 = (char *)&v10 - v16;
  v27 = v7;
  v26 = v8;
  swift_retain();
  v23 = *(sqlite3_stmt **)(v18 + 16);
  swift_release();
  v22 = &v24;
  v24 = v19;
  v20 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  v21 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  if (sqlite3_column_type(v23, v25) == 5)
  {
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v10, 1, 1, v11);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v18, v19);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v15, v11);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v10, v17, v11);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v11);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v11);
  }
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE3FD8], MEMORY[0x24BEE3F88]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE3FB0], MEMORY[0x24BEE3F88]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE3FC8], MEMORY[0x24BEE3F88]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return v0;
  }
  return v2;
}

uint64_t Int.init(with:column:)(uint64_t a1)
{
  sqlite3_stmt *v2;
  int v4;
  uint64_t v5;

  swift_retain();
  v2 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  sqlite3_column_int(v2, v4);
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)();
  swift_release();
  return v5;
}

uint64_t Int.bind(to:at:)(uint64_t a1)
{
  uint64_t result;
  Swift::String v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  sqlite3_stmt *v9;
  unsigned int v10;
  int v11;
  int v12;

  v9 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  SignedInteger<>.init<A>(_:)();
  result = sqlite3_bind_int(v9, v12, v11);
  v10 = result;
  if ((_DWORD)result)
  {
    v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Int", 0x12uLL, 1);
    v8 = SQLError.init(code:desc:)(v10, v2._countAndFlagsBits, v2._object);
    v6 = v3;
    v7 = v4;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)v5 = v8;
    *(_QWORD *)(v5 + 8) = v6;
    *(_QWORD *)(v5 + 16) = v7;
    return swift_willThrow();
  }
  return result;
}

uint64_t protocol witness for SQLType.init(with:column:) in conformance Int@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = Int.init(with:column:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Int(uint64_t a1)
{
  return Int.bind(to:at:)(a1);
}

uint64_t Int64.init(with:column:)(uint64_t a1)
{
  sqlite3_stmt *v2;
  int v4;
  uint64_t v5;

  swift_retain();
  v2 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  sqlite3_column_int64(v2, v4);
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  SignedInteger<>.init<A>(_:)();
  swift_release();
  return v5;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE4048], MEMORY[0x24BEE4008]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE4030], MEMORY[0x24BEE4008]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return v0;
  }
  return v2;
}

uint64_t Int64.bind(to:at:)(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  uint64_t result;
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  sqlite3_stmt *v11;
  unsigned int v13;
  int v14;

  v11 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  result = sqlite3_bind_int64(v11, v14, a3);
  v13 = result;
  if ((_DWORD)result)
  {
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Int64", 0x14uLL, 1);
    v10 = SQLError.init(code:desc:)(v13, v4._countAndFlagsBits, v4._object);
    v8 = v5;
    v9 = v6;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)v7 = v10;
    *(_QWORD *)(v7 + 8) = v8;
    *(_QWORD *)(v7 + 16) = v9;
    return swift_willThrow();
  }
  return result;
}

uint64_t protocol witness for SQLType.init(with:column:) in conformance Int64@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = Int64.init(with:column:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Int64(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 *v2;

  return Int64.bind(to:at:)(a1, a2, *v2);
}

double Double.init(with:column:)(uint64_t a1)
{
  double v1;
  sqlite3_stmt *v3;
  int v5;
  double v6;

  swift_retain();
  v3 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  v1 = sqlite3_column_double(v3, v5);
  v6 = Double.init(_:)(v1);
  swift_release();
  return v6;
}

uint64_t Double.bind(to:at:)(uint64_t a1, double a2)
{
  uint64_t result;
  Swift::String v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  sqlite3_stmt *v10;
  unsigned int v12;
  int v13;

  v10 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  result = sqlite3_bind_double(v10, v13, a2);
  v12 = result;
  if ((_DWORD)result)
  {
    v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Double", 0x15uLL, 1);
    v9 = SQLError.init(code:desc:)(v12, v3._countAndFlagsBits, v3._object);
    v7 = v4;
    v8 = v5;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)v6 = v9;
    *(_QWORD *)(v6 + 8) = v7;
    *(_QWORD *)(v6 + 16) = v8;
    return swift_willThrow();
  }
  return result;
}

void protocol witness for SQLType.init(with:column:) in conformance Double(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = Double.init(with:column:)(a1);
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Double(uint64_t a1)
{
  double *v1;

  return Double.bind(to:at:)(a1, *v1);
}

uint64_t String.init(with:column:)(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v5;
  int v6;

  swift_retain();
  v5 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  if (sqlite3_column_text(v5, v6))
  {
    v2 = String.init(cString:)();
    swift_bridgeObjectRetain();
    swift_release();
    outlined destroy of String();
    return v2;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t String.bind(to:at:)()
{
  uint64_t result;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;

  String.utf8CString.getter();
  swift_retain();
  swift_retain();
  result = ContiguousArray.withUnsafeBufferPointer<A>(_:)();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
    if (v9)
    {
      v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind String", 0x15uLL, 1);
      v7 = SQLError.init(code:desc:)(v9, v1._countAndFlagsBits, v1._object);
      v5 = v2;
      v6 = v3;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      swift_allocError();
      *(_DWORD *)v4 = v7;
      *(_QWORD *)(v4 + 8) = v5;
      *(_QWORD *)(v4 + 16) = v6;
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in String.bind(to:at:)@<X0>(uint64_t a1@<X2>, _DWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;
  char *v4;
  sqlite3_stmt *v5;
  int v7;
  int v8;

  v5 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  v4 = (char *)UnsafeBufferPointer.baseAddress.getter();
  ContiguousArray.count.getter();
  SignedInteger<>.init<A>(_:)();
  v2 = SQLITE_TRANSIENT.unsafeMutableAddressor();
  result = sqlite3_bind_text(v5, v8, v4, v7, (void (__cdecl *)(void *))*v2);
  *a2 = result;
  return result;
}

uint64_t partial apply for closure #1 in String.bind(to:at:)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;

  return closure #1 in String.bind(to:at:)(*(_QWORD *)(v1 + 16), a1);
}

uint64_t *SQLITE_TRANSIENT.unsafeMutableAddressor()
{
  if (one-time initialization token for SQLITE_TRANSIENT != -1)
    swift_once();
  return &SQLITE_TRANSIENT;
}

uint64_t protocol witness for SQLNullableType.init(with:column:) in conformance String@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = String.init(with:column:)(a1);
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance String()
{
  return String.bind(to:at:)();
}

void one-time initialization function for SQLITE_TRANSIENT()
{
  SQLITE_TRANSIENT = -1;
}

unint64_t base witness table accessor for Error in SQLError()
{
  return lazy protocol witness table accessor for type SQLError and conformance SQLError();
}

unint64_t base witness table accessor for Equatable in DBError()
{
  return lazy protocol witness table accessor for type DBError and conformance DBError();
}

unint64_t base witness table accessor for Error in DBError()
{
  return lazy protocol witness table accessor for type DBError and conformance DBError();
}

uint64_t initializeBufferWithCopyOfBuffer for SQLError(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  result = a1;
  *(_QWORD *)(a1 + 16) = v4;
  return result;
}

uint64_t destroy for SQLError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  result = a1;
  *(_QWORD *)(a1 + 16) = v4;
  return result;
}

uint64_t assignWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for SQLError(uint64_t a1, unsigned int a2)
{
  int v2;
  int v4;
  int v5;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    {
      v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v4 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 16)))
        v4 = *(_QWORD *)(a1 + 16);
      v2 = v4 - 1;
      if (v4 - 1 < 0)
        v2 = -1;
      v5 = v2;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLError(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 24) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 24) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLError()
{
  return &type metadata for SQLError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DBError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFC)
      goto LABEL_15;
    v7 = ((a2 + 3) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 4;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for DBError(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFC)
  {
    v5 = ((a3 + 3) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFC)
  {
    v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 3;
  }
  return result;
}

uint64_t getEnumTag for DBError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for DBError(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLiteDB()
{
  return objc_opt_self();
}

unint64_t initializeBufferWithCopyOfBuffer for SQLiteDB.Location(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  int v11;

  v10 = *(_QWORD *)(a3 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  if ((v11 & 0x20000) != 0)
  {
    v6 = *a2;
    swift_retain();
    *a1 = v6;
    return *a1 + ((v11 + 16) & ~(unint64_t)v11);
  }
  else
  {
    v4 = type metadata accessor for URL();
    v5 = *(_QWORD *)(v4 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v5 + 48))(a2, 1))
    {
      memcpy(a1, a2, *(_QWORD *)(v10 + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v4);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
    }
    return (unint64_t)a1;
  }
}

uint64_t destroy for SQLiteDB.Location(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *initializeWithCopy for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7;
  uint64_t v8;

  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v8 + 48))(a2, 1))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void *assignWithCopy for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(const void *, uint64_t, uint64_t);

  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a1, 1))
  {
    if (v9(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  else if (v9(a2, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v7);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v7);
  }
  return a1;
}

void *initializeWithTake for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7;
  uint64_t v8;

  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v8 + 48))(a2, 1))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void *assignWithTake for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(const void *, uint64_t, uint64_t);

  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a1, 1))
  {
    if (v9(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  else if (v9(a2, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v7);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v7);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteDB.Location()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24153DA30(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;

  v2 = type metadata accessor for URL();
  v3 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 8) + 48))(a1, a2);
  if (v3 > 1)
    return v3 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SQLiteDB.Location()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24153DAA8(uint64_t a1, int a2, unsigned int a3)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v7;

  if (a2)
    v3 = a2 + 1;
  else
    v3 = 0;
  v7 = v3;
  v4 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v4 - 8) + 56))(a1, v7, a3);
}

uint64_t getEnumTag for SQLiteDB.Location(uint64_t a1)
{
  uint64_t v1;

  v1 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for SQLiteDB.Location(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, a2, 1);
}

uint64_t type metadata completion function for SQLiteDB.Location()
{
  unint64_t v0;
  uint64_t v2;

  v2 = type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return v2;
}

ValueMetadata *type metadata accessor for SQLiteDB.Row()
{
  return &type metadata for SQLiteDB.Row;
}

Swift::Double *kSecondsFromNanoseconds.unsafeMutableAddressor()
{
  return &kSecondsFromNanoseconds;
}

uint64_t one-time initialization function for kMediaML_rssi()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rssi", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rssi = v1;
  return result;
}

Swift::String *kMediaML_rssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rssi != -1)
    swift_once();
  return &kMediaML_rssi;
}

uint64_t one-time initialization function for kMediaML_cca()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cca", 3uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_cca = v1;
  return result;
}

Swift::String *kMediaML_cca.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_cca != -1)
    swift_once();
  return &kMediaML_cca;
}

uint64_t one-time initialization function for kMediaML_snr()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("snr", 3uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_snr = v1;
  return result;
}

Swift::String *kMediaML_snr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_snr != -1)
    swift_once();
  return &kMediaML_snr;
}

uint64_t one-time initialization function for kMediaML_noise()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("noise", 5uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_noise = v1;
  return result;
}

Swift::String *kMediaML_noise.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_noise != -1)
    swift_once();
  return &kMediaML_noise;
}

uint64_t one-time initialization function for kMediaML_throughputTrue()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("throughput_true", 0xFuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_throughputTrue = v1;
  return result;
}

Swift::String *kMediaML_throughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputTrue != -1)
    swift_once();
  return &kMediaML_throughputTrue;
}

uint64_t one-time initialization function for kMediaML_txRate()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tx_rate", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_txRate = v1;
  return result;
}

Swift::String *kMediaML_txRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_txRate != -1)
    swift_once();
  return &kMediaML_txRate;
}

uint64_t one-time initialization function for kMediaML_rxRate()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rx_rate", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rxRate = v1;
  return result;
}

Swift::String *kMediaML_rxRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rxRate != -1)
    swift_once();
  return &kMediaML_rxRate;
}

uint64_t one-time initialization function for kMediaML_dayOfWeek()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dow", 3uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_dayOfWeek = v1;
  return result;
}

Swift::String *kMediaML_dayOfWeek.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_dayOfWeek != -1)
    swift_once();
  return &kMediaML_dayOfWeek;
}

uint64_t one-time initialization function for kMediaML_hourOfDay()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hour", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_hourOfDay = v1;
  return result;
}

Swift::String *kMediaML_hourOfDay.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_hourOfDay != -1)
    swift_once();
  return &kMediaML_hourOfDay;
}

uint64_t one-time initialization function for kMediaML_ssid()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_ssid = v1;
  return result;
}

Swift::String *kMediaML_ssid.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssid != -1)
    swift_once();
  return &kMediaML_ssid;
}

uint64_t one-time initialization function for kMediaML_interfaceType()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ifty", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_interfaceType = v1;
  return result;
}

Swift::String *kMediaML_interfaceType.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_interfaceType != -1)
    swift_once();
  return &kMediaML_interfaceType;
}

uint64_t one-time initialization function for kMediaML_nData()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ndata", 5uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_nData = v1;
  return result;
}

Swift::String *kMediaML_nData.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_nData != -1)
    swift_once();
  return &kMediaML_nData;
}

uint64_t one-time initialization function for kMediaML_appName()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name", 8uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_appName = v1;
  return result;
}

Swift::String *kMediaML_appName.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appName != -1)
    swift_once();
  return &kMediaML_appName;
}

uint64_t one-time initialization function for kMediaML_sessionID()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("session_id", 0xAuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_sessionID = v1;
  return result;
}

Swift::String *kMediaML_sessionID.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionID != -1)
    swift_once();
  return &kMediaML_sessionID;
}

uint64_t one-time initialization function for kMediaML_carrier()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carrier", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_carrier = v1;
  return result;
}

Swift::String *kMediaML_carrier.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_carrier != -1)
    swift_once();
  return &kMediaML_carrier;
}

uint64_t one-time initialization function for kMediaML_rsrp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrp", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rsrp = v1;
  return result;
}

Swift::String *kMediaML_rsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrp != -1)
    swift_once();
  return &kMediaML_rsrp;
}

uint64_t one-time initialization function for kMediaML_rscp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rscp", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rscp = v1;
  return result;
}

Swift::String *kMediaML_rscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rscp != -1)
    swift_once();
  return &kMediaML_rscp;
}

uint64_t one-time initialization function for kMediaML_rsrq()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrq", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rsrq = v1;
  return result;
}

Swift::String *kMediaML_rsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrq != -1)
    swift_once();
  return &kMediaML_rsrq;
}

uint64_t one-time initialization function for kMediaML_bars()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bars", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_bars = v1;
  return result;
}

Swift::String *kMediaML_bars.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_bars != -1)
    swift_once();
  return &kMediaML_bars;
}

uint64_t one-time initialization function for kMediaML_count()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("count", 5uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_count = v1;
  return result;
}

Swift::String *kMediaML_count.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_count != -1)
    swift_once();
  return &kMediaML_count;
}

uint64_t one-time initialization function for kMediaML_medianThroughputTrue()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("quantile(throughput_true)", 0x19uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_medianThroughputTrue = v1;
  return result;
}

Swift::String *kMediaML_medianThroughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_medianThroughputTrue != -1)
    swift_once();
  return &kMediaML_medianThroughputTrue;
}

uint64_t one-time initialization function for kMediaML_binnedRssi()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rssi", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRssi = v1;
  return result;
}

Swift::String *kMediaML_binnedRssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRssi != -1)
    swift_once();
  return &kMediaML_binnedRssi;
}

uint64_t one-time initialization function for kMediaML_binnedRsrp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrp", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRsrp = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrp != -1)
    swift_once();
  return &kMediaML_binnedRsrp;
}

uint64_t one-time initialization function for kMediaML_binnedRsrq()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrq", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRsrq = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrq != -1)
    swift_once();
  return &kMediaML_binnedRsrq;
}

uint64_t one-time initialization function for kMediaML_binnedRscp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rscp", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRscp = v1;
  return result;
}

Swift::String *kMediaML_binnedRscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRscp != -1)
    swift_once();
  return &kMediaML_binnedRscp;
}

uint64_t one-time initialization function for kMediaML_binnedSnr()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_snr", 0xAuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedSnr = v1;
  return result;
}

Swift::String *kMediaML_binnedSnr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedSnr != -1)
    swift_once();
  return &kMediaML_binnedSnr;
}

uint64_t one-time initialization function for kMediaML_throughputStdDev()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predStdDev", 0xAuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_throughputStdDev = v1;
  return result;
}

Swift::String *kMediaML_throughputStdDev.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputStdDev != -1)
    swift_once();
  return &kMediaML_throughputStdDev;
}

uint64_t one-time initialization function for kMediaML_throughputPrediction()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predVal", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_throughputPrediction = v1;
  return result;
}

Swift::String *kMediaML_throughputPrediction.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputPrediction != -1)
    swift_once();
  return &kMediaML_throughputPrediction;
}

Swift::Int *cell_signal_binsize.unsafeMutableAddressor()
{
  return &cell_signal_binsize;
}

Swift::Int *cell_snr_binsize.unsafeMutableAddressor()
{
  return &cell_snr_binsize;
}

Swift::Int *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_low_medium_boundary;
}

Swift::Int *rssiBucket_medium_high_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_medium_high_boundary;
}

uint64_t one-time initialization function for rssiBucket_low()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("low", 3uLL, 1);
  result = v1._countAndFlagsBits;
  rssiBucket_low = v1;
  return result;
}

Swift::String *rssiBucket_low.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_low != -1)
    swift_once();
  return &rssiBucket_low;
}

uint64_t one-time initialization function for rssiBucket_medium()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("medium", 6uLL, 1);
  result = v1._countAndFlagsBits;
  rssiBucket_medium = v1;
  return result;
}

Swift::String *rssiBucket_medium.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_medium != -1)
    swift_once();
  return &rssiBucket_medium;
}

uint64_t one-time initialization function for rssiBucket_high()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("high", 4uLL, 1);
  result = v1._countAndFlagsBits;
  rssiBucket_high = v1;
  return result;
}

Swift::String *rssiBucket_high.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_high != -1)
    swift_once();
  return &rssiBucket_high;
}

uint64_t one-time initialization function for kMediaML_trainingRowCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingRowCount", 0x10uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_trainingRowCount = v1;
  return result;
}

Swift::String *kMediaML_trainingRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingRowCount != -1)
    swift_once();
  return &kMediaML_trainingRowCount;
}

uint64_t one-time initialization function for kMediaML_validationRowCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationRowCount", 0x12uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_validationRowCount = v1;
  return result;
}

Swift::String *kMediaML_validationRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationRowCount != -1)
    swift_once();
  return &kMediaML_validationRowCount;
}

uint64_t one-time initialization function for kMediaML_ssidCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssidCount", 9uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_ssidCount = v1;
  return result;
}

Swift::String *kMediaML_ssidCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssidCount != -1)
    swift_once();
  return &kMediaML_ssidCount;
}

uint64_t one-time initialization function for kMediaML_appNameCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("appNameCount", 0xCuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_appNameCount = v1;
  return result;
}

Swift::String *kMediaML_appNameCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appNameCount != -1)
    swift_once();
  return &kMediaML_appNameCount;
}

uint64_t one-time initialization function for kMediaML_sessionIDCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sessionIDCount", 0xEuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_sessionIDCount = v1;
  return result;
}

Swift::String *kMediaML_sessionIDCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionIDCount != -1)
    swift_once();
  return &kMediaML_sessionIDCount;
}

uint64_t one-time initialization function for kMediaML_trainingMAPE()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingMAPE", 0xCuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_trainingMAPE = v1;
  return result;
}

Swift::String *kMediaML_trainingMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingMAPE != -1)
    swift_once();
  return &kMediaML_trainingMAPE;
}

uint64_t one-time initialization function for kMediaML_validationMAPE()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationMAPE", 0xEuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_validationMAPE = v1;
  return result;
}

Swift::String *kMediaML_validationMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationMAPE != -1)
    swift_once();
  return &kMediaML_validationMAPE;
}

uint64_t one-time initialization function for mediaMLBaseDirectory()
{
  uint64_t v1;

  v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLBaseDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLBaseDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/", 0x24uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLBaseDirectory.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for mediaMLBaseDirectory != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLBaseDirectory);
}

uint64_t one-time initialization function for mediaMLModelDirectory()
{
  uint64_t v1;

  v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLModelDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLModelDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/model/", 0x2AuLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLModelDirectory.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for mediaMLModelDirectory != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLModelDirectory);
}

uint64_t one-time initialization function for mediaMLDataDirectory()
{
  uint64_t v1;

  v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLDataDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLDataDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/data/", 0x29uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLDataDirectory.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for mediaMLDataDirectory != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLDataDirectory);
}

Swift::Int *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_RAW_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_WRITE;
}

Swift::Int *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor()
{
  return &DB_DELETION_BUCKET_SIZE;
}

Swift::Int *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_WiFi;
}

Swift::Int *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_Cellular;
}

Swift::Int *maxThroughput.unsafeMutableAddressor()
{
  return &maxThroughput;
}

Swift::Int *minSignalStrength.unsafeMutableAddressor()
{
  return &minSignalStrength;
}

Swift::Int *minNoise.unsafeMutableAddressor()
{
  return &minNoise;
}

Swift::Double *maxTxRate.unsafeMutableAddressor()
{
  return &maxTxRate;
}

Swift::Double *maxRxRate.unsafeMutableAddressor()
{
  return &maxRxRate;
}

Swift::Int *minSSIDLength.unsafeMutableAddressor()
{
  return &minSSIDLength;
}

Swift::Int *maxSSIDLength.unsafeMutableAddressor()
{
  return &maxSSIDLength;
}

Swift::Int *maxBars.unsafeMutableAddressor()
{
  return &maxBars;
}

Swift::Double *testTrainSplitRatio.unsafeMutableAddressor()
{
  return &testTrainSplitRatio;
}

Swift::Int *seed.unsafeMutableAddressor()
{
  return &seed;
}

Swift::Int *maxIters.unsafeMutableAddressor()
{
  return &maxIters;
}

Swift::Int *maxDepth.unsafeMutableAddressor()
{
  return &maxDepth;
}

Swift::Double *minimumLossReduction.unsafeMutableAddressor()
{
  return &minimumLossReduction;
}

Swift::Int *parallelTreeCount.unsafeMutableAddressor()
{
  return &parallelTreeCount;
}

Swift::Double *modelMAPEThreshold.unsafeMutableAddressor()
{
  return &modelMAPEThreshold;
}

uint64_t variable initialization expression of ModelStats.interfaceType()
{
  return 0;
}

uint64_t ModelStats.interfaceType.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ModelStats.interfaceType.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ModelStats.interfaceType.modify())()
{
  return ModelStats.interfaceType.modify;
}

uint64_t variable initialization expression of ModelStats.trainingRowCount()
{
  return 0;
}

uint64_t ModelStats.trainingRowCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t ModelStats.trainingRowCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*ModelStats.trainingRowCount.modify())()
{
  return ModelStats.trainingRowCount.modify;
}

uint64_t variable initialization expression of ModelStats.validationRowCount()
{
  return 0;
}

uint64_t ModelStats.validationRowCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ModelStats.validationRowCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*ModelStats.validationRowCount.modify())()
{
  return ModelStats.validationRowCount.modify;
}

uint64_t variable initialization expression of ModelStats.carrierCount()
{
  return 0;
}

uint64_t ModelStats.carrierCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t ModelStats.carrierCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*ModelStats.carrierCount.modify())()
{
  return ModelStats.carrierCount.modify;
}

uint64_t variable initialization expression of ModelStats.ssidCount()
{
  return 0;
}

uint64_t ModelStats.ssidCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t ModelStats.ssidCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*ModelStats.ssidCount.modify())()
{
  return ModelStats.ssidCount.modify;
}

uint64_t variable initialization expression of ModelStats.appNameCount()
{
  return 0;
}

uint64_t ModelStats.appNameCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t ModelStats.appNameCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t (*ModelStats.appNameCount.modify())()
{
  return ModelStats.appNameCount.modify;
}

uint64_t variable initialization expression of ModelStats.sessionIDCount()
{
  return 0;
}

uint64_t ModelStats.sessionIDCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t ModelStats.sessionIDCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

uint64_t (*ModelStats.sessionIDCount.modify())()
{
  return ModelStats.sessionIDCount.modify;
}

double variable initialization expression of ModelStats.trainingMAPE()
{
  return 0.0;
}

double ModelStats.trainingMAPE.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

void ModelStats.trainingMAPE.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 56) = a1;
}

uint64_t (*ModelStats.trainingMAPE.modify())()
{
  return ModelStats.trainingMAPE.modify;
}

double variable initialization expression of ModelStats.validationMAPE()
{
  return 0.0;
}

double ModelStats.validationMAPE.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void ModelStats.validationMAPE.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 64) = a1;
}

uint64_t (*ModelStats.validationMAPE.modify())()
{
  return ModelStats.validationMAPE.modify;
}

uint64_t variable initialization expression of ModelStats.trainingDate()
{
  return 0;
}

uint64_t ModelStats.trainingDate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t ModelStats.trainingDate.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = result;
  return result;
}

uint64_t (*ModelStats.trainingDate.modify())()
{
  return ModelStats.trainingDate.modify;
}

void __swiftcall ModelStats.init()(MediaML::ModelStats *__return_ptr retstr)
{
  retstr->interfaceType = 0;
  retstr->trainingRowCount = 0;
  retstr->validationRowCount = 0;
  retstr->carrierCount = 0;
  retstr->ssidCount = 0;
  retstr->appNameCount = 0;
  retstr->sessionIDCount = 0;
  retstr->trainingMAPE = 0.0;
  retstr->validationMAPE = 0.0;
  retstr->trainingDate = 0;
}

uint64_t default argument 0 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 1 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 2 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 3 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 4 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 5 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 6 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

double default argument 7 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0.0;
}

double default argument 8 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0.0;
}

uint64_t default argument 9 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

void __swiftcall ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)(MediaML::ModelStats *__return_ptr retstr, Swift::Int interfaceType, Swift::Int trainingRowCount, Swift::Int validationRowCount, Swift::Int carrierCount, Swift::Int ssidCount, Swift::Int appNameCount, Swift::Int sessionIDCount, Swift::Double trainingMAPE, Swift::Double validationMAPE, Swift::Int trainingDate)
{
  retstr->interfaceType = interfaceType;
  retstr->trainingRowCount = trainingRowCount;
  retstr->validationRowCount = validationRowCount;
  retstr->carrierCount = carrierCount;
  retstr->ssidCount = ssidCount;
  retstr->appNameCount = appNameCount;
  retstr->sessionIDCount = sessionIDCount;
  retstr->trainingMAPE = trainingMAPE;
  retstr->validationMAPE = validationMAPE;
  retstr->trainingDate = trainingDate;
}

Swift::Int __swiftcall getDateInEpoch()()
{
  double v0;
  _QWORD v2[6];
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;

  v2[1] = "Fatal error";
  v2[2] = "Double value cannot be converted to Int because it is either infinite or NaN";
  v2[3] = "Swift/IntegerTypes.swift";
  v2[4] = "Double value cannot be converted to Int because the result would be less than Int.min";
  v2[5] = "Double value cannot be converted to Int because the result would be greater than Int.max";
  v8 = 0;
  v6 = type metadata accessor for Date();
  v4 = *(_QWORD *)(v6 - 8);
  v3 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v5 = (char *)v2 - v3;
  Date.init()();
  Date.timeIntervalSince1970.getter();
  v7 = v0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v5, v6);
  if (((*(_QWORD *)&v7 >> 52) & 0x7FFLL) == 0x7FF)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v7 <= -9.22337204e18)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v7 >= 9.22337204e18)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return (uint64_t)v7;
}

uint64_t WiFiModelGuts.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  Swift::String *v3;
  Swift::String *v4;
  uint64_t v5;
  _QWORD *v6;
  Swift::String *v7;
  Swift::String *v8;
  Swift::String *v9;
  Swift::String *v10;
  Swift::String *v11;
  Swift::String *v12;
  Swift::String *v13;
  Swift::String *v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;

  v34 = a1;
  v47 = 0;
  v46 = 0;
  v45 = 0;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  v36 = *(_QWORD *)(v38 - 8);
  v18 = (*(_QWORD *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v17 - v18;
  v47 = (char *)&v17 - v18;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OneHotEncoder<String>);
  v19 = (*(_QWORD *)(*(_QWORD *)(v26 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v26);
  v25 = (char *)&v17 - v19;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  v39 = *(_QWORD *)(v41 - 8);
  v20 = (*(_QWORD *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v17 - v20;
  v46 = (char *)&v17 - v20;
  v44 = type metadata accessor for BoostedTreeConfiguration();
  v42 = *(_QWORD *)(v44 - 8);
  v21 = (*(_QWORD *)(v42 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v44);
  v33 = (char *)&v17 - v21;
  v22 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v17 - v21);
  v43 = (char *)&v17 - v22;
  v45 = (char *)&v17 - v22;
  BoostedTreeConfiguration.init()();
  BoostedTreeConfiguration.randomSeed.setter();
  BoostedTreeConfiguration.maximumIterations.setter();
  BoostedTreeConfiguration.maximumDepth.setter();
  v29 = MEMORY[0x24BEE0D00];
  v24 = _allocateUninitializedArray<A>(_:)();
  v23 = v2;
  v3 = kMediaML_ssid.unsafeMutableAddressor();
  outlined init with copy of String(v3, v23);
  v4 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v4, v23 + 2);
  v5 = v24;
  _finalizeUninitializedArray<A>(_:)();
  v27 = v5;
  OneHotEncoder.init()();
  lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>();
  ColumnSelector.init(columns:estimator:)();
  v31 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v30 = _allocateUninitializedArray<A>(_:)();
  v28 = v6;
  v7 = kMediaML_rssi.unsafeMutableAddressor();
  outlined init with copy of String(v7, v28);
  v8 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v8, v28 + 2);
  v9 = kMediaML_ssid.unsafeMutableAddressor();
  outlined init with copy of String(v9, v28 + 4);
  v10 = kMediaML_hourOfDay.unsafeMutableAddressor();
  outlined init with copy of String(v10, v28 + 6);
  v11 = kMediaML_dayOfWeek.unsafeMutableAddressor();
  outlined init with copy of String(v11, v28 + 8);
  v12 = kMediaML_noise.unsafeMutableAddressor();
  outlined init with copy of String(v12, v28 + 10);
  v13 = kMediaML_txRate.unsafeMutableAddressor();
  outlined init with copy of String(v13, v28 + 12);
  v14 = kMediaML_rxRate.unsafeMutableAddressor();
  outlined init with copy of String(v14, v28 + 14);
  v15 = v30;
  _finalizeUninitializedArray<A>(_:)();
  v32 = v15;
  BoostedTreeConfiguration.init()();
  BoostedTreeRegressor.init(annotationColumnName:featureColumnNames:configuration:)();
  v35 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  UpdatableTabularEstimator.appending<A>(_:)();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v43, v44);
}

_QWORD *outlined init with copy of String(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  *a2 = *a1;
  v4 = a1[1];
  swift_bridgeObjectRetain();
  result = a2;
  a2[1] = v4;
  return result;
}

unint64_t lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>;
  if (!lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for OneHotEncoder<String>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDC5978], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>;
  if (!lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for OneHotEncoder<String>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDC5970], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>);
    return v1;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = lazy protocol witness table cache variable for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>;
  if (!lazy protocol witness table cache variable for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    v4 = lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>();
    v0 = MEMORY[0x242696A30](MEMORY[0x24BDC59B0], v2, &v4);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>);
    return v0;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>;
  if (!lazy protocol witness table cache variable for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDC5BF0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>);
    return v1;
  }
  return v3;
}

uint64_t CellModelGuts.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  Swift::String *v3;
  Swift::String *v4;
  uint64_t v5;
  Swift::String *v6;
  _QWORD *v7;
  Swift::String *v8;
  Swift::String *v9;
  Swift::String *v10;
  Swift::String *v11;
  Swift::String *v12;
  Swift::String *v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *object;
  uint64_t v31;
  char *v32;
  uint64_t countAndFlagsBits;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;

  v34 = a1;
  v47 = 0;
  v46 = 0;
  v45 = 0;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  v36 = *(_QWORD *)(v38 - 8);
  v17 = (*(_QWORD *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v16 - v17;
  v47 = (char *)&v16 - v17;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OneHotEncoder<String>);
  v18 = (*(_QWORD *)(*(_QWORD *)(v25 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v25);
  v24 = (char *)&v16 - v18;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  v39 = *(_QWORD *)(v41 - 8);
  v19 = (*(_QWORD *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v16 - v19;
  v46 = (char *)&v16 - v19;
  v44 = type metadata accessor for BoostedTreeConfiguration();
  v42 = *(_QWORD *)(v44 - 8);
  v20 = (*(_QWORD *)(v42 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v44);
  v32 = (char *)&v16 - v20;
  v21 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v16 - v20);
  v43 = (char *)&v16 - v21;
  v45 = (char *)&v16 - v21;
  BoostedTreeConfiguration.init()();
  BoostedTreeConfiguration.randomSeed.setter();
  v28 = MEMORY[0x24BEE0D00];
  v23 = _allocateUninitializedArray<A>(_:)();
  v22 = v2;
  v3 = kMediaML_carrier.unsafeMutableAddressor();
  outlined init with copy of String(v3, v22);
  v4 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v4, v22 + 2);
  v5 = v23;
  _finalizeUninitializedArray<A>(_:)();
  v26 = v5;
  OneHotEncoder.init()();
  lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>();
  ColumnSelector.init(columns:estimator:)();
  v6 = kMediaML_throughputTrue.unsafeMutableAddressor();
  countAndFlagsBits = v6->_countAndFlagsBits;
  object = v6->_object;
  swift_bridgeObjectRetain();
  v29 = _allocateUninitializedArray<A>(_:)();
  v27 = v7;
  v8 = kMediaML_binnedRssi.unsafeMutableAddressor();
  outlined init with copy of String(v8, v27);
  v9 = kMediaML_binnedRsrp.unsafeMutableAddressor();
  outlined init with copy of String(v9, v27 + 2);
  v10 = kMediaML_binnedRsrq.unsafeMutableAddressor();
  outlined init with copy of String(v10, v27 + 4);
  v11 = kMediaML_binnedRscp.unsafeMutableAddressor();
  outlined init with copy of String(v11, v27 + 6);
  v12 = kMediaML_binnedSnr.unsafeMutableAddressor();
  outlined init with copy of String(v12, v27 + 8);
  v13 = kMediaML_bars.unsafeMutableAddressor();
  outlined init with copy of String(v13, v27 + 10);
  v14 = v29;
  _finalizeUninitializedArray<A>(_:)();
  v31 = v14;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v32, v43, v44);
  BoostedTreeRegressor.init(annotationColumnName:featureColumnNames:configuration:)();
  v35 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  UpdatableTabularEstimator.appending<A>(_:)();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v43, v44);
}

uint64_t WifiModel.logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static WifiModel.logger);
}

uint64_t static WifiModel.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = WifiModel.logger.unsafeMutableAddressor();
  v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

void variable initialization expression of WifiModel.model(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = 0;
}

uint64_t key path getter for WifiModel.model : WifiModel@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[40];
  uint64_t v7;

  v4 = *a1;
  v2 = swift_retain();
  v7 = v4;
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 120))(v2);
  outlined init with take of Transformer?(v6, a2);
  return swift_release();
}

uint64_t key path setter for WifiModel.model : WifiModel(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD v5[5];

  outlined init with copy of Transformer?(a1, v5);
  v4 = *a2;
  swift_retain();
  (*(void (**)(_QWORD *))(*(_QWORD *)v4 + 128))(v5);
  return swift_release();
}

uint64_t WifiModel.model.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  outlined init with copy of Transformer?((_QWORD *)(v1 + 112), a1);
  return swift_endAccess();
}

_QWORD *outlined init with copy of Transformer?(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  if (a1[3])
  {
    v2 = a1[3];
    a2[3] = v2;
    a2[4] = a1[4];
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

uint64_t WifiModel.model.setter(_QWORD *a1)
{
  uint64_t v1;
  _QWORD v4[5];

  outlined init with copy of Transformer?(a1, v4);
  swift_beginAccess();
  outlined assign with take of Transformer?(v4, (_QWORD *)(v1 + 112));
  swift_endAccess();
  return outlined destroy of Transformer?((uint64_t)a1);
}

_QWORD *outlined assign with take of Transformer?(const void *a1, _QWORD *a2)
{
  if (a2[3])
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
    memcpy(a2, a1, 0x28uLL);
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

uint64_t outlined destroy of Transformer?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t (*WifiModel.model.modify())()
{
  swift_beginAccess();
  return WifiModel.model.modify;
}

uint64_t WifiModel.model.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of WifiModel.parametersURL@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v4[1] = a1;
  v7 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v7 - 8);
  v4[0] = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v1 = (char *)v4 - v4[0];
  v6 = (char *)v4 - v4[0];
  v2 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v1, v2, v7);
  v4[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wifiParameters.pkg", 0x12uLL, 1)._object;
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v6, v7);
}

uint64_t WifiModel.parametersURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL;
  v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t variable initialization expression of WifiModel.targetColumnID()
{
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return ColumnID.init(_:_:)();
}

uint64_t WifiModel.targetColumnID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t variable initialization expression of WifiModel.estimator@<X0>(uint64_t a1@<X8>)
{
  WiFiModelGuts.init()();
  return WiFiModelGuts.estimator.getter(a1);
}

uint64_t WifiModel.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t WifiModel.__allocating_init()()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = v0;
  swift_allocObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = *(_QWORD *)(v0 + 16);
  v1[1] = WifiModel.__allocating_init();
  return WifiModel.init()();
}

uint64_t WifiModel.__allocating_init()(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t WifiModel.init()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1[9] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v2 = type metadata accessor for Logger();
  v1[10] = v2;
  v1[11] = *(_QWORD *)(v2 - 8);
  v1[12] = swift_task_alloc();
  v7 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v7 - 8);
  v6 = swift_task_alloc();
  v1[13] = v6;
  v1[3] = v9;
  swift_defaultActor_initialize();
  v9[14] = 0;
  v9[15] = 0;
  v9[16] = 0;
  v9[17] = 0;
  v9[18] = 0;
  v3 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v3, v7);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wifiParameters.pkg", 0x12uLL, 1);
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  ColumnID.init(_:_:)();
  v8 = OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
  WiFiModelGuts.init()();
  WiFiModelGuts.estimator.getter((uint64_t)v9 + v8);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *buf;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint32_t v15;
  os_log_type_t v16;
  NSObject *v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 16) = v0;
  v2 = WifiModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v1, v2, v14);
  v17 = Logger.logObject.getter();
  v16 = static os_log_type_t.info.getter();
  *(_QWORD *)(v0 + 32) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v15 = *(_DWORD *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v18 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v17, v16))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v9 = createStorage<A>(capacity:type:)(0);
    v10 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v12 + 40) = buf;
    *(_QWORD *)(v12 + 48) = v9;
    *(_QWORD *)(v12 + 56) = v10;
    serialize(_:at:)(0, (_BYTE **)(v12 + 40));
    serialize(_:at:)(0, (_BYTE **)(v12 + 40));
    *(_QWORD *)(v12 + 64) = v18;
    v11 = (_QWORD *)swift_task_alloc();
    v11[2] = v12 + 40;
    v11[3] = v12 + 48;
    v11[4] = v12 + 56;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_241527000, v17, v16, "New WiFi Model created", buf, v15);
    destroyStorage<A>(_:count:)(v9, 0, v7);
    destroyStorage<A>(_:count:)(v10, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
  }
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v12 + 96);
  v4 = *(_QWORD *)(v12 + 88);
  v5 = *(_QWORD *)(v12 + 80);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v12 + 16) + 8))(*(_QWORD *)(v12 + 72));
}

uint64_t WifiModel.train(traindata_url:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3[18] = v2;
  v3[17] = a2;
  v3[16] = a1;
  v3[13] = v3;
  v3[14] = 0;
  v3[15] = 0;
  type metadata accessor for CSVReadingOptions();
  v3[19] = swift_task_alloc();
  v4 = type metadata accessor for URL();
  v3[20] = v4;
  v3[21] = *(_QWORD *)(v4 - 8);
  v3[22] = swift_task_alloc();
  v5 = type metadata accessor for DataFrame();
  v3[23] = v5;
  v3[24] = *(_QWORD *)(v5 - 8);
  v3[25] = swift_task_alloc();
  v3[14] = a2;
  v3[15] = v8;
  return swift_task_switch();
}

uint64_t WifiModel.train(traindata_url:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;

  v1 = v0[21];
  v6 = v0[19];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 16))();
  default argument 3 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  default argument 4 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)(v6);
  DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  v4 = (uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(**(_QWORD **)(v5 + 144) + 160)
                                               + **(int **)(**(_QWORD **)(v5 + 144) + 160));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 208) = v2;
  *v2 = *(_QWORD *)(v5 + 104);
  v2[1] = WifiModel.train(traindata_url:);
  return v4(v5 + 16, *(_QWORD *)(v5 + 200));
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 104) = *v1;
  *(_QWORD *)(v2 + 216) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  void *__dst;

  v1 = v0[24];
  __dst = (void *)v0[16];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 8))();
  outlined init with take of ModelStats?(v0 + 2, __dst);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[13] + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[25];
  v2 = v0[24];
  v3 = v0[23];
  v0[13] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[13] + 8))();
}

uint64_t default argument 3 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)()
{
  uint64_t v0;

  v0 = specialized static Array._allocateUninitialized(_:)(0);
  return specialized Dictionary.init(dictionaryLiteral:)(v0);
}

uint64_t default argument 4 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Builtin::Word v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;

  v7 = a1;
  v4 = type metadata accessor for CSVType();
  v3 = *(_QWORD *)(v4 - 8);
  v2 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v4);
  v10 = (char *)&v2 - v2;
  v12 = default argument 1 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
  v8 = default argument 2 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
  v9 = default argument 3 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v10, *MEMORY[0x24BDF5FB8], v4);
  v5 = 1;
  v11 = 1;
  v6 = Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
  Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)("\\", v5, v11 & 1);
  return CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
}

uint64_t WifiModel.train(dataFrame:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;

  v3[42] = v2;
  v3[41] = a2;
  v3[40] = a1;
  v3[43] = *v2;
  v3[27] = v3;
  v3[28] = 0;
  v3[29] = 0;
  v3[35] = 0;
  v3[36] = 0;
  memset(v3 + 12, 0, 0x50uLL);
  v4 = type metadata accessor for URL();
  v3[44] = v4;
  v3[45] = *(_QWORD *)(v4 - 8);
  v3[46] = swift_task_alloc();
  v5 = type metadata accessor for Logger();
  v3[47] = v5;
  v3[48] = *(_QWORD *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  v6 = type metadata accessor for AnyColumnSlice();
  v3[53] = v6;
  v3[54] = *(_QWORD *)(v6 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v3[58] = swift_task_alloc();
  v7 = type metadata accessor for DataFrame.Rows();
  v3[59] = v7;
  v3[60] = *(_QWORD *)(v7 - 8);
  v3[61] = swift_task_alloc();
  v3[62] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  v3[63] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  v3[64] = v8;
  v3[65] = *(_QWORD *)(v8 - 8);
  v3[66] = swift_task_alloc();
  v3[67] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  v3[68] = v9;
  v3[69] = *(_QWORD *)(v9 - 8);
  v3[70] = swift_task_alloc();
  v10 = type metadata accessor for DataFrame();
  v3[71] = v10;
  v3[72] = *(_QWORD *)(v10 - 8);
  v3[73] = swift_task_alloc();
  v3[74] = swift_task_alloc();
  v11 = type metadata accessor for DataFrame.Slice();
  v3[75] = v11;
  v3[76] = *(_QWORD *)(v11 - 8);
  v3[77] = swift_task_alloc();
  v3[78] = swift_task_alloc();
  v3[79] = swift_task_alloc();
  v3[80] = swift_task_alloc();
  v3[28] = a2;
  v3[29] = v14;
  return swift_task_switch();
}

uint64_t WifiModel.train(dataFrame:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *buf;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint32_t size;
  os_log_type_t v33;
  NSObject *oslog;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  BOOL v54;

  v47 = v0[80];
  v52 = v0[79];
  v49 = v0[78];
  v53 = v0[77];
  v48 = v0[76];
  v50 = v0[75];
  v0[27] = v0;
  DataFrameProtocol.randomSplit(by:seed:)();
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  v51(v49, v47, v50);
  DataFrame.init(_:)();
  v51(v49, v52, v50);
  DataFrame.init(_:)();
  v54 = DataFrame.Slice.shape.getter() <= 0;
  v51(v53, v52, v50);
  v45 = !v54 && DataFrame.Slice.shape.getter() > 0;
  v1 = *(_QWORD *)(v46 + 616);
  v2 = *(_QWORD *)(v46 + 600);
  v44 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v46 + 608) + 8);
  *(_QWORD *)(v46 + 648) = v44;
  v44(v1, v2);
  if (v45)
  {
    v36 = *(_QWORD *)(v46 + 584);
    v37 = *(_QWORD *)(v46 + 576);
    v38 = *(_QWORD *)(v46 + 568);
    v3 = *(_QWORD *)(v46 + 536);
    v4 = *(_QWORD *)(v46 + 512);
    v39 = *(_QWORD *)(v46 + 504);
    v40 = *(_QWORD *)(v46 + 344);
    v5 = *(_QWORD *)(v46 + 336) + OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 + 520) + 16);
    *(_QWORD *)(v46 + 656) = v6;
    v6(v3, v5, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v39, v36, v38);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v38);
    v7 = swift_allocObject();
    *(_QWORD *)(v46 + 664) = v7;
    *(_QWORD *)(v7 + 16) = v40;
    v41 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    v42 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    v43 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
    v8 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
    *(_QWORD *)(v46 + 176) = v41;
    *(_QWORD *)(v46 + 184) = v42;
    *(_QWORD *)(v46 + 192) = v43;
    *(_QWORD *)(v46 + 200) = v8;
    *(_QWORD *)(v46 + 208) = MEMORY[0x24BEE13F8];
    *(_QWORD *)(v46 + 672) = *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v46 + 680) = v9;
    *v9 = *(_QWORD *)(v46 + 216);
    v9[1] = WifiModel.train(dataFrame:);
    return dispatch thunk of SupervisedTabularEstimator.fitted(to:validateOn:eventHandler:)();
  }
  else
  {
    v11 = *(_QWORD *)(v46 + 392);
    v30 = *(_QWORD *)(v46 + 384);
    v31 = *(_QWORD *)(v46 + 376);
    v12 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v11, v12, v31);
    oslog = Logger.logObject.getter();
    v33 = static os_log_type_t.error.getter();
    *(_QWORD *)(v46 + 240) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    size = *(_DWORD *)(v46 + 760);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v35 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v33))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v27 = createStorage<A>(capacity:type:)(0);
      v28 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v46 + 248) = buf;
      *(_QWORD *)(v46 + 256) = v27;
      *(_QWORD *)(v46 + 264) = v28;
      serialize(_:at:)(0, (_BYTE **)(v46 + 248));
      serialize(_:at:)(0, (_BYTE **)(v46 + 248));
      *(_QWORD *)(v46 + 272) = v35;
      v29 = (_QWORD *)swift_task_alloc();
      v29[2] = v46 + 248;
      v29[3] = v46 + 256;
      v29[4] = v46 + 264;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, oslog, v33, "Wifi: Training or validation data is empty", buf, size);
      destroyStorage<A>(_:count:)(v27, 0, v25);
      destroyStorage<A>(_:count:)(v28, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v22 = *(_QWORD *)(v46 + 640);
    v21 = *(_QWORD *)(v46 + 632);
    v23 = *(_QWORD *)(v46 + 600);
    v18 = *(_QWORD *)(v46 + 592);
    v17 = *(_QWORD *)(v46 + 584);
    v16 = *(_QWORD *)(v46 + 576);
    v19 = *(_QWORD *)(v46 + 568);
    v14 = *(_QWORD *)(v46 + 392);
    v13 = *(_QWORD *)(v46 + 384);
    v15 = *(_QWORD *)(v46 + 376);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
    v20 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v20(v17, v19);
    v20(v18, v19);
    v44(v21, v23);
    v44(v22, v23);
    v24 = *(_QWORD *)(v46 + 320);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    *(_QWORD *)v24 = 0;
    *(_QWORD *)(v24 + 8) = 0;
    *(_QWORD *)(v24 + 16) = 0;
    *(_QWORD *)(v24 + 24) = 0;
    *(_QWORD *)(v24 + 32) = 0;
    *(_QWORD *)(v24 + 40) = 0;
    *(_QWORD *)(v24 + 48) = 0;
    *(_QWORD *)(v24 + 56) = 0;
    *(_QWORD *)(v24 + 64) = 0;
    *(_QWORD *)(v24 + 72) = 0;
    *(_BYTE *)(v24 + 80) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v46 + 216) + 8))();
  }
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void (*v3)(uint64_t, uint64_t);
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD, _QWORD);
  _QWORD *v12;
  _QWORD *v13;

  v2 = (_QWORD *)*v1;
  v2[27] = *v1;
  v2 += 27;
  v12 = v2 - 25;
  v13 = v2;
  v2[59] = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v9 = v12[65];
  v7 = v12[63];
  v8 = v12[62];
  v6 = v12[61];
  v10 = v12[40];
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in WifiModel.train(dataFrame:));
  outlined destroy of DataFrame?(v6);
  v3 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v12[85] = v3;
  v3(v9, v8);
  v11 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)v10 + 168)
                                                       + **(int **)(*(_QWORD *)v10 + 168));
  v4 = (_QWORD *)swift_task_alloc();
  v12[86] = v4;
  v12[87] = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
  *v4 = *v13;
  v4[1] = WifiModel.train(dataFrame:);
  return v11(v12[72], v12[68], v12[66]);
}

{
  uint64_t v0;
  Swift::String *v1;
  Swift::String *v2;
  Swift::Int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint32_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  NSObject *log;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint32_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  NSObject *oslog;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint8_t *buf;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  uint64_t countAndFlagsBits;
  uint64_t v102;
  void *object;
  uint64_t v104;
  Swift::String v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t);
  uint64_t v113;
  uint64_t trainingRowCount;
  uint64_t validationRowCount;
  uint64_t ssidCount;
  uint64_t appNameCount;
  uint64_t sessionIDCount;
  Swift::Double trainingMAPE;
  Swift::Double validationMAPE;
  Swift::Int trainingDate;
  Swift::Int interfaceType;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  NSObject *v158;
  os_log_type_t v159;
  uint8_t *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t (*v163)(uint64_t, uint64_t, uint64_t);
  uint64_t v164;
  uint8_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t (*v168)(uint64_t, uint64_t, uint64_t);
  uint64_t v169;
  uint8_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t, uint64_t);
  uint64_t v174;

  validationMAPE = *(double *)(v0 + 744);
  trainingMAPE = *(double *)(v0 + 720);
  v97 = *(_QWORD *)(v0 + 496);
  v100 = *(_QWORD *)(v0 + 488);
  v96 = *(_QWORD *)(v0 + 480);
  v98 = *(_QWORD *)(v0 + 472);
  v104 = *(_QWORD *)(v0 + 464);
  v106 = *(_QWORD *)(v0 + 456);
  v113 = *(_QWORD *)(v0 + 448);
  v108 = *(_QWORD *)(v0 + 440);
  v102 = *(_QWORD *)(v0 + 432);
  v111 = *(_QWORD *)(v0 + 424);
  v110 = *(_QWORD *)(v0 + 416);
  v133 = *(_QWORD *)(v0 + 384);
  v134 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 216) = v0;
  *(Swift::Double *)(v0 + 288) = validationMAPE;
  interfaceType = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
  DataFrame.Slice.rows.getter();
  trainingRowCount = DataFrame.Rows.count.getter();
  v99 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
  v99(v97, v98);
  DataFrame.Slice.rows.getter();
  validationRowCount = DataFrame.Rows.count.getter();
  v99(v100, v98);
  v1 = kMediaML_ssid.unsafeMutableAddressor();
  countAndFlagsBits = v1->_countAndFlagsBits;
  object = v1->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x242695F08](countAndFlagsBits, object);
  AnyColumnSlice.distinct()();
  v112 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
  v112(v106, v111);
  swift_bridgeObjectRelease();
  ssidCount = AnyColumnSlice.count.getter();
  v112(v104, v111);
  v105 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x242695F08](v105._countAndFlagsBits, v105._object);
  AnyColumnSlice.distinct()();
  v112(v113, v111);
  swift_bridgeObjectRelease();
  appNameCount = AnyColumnSlice.count.getter();
  v112(v106, v111);
  v2 = kMediaML_sessionID.unsafeMutableAddressor();
  v107 = v2->_countAndFlagsBits;
  v109 = v2->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x242695F08](v107, v109);
  AnyColumnSlice.distinct()();
  v112(v108, v111);
  swift_bridgeObjectRelease();
  sessionIDCount = AnyColumnSlice.count.getter();
  v112(v113, v111);
  trainingDate = getDateInEpoch()();
  v3 = default argument 3 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)();
  ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)((MediaML::ModelStats *)(v0 + 16), interfaceType, trainingRowCount, validationRowCount, v3, ssidCount, appNameCount, sessionIDCount, trainingMAPE, validationMAPE, trainingDate);
  v123 = *(_QWORD *)(v0 + 16);
  v124 = *(_QWORD *)(v0 + 24);
  v125 = *(_QWORD *)(v0 + 32);
  v126 = *(_QWORD *)(v0 + 40);
  v127 = *(_QWORD *)(v0 + 48);
  v128 = *(_QWORD *)(v0 + 56);
  v129 = *(_QWORD *)(v0 + 64);
  v130 = *(_QWORD *)(v0 + 72);
  v131 = *(_QWORD *)(v0 + 80);
  v132 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 96) = v123;
  *(_QWORD *)(v0 + 104) = v124;
  *(_QWORD *)(v0 + 112) = v125;
  *(_QWORD *)(v0 + 120) = v126;
  *(_QWORD *)(v0 + 128) = v127;
  *(_QWORD *)(v0 + 136) = v128;
  *(_QWORD *)(v0 + 144) = v129;
  *(_QWORD *)(v0 + 152) = v130;
  *(_QWORD *)(v0 + 160) = v131;
  *(_QWORD *)(v0 + 168) = v132;
  v4 = WifiModel.logger.unsafeMutableAddressor();
  v135 = *(void (**)(uint64_t, uint64_t, uint64_t))(v133 + 16);
  v135(v110, v4, v134);
  v137 = swift_allocObject();
  memcpy((void *)(v137 + 16), (const void *)(v0 + 16), 0x50uLL);
  v139 = swift_allocObject();
  memcpy((void *)(v139 + 16), (const void *)(v0 + 16), 0x50uLL);
  v141 = swift_allocObject();
  memcpy((void *)(v141 + 16), (const void *)(v0 + 16), 0x50uLL);
  v143 = swift_allocObject();
  memcpy((void *)(v143 + 16), (const void *)(v0 + 16), 0x50uLL);
  v158 = Logger.logObject.getter();
  v159 = static os_log_type_t.info.getter();
  *(_QWORD *)(v0 + 296) = 42;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 764);
  v145 = swift_allocObject();
  *(_BYTE *)(v145 + 16) = 0;
  v146 = swift_allocObject();
  *(_BYTE *)(v146 + 16) = 8;
  v138 = swift_allocObject();
  *(_QWORD *)(v138 + 16) = partial apply for implicit closure #2 in WifiModel.train(dataFrame:);
  *(_QWORD *)(v138 + 24) = v137;
  v147 = swift_allocObject();
  *(_QWORD *)(v147 + 16) = _sSiIegd_SiIegr_TRTA_1;
  *(_QWORD *)(v147 + 24) = v138;
  v148 = swift_allocObject();
  *(_BYTE *)(v148 + 16) = 0;
  v149 = swift_allocObject();
  *(_BYTE *)(v149 + 16) = 8;
  v140 = swift_allocObject();
  *(_QWORD *)(v140 + 16) = partial apply for implicit closure #3 in WifiModel.train(dataFrame:);
  *(_QWORD *)(v140 + 24) = v139;
  v150 = swift_allocObject();
  *(_QWORD *)(v150 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(_QWORD *)(v150 + 24) = v140;
  v151 = swift_allocObject();
  *(_BYTE *)(v151 + 16) = 0;
  v152 = swift_allocObject();
  *(_BYTE *)(v152 + 16) = 8;
  v142 = swift_allocObject();
  *(_QWORD *)(v142 + 16) = partial apply for implicit closure #4 in WifiModel.train(dataFrame:);
  *(_QWORD *)(v142 + 24) = v141;
  v153 = swift_allocObject();
  *(_QWORD *)(v153 + 16) = _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0;
  *(_QWORD *)(v153 + 24) = v142;
  v154 = swift_allocObject();
  *(_BYTE *)(v154 + 16) = 0;
  v155 = swift_allocObject();
  *(_BYTE *)(v155 + 16) = 8;
  v144 = swift_allocObject();
  *(_QWORD *)(v144 + 16) = partial apply for implicit closure #5 in WifiModel.train(dataFrame:);
  *(_QWORD *)(v144 + 24) = v143;
  v156 = swift_allocObject();
  *(_QWORD *)(v156 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v156 + 24) = v144;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v157 = v5;
  swift_retain();
  *v157 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
  v157[1] = v145;
  swift_retain();
  v157[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[3] = v146;
  swift_retain();
  v157[4] = _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
  v157[5] = v147;
  swift_retain();
  v157[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[7] = v148;
  swift_retain();
  v157[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[9] = v149;
  swift_retain();
  v157[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v157[11] = v150;
  swift_retain();
  v157[12] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[13] = v151;
  swift_retain();
  v157[14] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[15] = v152;
  swift_retain();
  v157[16] = _s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v157[17] = v153;
  swift_retain();
  v157[18] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[19] = v154;
  swift_retain();
  v157[20] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[21] = v155;
  swift_retain();
  v157[22] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[23] = v156;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v158, v159))
  {
    v6 = *(_QWORD *)(v95 + 752);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v93 = createStorage<A>(capacity:type:)(0);
    v94 = createStorage<A>(capacity:type:)(0);
    v170 = buf;
    v171 = v93;
    v172 = v94;
    serialize(_:at:)(0, &v170);
    serialize(_:at:)(4, &v170);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
    v174 = v145;
    result = closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    if (v6)
      return result;
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v146;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
    v174 = v147;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v148;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v149;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v174 = v150;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v151;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v152;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    v174 = v153;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v154;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v155;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v174 = v156;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    _os_log_impl(&dword_241527000, v158, v159, "Wifi model stats: trainingRowCount: %ld validationRowCount: %ld trainingMAPE:%f, validationMAPE: %f", buf, size);
    destroyStorage<A>(_:count:)(v93, 0, v91);
    destroyStorage<A>(_:count:)(v94, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v90 = 0;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v90 = *(_QWORD *)(v95 + 752);
  }
  v89 = *(double *)(v95 + 744);
  v86 = *(_QWORD *)(v95 + 416);
  v85 = *(_QWORD *)(v95 + 384);
  v87 = *(_QWORD *)(v95 + 376);

  v88 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  v88(v86, v87);
  v8.n128_f64[0] = v89;
  if (v89 >= 0.7)
  {
    v47 = *(_QWORD *)(v95 + 744);
    v12 = *(_QWORD *)(v95 + 400);
    v46 = *(_QWORD *)(v95 + 376);
    v13 = WifiModel.logger.unsafeMutableAddressor();
    v135(v12, v13, v46);
    v49 = swift_allocObject();
    *(_QWORD *)(v49 + 16) = v47;
    log = Logger.logObject.getter();
    v60 = static os_log_type_t.info.getter();
    *(_QWORD *)(v95 + 304) = 22;
    UnsignedInteger<>.init<A>(_:)();
    v48 = *(_DWORD *)(v95 + 768);
    v52 = swift_allocObject();
    *(_BYTE *)(v52 + 16) = 0;
    v53 = swift_allocObject();
    *(_BYTE *)(v53 + 16) = 8;
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = partial apply for implicit closure #7 in WifiModel.train(dataFrame:);
    *(_QWORD *)(v50 + 24) = v49;
    v54 = swift_allocObject();
    *(_QWORD *)(v54 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(_QWORD *)(v54 + 24) = v50;
    v55 = swift_allocObject();
    *(_BYTE *)(v55 + 16) = 0;
    v56 = swift_allocObject();
    *(_BYTE *)(v56 + 16) = 8;
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = implicit closure #8 in WifiModel.train(dataFrame:);
    *(_QWORD *)(v51 + 24) = 0;
    v57 = swift_allocObject();
    *(_QWORD *)(v57 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(_QWORD *)(v57 + 24) = v51;
    _allocateUninitializedArray<A>(_:)();
    v58 = v14;
    swift_retain();
    *v58 = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[1] = v52;
    swift_retain();
    v58[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[3] = v53;
    swift_retain();
    v58[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[5] = v54;
    swift_retain();
    v58[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[7] = v55;
    swift_retain();
    v58[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[9] = v56;
    swift_retain();
    v58[10] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[11] = v57;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v60))
    {
      v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v44 = createStorage<A>(capacity:type:)(0);
      v45 = createStorage<A>(capacity:type:)(0);
      v160 = v43;
      v161 = v44;
      v162 = v45;
      serialize(_:at:)(0, &v160);
      serialize(_:at:)(2, &v160);
      v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v164 = v52;
      result = closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      if (v90)
        return result;
      v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v164 = v53;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v164 = v54;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v164 = v55;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v164 = v56;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v164 = v57;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      _os_log_impl(&dword_241527000, log, v60, "Wifi model not updated. Validation MAPE %f exceeds modelMAPEThreshold %f. ", v43, v48);
      destroyStorage<A>(_:count:)(v44, 0, v42);
      destroyStorage<A>(_:count:)(v45, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v43, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    v40 = *(_QWORD *)(v95 + 400);
    v41 = *(_QWORD *)(v95 + 376);

    v88(v40, v41);
LABEL_18:
    v38 = *(void (**)(uint64_t, uint64_t))(v95 + 648);
    v36 = *(_QWORD *)(v95 + 640);
    v35 = *(_QWORD *)(v95 + 632);
    v37 = *(_QWORD *)(v95 + 600);
    v32 = *(_QWORD *)(v95 + 592);
    v31 = *(_QWORD *)(v95 + 584);
    v30 = *(_QWORD *)(v95 + 576);
    v33 = *(_QWORD *)(v95 + 568);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v95 + 552) + 8))(*(_QWORD *)(v95 + 560), *(_QWORD *)(v95 + 544));
    v34 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v34(v31, v33);
    v34(v32, v33);
    v38(v35, v37);
    v38(v36, v37);
    v39 = *(_QWORD *)(v95 + 320);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    *(_QWORD *)v39 = v123;
    *(_QWORD *)(v39 + 8) = v124;
    *(_QWORD *)(v39 + 16) = v125;
    *(_QWORD *)(v39 + 24) = v126;
    *(_QWORD *)(v39 + 32) = v127;
    *(_QWORD *)(v39 + 40) = v128;
    *(_QWORD *)(v39 + 48) = v129;
    *(_QWORD *)(v39 + 56) = v130;
    *(_QWORD *)(v39 + 64) = v131;
    *(_QWORD *)(v39 + 72) = v132;
    *(_BYTE *)(v39 + 80) = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v95 + 216) + 8))();
  }
  v84 = *(_QWORD *)(v95 + 368);
  v82 = *(_QWORD *)(v95 + 360);
  v83 = *(_QWORD *)(v95 + 352);
  v81 = *(_QWORD *)(v95 + 336);
  (*(void (**)(_QWORD, uint64_t, __n128))(v95 + 656))(*(_QWORD *)(v95 + 528), v81 + OBJC_IVAR____TtC7MediaML9WifiModel_estimator, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16))(v84, v81 + OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL, v83);
  default argument 2 of SupervisedTabularEstimator.write(_:to:overwrite:)();
  SupervisedTabularEstimator.write(_:to:overwrite:)();
  if (!v90)
  {
    v69 = *(void (**)(uint64_t, uint64_t))(v95 + 696);
    v67 = *(_QWORD *)(v95 + 528);
    v68 = *(_QWORD *)(v95 + 512);
    v9 = *(_QWORD *)(v95 + 408);
    v70 = *(_QWORD *)(v95 + 376);
    v71 = *(_QWORD *)(v95 + 336);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v95 + 360) + 8))(*(_QWORD *)(v95 + 368), *(_QWORD *)(v95 + 352));
    v69(v67, v68);
    v10 = WifiModel.logger.unsafeMutableAddressor();
    v135(v9, v10, v70);
    swift_retain();
    swift_retain();
    v73 = swift_allocObject();
    *(_QWORD *)(v73 + 16) = partial apply for implicit closure #6 in WifiModel.train(dataFrame:);
    *(_QWORD *)(v73 + 24) = v71;
    swift_release();
    oslog = Logger.logObject.getter();
    v80 = static os_log_type_t.info.getter();
    *(_QWORD *)(v95 + 312) = 12;
    UnsignedInteger<>.init<A>(_:)();
    v72 = *(_DWORD *)(v95 + 772);
    v75 = swift_allocObject();
    *(_BYTE *)(v75 + 16) = 32;
    v76 = swift_allocObject();
    *(_BYTE *)(v76 + 16) = 8;
    v74 = swift_allocObject();
    *(_QWORD *)(v74 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
    *(_QWORD *)(v74 + 24) = v73;
    v77 = swift_allocObject();
    *(_QWORD *)(v77 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
    *(_QWORD *)(v77 + 24) = v74;
    _allocateUninitializedArray<A>(_:)();
    v78 = v11;
    swift_retain();
    *v78 = closure #1 in OSLogArguments.append(_:)partial apply;
    v78[1] = v75;
    swift_retain();
    v78[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v78[3] = v76;
    swift_retain();
    v78[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    v78[5] = v77;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v80))
    {
      v64 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v65 = createStorage<A>(capacity:type:)(0);
      v66 = createStorage<A>(capacity:type:)(1);
      v165 = v64;
      v166 = v65;
      v167 = v66;
      serialize(_:at:)(2, &v165);
      serialize(_:at:)(1, &v165);
      v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v169 = v75;
      closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v165, (uint64_t)&v166, (uint64_t)&v167);
      v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v169 = v76;
      closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v165, (uint64_t)&v166, (uint64_t)&v167);
      v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
      v169 = v77;
      closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v165, (uint64_t)&v166, (uint64_t)&v167);
      _os_log_impl(&dword_241527000, oslog, v80, "Updated wifi model written to: %s", v64, v72);
      destroyStorage<A>(_:count:)(v65, 0, v63);
      destroyStorage<A>(_:count:)(v66, 1, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v64, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    v61 = *(_QWORD *)(v95 + 408);
    v62 = *(_QWORD *)(v95 + 376);

    v88(v61, v62);
    goto LABEL_18;
  }
  v17 = *(void (**)(uint64_t, uint64_t))(v95 + 696);
  v29 = *(void (**)(uint64_t, uint64_t))(v95 + 648);
  v27 = *(_QWORD *)(v95 + 640);
  v26 = *(_QWORD *)(v95 + 632);
  v28 = *(_QWORD *)(v95 + 600);
  v23 = *(_QWORD *)(v95 + 592);
  v22 = *(_QWORD *)(v95 + 584);
  v21 = *(_QWORD *)(v95 + 576);
  v24 = *(_QWORD *)(v95 + 568);
  v19 = *(_QWORD *)(v95 + 560);
  v18 = *(_QWORD *)(v95 + 552);
  v20 = *(_QWORD *)(v95 + 544);
  v15 = *(_QWORD *)(v95 + 528);
  v16 = *(_QWORD *)(v95 + 512);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v95 + 360) + 8))(*(_QWORD *)(v95 + 368), *(_QWORD *)(v95 + 352));
  v17(v15, v16);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
  v25 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v25(v22, v24);
  v25(v23, v24);
  v29(v26, v28);
  v29(v27, v28);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v95 + 216) + 8))();
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  v14 = (void (*)(uint64_t, uint64_t))v0[81];
  v12 = v0[80];
  v11 = v0[79];
  v13 = v0[75];
  v8 = v0[74];
  v7 = v0[73];
  v6 = v0[72];
  v9 = v0[71];
  v5 = v0[67];
  v3 = v0[65];
  v4 = v0[64];
  v2 = v0[63];
  v0[27] = v0;
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in WifiModel.train(dataFrame:));
  outlined destroy of DataFrame?(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v4);
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v7, v9);
  v10(v8, v9);
  v14(v11, v13);
  v14(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[27] + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  v13 = (void (*)(uint64_t, uint64_t))v0[81];
  v11 = v0[80];
  v10 = v0[79];
  v12 = v0[75];
  v7 = v0[74];
  v6 = v0[73];
  v5 = v0[72];
  v8 = v0[71];
  v1 = v0[70];
  v2 = v0[69];
  v3 = v0[68];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9(v6, v8);
  v9(v7, v8);
  v13(v10, v12);
  v13(v11, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[27] + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  v13 = (void (*)(uint64_t, uint64_t))v0[81];
  v11 = v0[80];
  v10 = v0[79];
  v12 = v0[75];
  v7 = v0[74];
  v6 = v0[73];
  v5 = v0[72];
  v8 = v0[71];
  v1 = v0[70];
  v2 = v0[69];
  v3 = v0[68];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9(v6, v8);
  v9(v7, v8);
  v13(v10, v12);
  v13(v11, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[27] + 8))();
}

uint64_t WifiModel.train(dataFrame:)(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v9;
  _QWORD *v10;
  double *v11;

  v3 = *v2;
  *(_QWORD *)(v3 + 216) = *v2;
  v9 = (_QWORD *)(v3 + 16);
  v10 = (_QWORD *)(v3 + 216);
  v11 = (double *)(v3 + 280);
  *(double *)(v3 + 720) = a1;
  *(_QWORD *)(v3 + 728) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v4 = v9[40];
  *v11 = a1;
  v7 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)v4 + 168)
                                                              + **(int **)(*(_QWORD *)v4 + 168));
  v5 = (_QWORD *)swift_task_alloc();
  v9[90] = v5;
  *v5 = *v10;
  v5[1] = WifiModel.train(dataFrame:);
  return v7(v9[71], v9[68], v9[66], v9[87]);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 216) = *v2;
  v3 += 216;
  *(double *)(v3 + 528) = a1;
  *(_QWORD *)(v3 + 536) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t closure #1 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE **v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint32_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  uint32_t v76;
  uint64_t v77;
  _QWORD v78[4];
  uint64_t v79;

  v79 = 0;
  v77 = 0;
  v57 = 0;
  v58 = 0;
  v59 = type metadata accessor for Logger();
  v60 = *(_QWORD *)(v59 - 8);
  v61 = (*(_QWORD *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v62 = (char *)&v18 - v61;
  v65 = type metadata accessor for MetricsKey();
  v63 = *(_QWORD *)(v65 - 8);
  v64 = (*(_QWORD *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v65);
  v67 = (char *)&v18 - v64;
  v79 = a1;
  v68 = Event.metrics.getter();
  static MetricsKey.validationError.getter();
  v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Sendable);
  v2 = lazy protocol witness table accessor for type MetricsKey and conformance MetricsKey();
  MEMORY[0x2426960C4](v78, v67, v68, v65, v66, v2);
  swift_bridgeObjectRelease();
  if (v78[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v52 = v69;
      v53 = 0;
    }
    else
    {
      v52 = 0;
      v53 = 1;
    }
    v51 = v53;
    v50 = v52;
    result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v67, v65);
    v55 = v50;
    v56 = v51;
  }
  else
  {
    v54 = 0;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v67, v65);
    result = outlined destroy of Sendable?((uint64_t)v78);
    v55 = v54;
    v56 = 1;
  }
  v49 = v55;
  if ((v56 & 1) == 0)
  {
    v48 = v49;
    v4 = v62;
    v30 = v49;
    v77 = v49;
    v5 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v4, v5, v59);
    v37 = 7;
    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = v30;
    v46 = Logger.logObject.getter();
    v47 = static os_log_type_t.info.getter();
    v33 = &v75;
    v75 = 12;
    v31 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v32 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v34 = v76;
    v35 = 17;
    v40 = swift_allocObject();
    *(_BYTE *)(v40 + 16) = 0;
    v41 = swift_allocObject();
    *(_BYTE *)(v41 + 16) = 8;
    v36 = 32;
    v6 = swift_allocObject();
    v7 = v38;
    v39 = v6;
    *(_QWORD *)(v6 + 16) = partial apply for implicit closure #1 in closure #1 in WifiModel.train(dataFrame:);
    *(_QWORD *)(v6 + 24) = v7;
    v8 = swift_allocObject();
    v9 = v39;
    v43 = v8;
    *(_QWORD *)(v8 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(_QWORD *)(v8 + 24) = v9;
    v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v42 = _allocateUninitializedArray<A>(_:)();
    v44 = v10;
    swift_retain();
    v11 = v40;
    v12 = v44;
    *v44 = closure #1 in OSLogArguments.append(_:)partial apply;
    v12[1] = v11;
    swift_retain();
    v13 = v41;
    v14 = v44;
    v44[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v14[3] = v13;
    swift_retain();
    v15 = v43;
    v16 = v44;
    v44[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v16[5] = v15;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v46, (os_log_type_t)v47))
    {
      v17 = v57;
      v23 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v22 = 0;
      v24 = createStorage<A>(capacity:type:)(0);
      v25 = createStorage<A>(capacity:type:)(v22);
      v26 = &v74;
      v74 = v23;
      v27 = &v73;
      v73 = v24;
      v28 = &v72;
      v72 = v25;
      serialize(_:at:)(0, &v74);
      serialize(_:at:)(1, v26);
      v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v71 = v40;
      closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28);
      v29 = v17;
      if (v17)
      {
        __break(1u);
      }
      else
      {
        v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v71 = v41;
        closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
        v20 = 0;
        v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v71 = v43;
        closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
        _os_log_impl(&dword_241527000, v46, (os_log_type_t)v47, "Validation error: %f", v23, v34);
        v19 = 0;
        destroyStorage<A>(_:count:)(v24, 0, v21);
        destroyStorage<A>(_:count:)(v25, v19, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696394](v23, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v62, v59);
  }
  return result;
}

uint64_t implicit closure #2 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t implicit closure #3 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

double implicit closure #4 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 56);
}

double implicit closure #5 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 64);
}

uint64_t default argument 2 of SupervisedTabularEstimator.write(_:to:overwrite:)()
{
  return 1;
}

uint64_t implicit closure #6 in WifiModel.train(dataFrame:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL;
  v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1 + v4);
}

double implicit closure #8 in WifiModel.train(dataFrame:)()
{
  return 0.7;
}

uint64_t WifiModel.getMAPE<A>(data:transformer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;

  v5[20] = v4;
  v5[19] = a4;
  v5[18] = a3;
  v5[17] = a2;
  v5[16] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  v5[13] = 0;
  v5[15] = 0;
  v6 = type metadata accessor for Logger();
  v5[21] = v6;
  v5[22] = *(_QWORD *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v5[25] = swift_task_alloc();
  v7 = type metadata accessor for DataFrame();
  v5[26] = v7;
  v5[27] = *(_QWORD *)(v7 - 8);
  v5[28] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v5[29] = v8;
  v5[30] = *(_QWORD *)(v8 - 8);
  v5[31] = swift_task_alloc();
  v5[3] = a1;
  v5[4] = a2;
  v5[5] = v11;
  return swift_task_switch();
}

uint64_t WifiModel.getMAPE<A>(data:transformer:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *buf;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  Swift::Bool v29;

  v26 = *(_QWORD *)(v0 + 248);
  v25 = *(_QWORD *)(v0 + 240);
  v27 = *(_QWORD *)(v0 + 232);
  v1 = *(_QWORD *)(v0 + 160);
  *(_QWORD *)(v0 + 16) = v0;
  *(double *)(v0 + 48) = -1.0;
  v2 = OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID;
  v3 = *(void (**)(uint64_t, uint64_t))(v25 + 16);
  *(_QWORD *)(v0 + 256) = v3;
  v3(v26, v1 + v2);
  v28._countAndFlagsBits = ColumnID.name.getter();
  v28._object = v4;
  v5 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  *(_QWORD *)(v0 + 264) = v5;
  v5(v26, v27);
  v29 = DataFrame.containsColumn(_:)(v28);
  swift_bridgeObjectRelease();
  if (v29)
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v24 + 272) = v6;
    *v6 = *(_QWORD *)(v24 + 16);
    v6[1] = WifiModel.getMAPE<A>(data:transformer:);
    return TabularTransformer.callAsFunction(_:eventHandler:)();
  }
  else
  {
    v8 = *(_QWORD *)(v24 + 184);
    v18 = *(_QWORD *)(v24 + 176);
    v19 = *(_QWORD *)(v24 + 168);
    v9 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v8, v9, v19);
    v22 = Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    *(_QWORD *)(v24 + 56) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v20 = *(_DWORD *)(v24 + 288);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v23 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v22, v21))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v15 = createStorage<A>(capacity:type:)(0);
      v16 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v24 + 64) = buf;
      *(_QWORD *)(v24 + 72) = v15;
      *(_QWORD *)(v24 + 80) = v16;
      serialize(_:at:)(0, (_BYTE **)(v24 + 64));
      serialize(_:at:)(0, (_BYTE **)(v24 + 64));
      *(_QWORD *)(v24 + 88) = v23;
      v17 = (_QWORD *)swift_task_alloc();
      v17[2] = v24 + 64;
      v17[3] = v24 + 72;
      v17[4] = v24 + 80;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, v22, v21, "No target column in data frame", buf, v20);
      destroyStorage<A>(_:count:)(v15, 0, v13);
      destroyStorage<A>(_:count:)(v16, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v11 = *(_QWORD *)(v24 + 184);
    v10 = *(_QWORD *)(v24 + 176);
    v12 = *(_QWORD *)(v24 + 168);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(double))(*(_QWORD *)(v24 + 16) + 8))(-1.0);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 280) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  Swift::OpaquePointer v20;

  v1 = v0[35];
  v17 = (void (*)(uint64_t, uint64_t))v0[33];
  v2 = (void (*)(void))v0[32];
  v18 = v0[31];
  v16 = v0[29];
  v0[2] = v0;
  v2();
  DataFrame.subscript.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
  lazy protocol witness table accessor for type Column<Double> and conformance Column<A>();
  v19 = Array.init<A>(_:)();
  v17(v18, v16);
  v0[12] = v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double?]);
  lazy protocol witness table accessor for type [Double?] and conformance [A]();
  result = Sequence.compactMap<A>(_:)();
  v20._rawValue = (void *)result;
  if (!v1)
  {
    v11 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v15 + 33);
    v9 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v15 + 32);
    v12 = *((_QWORD *)v15 + 31);
    v10 = *((_QWORD *)v15 + 29);
    v8 = *((_QWORD *)v15 + 20);
    outlined destroy of [Double?]();
    *((_QWORD *)v15 + 13) = result;
    v9(v12, v8 + OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID, v10);
    DataFrame.subscript.getter();
    v13 = Array.init<A>(_:)();
    v11(v12, v10);
    *((_QWORD *)v15 + 14) = v13;
    v14 = Sequence.compactMap<A>(_:)();
    v5 = *((_QWORD *)v15 + 28);
    v4 = *((_QWORD *)v15 + 27);
    v6 = *((_QWORD *)v15 + 26);
    outlined destroy of [Double?]();
    *((_QWORD *)v15 + 15) = v14;
    v7 = meanAbsolutePercentageError(yRealList:yPredList:)((Swift::OpaquePointer)v14, v20);
    v15[6] = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(double))(*((_QWORD *)v15 + 2) + 8))(v7);
  }
  return result;
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in WifiModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8) & 1;
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t closure #2 in WifiModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8) & 1;
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

Swift::Void __swiftcall WifiModel.readModelFile()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[32];
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _BYTE v30[8];
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = 0;
  v24 = 0;
  v4[31] = 0;
  v5 = type metadata accessor for Logger();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v8 = (char *)v4 - v7;
  v15 = type metadata accessor for URL();
  v13 = *(_QWORD *)(v15 - 8);
  v9 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v15);
  v22 = (char *)v4 - v9;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  v10 = *(_QWORD *)(v21 - 8);
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21);
  v12 = (char *)v4 - v11;
  v33 = v14;
  (*(void (**)(char *, uint64_t))(v0 + 16))((char *)v4 - v11, v14 + OBJC_IVAR____TtC7MediaML9WifiModel_estimator);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v22, v14 + OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL, v15);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  v16 = (uint64_t *)v30;
  v31 = v1;
  v32 = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  v19 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  v2 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  v25 = v17;
  v26 = v18;
  v27 = v19;
  v28 = v2;
  v29 = MEMORY[0x24BEE13F8];
  swift_getOpaqueTypeConformance2();
  SupervisedTabularEstimator.read(from:)();
  v23 = 0;
  v3 = v14;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v15);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v21);
  (*(void (**)(_BYTE *))(*(_QWORD *)v3 + 128))(v30);
}

void *implicit closure #1 in WifiModel.readModelFile()(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v30;

  v12 = v10;
  v30 = v12;
  *(_QWORD *)(v11 + 416) = v12;
  *(double *)(v11 + 408) = a10;
  *(double *)(v11 + 400) = a9;
  *(_QWORD *)(v11 + 392) = a8;
  *(_QWORD *)(v11 + 384) = a7;
  *(_QWORD *)(v11 + 376) = a6;
  *(_QWORD *)(v11 + 368) = a5;
  *(_QWORD *)(v11 + 360) = a4;
  *(_QWORD *)(v11 + 352) = a3;
  *(_QWORD *)(v11 + 344) = a2;
  *(_QWORD *)(v11 + 336) = a1;
  *(_QWORD *)(v11 + 224) = v11;
  *(_QWORD *)(v11 + 176) = 0;
  *(_QWORD *)(v11 + 184) = 0;
  *(_QWORD *)(v11 + 192) = 0;
  *(_QWORD *)(v11 + 200) = 0;
  *(_QWORD *)(v11 + 232) = 0;
  *(_QWORD *)(v11 + 240) = 0;
  *(_QWORD *)(v11 + 248) = 0;
  *(_QWORD *)(v11 + 256) = 0;
  *(_QWORD *)(v11 + 264) = 0;
  *(_QWORD *)(v11 + 272) = 0;
  *(_QWORD *)(v11 + 280) = 0;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  *(_QWORD *)(v11 + 424) = v14;
  *(_QWORD *)(v11 + 432) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v11 + 440) = swift_task_alloc();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  *(_QWORD *)(v11 + 448) = v15;
  *(_QWORD *)(v11 + 456) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v11 + 464) = swift_task_alloc();
  v16 = type metadata accessor for DataFrame();
  *(_QWORD *)(v11 + 472) = v16;
  v17 = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v11 + 480) = v17;
  *(_QWORD *)(v11 + 488) = *(_QWORD *)(v17 + 64);
  *(_QWORD *)(v11 + 496) = swift_task_alloc();
  *(_QWORD *)(v11 + 504) = swift_task_alloc();
  *(_QWORD *)(v11 + 512) = swift_task_alloc();
  v18 = type metadata accessor for Logger();
  *(_QWORD *)(v11 + 520) = v18;
  *(_QWORD *)(v11 + 528) = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v11 + 536) = swift_task_alloc();
  *(_QWORD *)(v11 + 544) = swift_task_alloc();
  v19 = type metadata accessor for DispatchTime();
  *(_QWORD *)(v11 + 552) = v19;
  v20 = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v11 + 560) = v20;
  *(_QWORD *)(v11 + 568) = *(_QWORD *)(v20 + 64);
  *(_QWORD *)(v11 + 576) = swift_task_alloc();
  *(_QWORD *)(v11 + 584) = swift_task_alloc();
  *(_QWORD *)(v11 + 592) = swift_task_alloc();
  *(_QWORD *)(v11 + 600) = swift_task_alloc();
  *(_QWORD *)(v11 + 176) = a1;
  *(_QWORD *)(v11 + 184) = a2;
  *(_QWORD *)(v11 + 192) = a3;
  *(_QWORD *)(v11 + 200) = a4;
  *(_QWORD *)(v11 + 232) = a5;
  *(_QWORD *)(v11 + 240) = a6;
  *(_QWORD *)(v11 + 248) = a7;
  *(_QWORD *)(v11 + 256) = a8;
  *(double *)(v11 + 264) = a9;
  *(double *)(v11 + 272) = a10;
  *(_QWORD *)(v11 + 280) = v30;
  return swift_task_switch();
}

uint64_t WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  Swift::String *v9;
  uint64_t *v10;
  Swift::String *v11;
  uint64_t *v12;
  Swift::String *v13;
  uint64_t v14;
  uint64_t *v15;
  Swift::String *v16;
  uint64_t v17;
  uint64_t *v18;
  Swift::String *v19;
  uint64_t v20;
  uint64_t *v21;
  Swift::String *v22;
  uint64_t v23;
  uint64_t *v24;
  Swift::String *v25;
  uint64_t v26;
  uint64_t *v27;
  Swift::String *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint32_t v68;
  os_log_type_t v69;
  NSObject *v70;
  uint64_t v71;
  BOOL v72;
  uint64_t *v73;

  v1 = v0[52];
  v0[28] = v0;
  v2 = static DispatchTime.now()();
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 120))(v2);
  v72 = v0[5] == 0;
  outlined destroy of Transformer?((uint64_t)(v73 + 2));
  if (v72)
  {
    v3 = v73[68];
    v66 = v73[66];
    v67 = v73[65];
    v4 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v3, v4, v67);
    v70 = Logger.logObject.getter();
    v69 = static os_log_type_t.debug.getter();
    v73[37] = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v68 = *((_DWORD *)v73 + 156);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v71 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v70, v69))
    {
      v62 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v63 = createStorage<A>(capacity:type:)(0);
      v64 = createStorage<A>(capacity:type:)(0);
      v73[38] = (uint64_t)v62;
      v73[39] = v63;
      v73[40] = v64;
      serialize(_:at:)(0, (_BYTE **)v73 + 38);
      serialize(_:at:)(0, (_BYTE **)v73 + 38);
      v73[41] = v71;
      v65 = (_QWORD *)swift_task_alloc();
      v65[2] = v73 + 38;
      v65[3] = v73 + 39;
      v65[4] = v73 + 40;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, v70, v69, "Reading wifi model from disk...", v62, v68);
      destroyStorage<A>(_:count:)(v63, 0, v61);
      destroyStorage<A>(_:count:)(v64, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v62, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v59 = v73[68];
    v58 = v73[66];
    v60 = v73[65];
    v5 = v73[52];

    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8))(v59, v60);
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 176))(v6);
  }
  v7 = v73[52];
  v56 = v73[51];
  v54 = v73[50];
  v53 = v73[49];
  v51 = v73[48];
  v50 = v73[47];
  v49 = v73[46];
  v48 = v73[45];
  v46 = v73[44];
  v43 = v73[43];
  v41 = v73[42];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, [Any?]));
  _allocateUninitializedArray<A>(_:)();
  v57 = v8;
  v9 = kMediaML_ssid.unsafeMutableAddressor();
  outlined init with copy of String(v9, v57);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v40 = _allocateUninitializedArray<A>(_:)();
  v42 = v10;
  swift_bridgeObjectRetain();
  v45 = MEMORY[0x24BEE0D00];
  v42[3] = MEMORY[0x24BEE0D00];
  *v42 = v41;
  v42[1] = v43;
  _finalizeUninitializedArray<A>(_:)();
  v57[2] = v40;
  v11 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v11, v57 + 3);
  v44 = _allocateUninitializedArray<A>(_:)();
  v47 = v12;
  swift_bridgeObjectRetain();
  v47[3] = v45;
  *v47 = v46;
  v47[1] = v48;
  _finalizeUninitializedArray<A>(_:)();
  v57[5] = v44;
  v13 = kMediaML_hourOfDay.unsafeMutableAddressor();
  outlined init with copy of String(v13, v57 + 6);
  v14 = _allocateUninitializedArray<A>(_:)();
  v52 = MEMORY[0x24BEE1768];
  v15[3] = MEMORY[0x24BEE1768];
  *v15 = v49;
  _finalizeUninitializedArray<A>(_:)();
  v57[8] = v14;
  v16 = kMediaML_dayOfWeek.unsafeMutableAddressor();
  outlined init with copy of String(v16, v57 + 9);
  v17 = _allocateUninitializedArray<A>(_:)();
  v18[3] = v52;
  *v18 = v50;
  _finalizeUninitializedArray<A>(_:)();
  v57[11] = v17;
  v19 = kMediaML_rssi.unsafeMutableAddressor();
  outlined init with copy of String(v19, v57 + 12);
  v20 = _allocateUninitializedArray<A>(_:)();
  v21[3] = v52;
  *v21 = v51;
  _finalizeUninitializedArray<A>(_:)();
  v57[14] = v20;
  v22 = kMediaML_noise.unsafeMutableAddressor();
  outlined init with copy of String(v22, v57 + 15);
  v23 = _allocateUninitializedArray<A>(_:)();
  v24[3] = v52;
  *v24 = v53;
  _finalizeUninitializedArray<A>(_:)();
  v57[17] = v23;
  v25 = kMediaML_txRate.unsafeMutableAddressor();
  outlined init with copy of String(v25, v57 + 18);
  v26 = _allocateUninitializedArray<A>(_:)();
  v55 = MEMORY[0x24BEE13C8];
  v27[3] = MEMORY[0x24BEE13C8];
  *v27 = v54;
  _finalizeUninitializedArray<A>(_:)();
  v57[20] = v26;
  v28 = kMediaML_rxRate.unsafeMutableAddressor();
  outlined init with copy of String(v28, v57 + 21);
  v29 = _allocateUninitializedArray<A>(_:)();
  v30[3] = v55;
  *v30 = v56;
  _finalizeUninitializedArray<A>(_:)();
  v57[23] = v29;
  _finalizeUninitializedArray<A>(_:)();
  v31 = DataFrame.init(dictionaryLiteral:)();
  (*(void (**)(uint64_t))(*(_QWORD *)v7 + 120))(v31);
  if (v73[20])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TabularTransformer);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v73[12] = 0;
      v73[13] = 0;
      v73[14] = 0;
      v73[15] = 0;
      v73[16] = 0;
    }
  }
  else
  {
    outlined destroy of Transformer?((uint64_t)(v73 + 17));
    v73[12] = 0;
    v73[13] = 0;
    v73[14] = 0;
    v73[15] = 0;
    v73[16] = 0;
  }
  if (v73[15])
  {
    outlined init with take of TabularTransformer(v73 + 12, v73 + 7);
    __swift_project_boxed_opaque_existential_1(v73 + 7, v73[10]);
    v32 = (_QWORD *)swift_task_alloc();
    v73[76] = (uint64_t)v32;
    *v32 = v73[28];
    v32[1] = WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
    return TabularTransformer.callAsFunction(_:eventHandler:)();
  }
  else
  {
    v38 = v73[75];
    v37 = v73[70];
    v39 = v73[69];
    v36 = v73[64];
    v34 = v73[60];
    v35 = v73[59];
    outlined destroy of TabularTransformer?((uint64_t)(v73 + 12));
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v35);
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD))(v73[28] + 8))(0, 0);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 224) = *v1;
  *(_QWORD *)(v2 + 616) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint8_t *buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t, uint64_t);
  uint32_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;

  v44 = *(_QWORD *)(v0 + 600);
  v43 = *(_QWORD *)(v0 + 592);
  v49 = *(_QWORD *)(v0 + 584);
  v51 = *(_QWORD *)(v0 + 576);
  v46 = *(_QWORD *)(v0 + 568);
  v47 = *(_QWORD *)(v0 + 560);
  v52 = *(_QWORD *)(v0 + 552);
  v1 = *(_QWORD *)(v0 + 536);
  v34 = *(_QWORD *)(v0 + 528);
  v35 = *(_QWORD *)(v0 + 520);
  v36 = *(_QWORD *)(v0 + 504);
  v40 = *(_QWORD *)(v0 + 496);
  v37 = *(_QWORD *)(v0 + 488);
  v38 = *(_QWORD *)(v0 + 480);
  v41 = *(_QWORD *)(v0 + 472);
  v42 = *(_QWORD *)(v0 + 416);
  *(_QWORD *)(v0 + 224) = v0;
  static DispatchTime.now()();
  v2 = WifiModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v1, v2, v35);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v40, v36, v41);
  swift_retain();
  v39 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v55 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v38 + 32))(v55 + v39, v40, v41);
  *(_QWORD *)(v55 + ((v39 + v37 + 7) & 0xFFFFFFFFFFFFFFF8)) = v42;
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  v45(v49, v43, v52);
  v45(v51, v44, v52);
  v3 = *(_DWORD *)(v47 + 80);
  v48 = (v3 + 16) & ~v3;
  v50 = (v48 + v46 + v3) & ~v3;
  v57 = swift_allocObject();
  v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32);
  v53(v57 + v48, v49, v52);
  v53(v57 + v50, v51, v52);
  v66 = Logger.logObject.getter();
  v67 = static os_log_type_t.default.getter();
  *(_QWORD *)(v0 + 288) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v54 = *(_DWORD *)(v0 + 220);
  v59 = swift_allocObject();
  *(_BYTE *)(v59 + 16) = 0;
  v60 = swift_allocObject();
  *(_BYTE *)(v60 + 16) = 8;
  v56 = swift_allocObject();
  *(_QWORD *)(v56 + 16) = partial apply for implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
  *(_QWORD *)(v56 + 24) = v55;
  v61 = swift_allocObject();
  *(_QWORD *)(v61 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v61 + 24) = v56;
  v62 = swift_allocObject();
  *(_BYTE *)(v62 + 16) = 0;
  v63 = swift_allocObject();
  *(_BYTE *)(v63 + 16) = 8;
  v58 = swift_allocObject();
  *(_QWORD *)(v58 + 16) = partial apply for implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
  *(_QWORD *)(v58 + 24) = v57;
  v64 = swift_allocObject();
  *(_QWORD *)(v64 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v64 + 24) = v58;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v65 = v4;
  swift_retain();
  *v65 = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[1] = v59;
  swift_retain();
  v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[3] = v60;
  swift_retain();
  v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[5] = v61;
  swift_retain();
  v65[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[7] = v62;
  swift_retain();
  v65[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[9] = v63;
  swift_retain();
  v65[10] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[11] = v64;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v66, v67))
  {
    v5 = *(_QWORD *)(v33 + 616);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v31 = createStorage<A>(capacity:type:)(0);
    v32 = createStorage<A>(capacity:type:)(0);
    v68 = buf;
    v69 = v31;
    v70 = v32;
    serialize(_:at:)(0, &v68);
    serialize(_:at:)(2, &v68);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v59;
    result = closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    if (v5)
      return result;
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v60;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v61;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v62;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v63;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v64;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    _os_log_impl(&dword_241527000, v66, v67, "Finished prediction with wifi model. Predicted value = %f Time taken = %f [ns]", buf, v54);
    destroyStorage<A>(_:count:)(v31, 0, v29);
    destroyStorage<A>(_:count:)(v32, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v18 = *(_QWORD *)(v33 + 536);
  v17 = *(_QWORD *)(v33 + 528);
  v19 = *(_QWORD *)(v33 + 520);
  v23 = *(_QWORD *)(v33 + 464);
  v21 = *(_QWORD *)(v33 + 456);
  v22 = *(_QWORD *)(v33 + 448);
  v25 = *(_QWORD *)(v33 + 440);
  v24 = *(_QWORD *)(v33 + 432);
  v26 = *(_QWORD *)(v33 + 424);
  v20 = *(_QWORD *)(v33 + 416);

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v23, v20 + OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID, v22);
  DataFrame.subscript.getter();
  Column.subscript.getter();
  v27 = *(_QWORD *)(v33 + 208);
  v28 = *(_BYTE *)(v33 + 216);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
  if ((v28 & 1) != 0)
    return _assertionFailure(_:_:file:line:flags:)();
  v14 = *(_QWORD *)(v33 + 600);
  v8 = *(_QWORD *)(v33 + 592);
  v7 = *(_QWORD *)(v33 + 560);
  v15 = *(_QWORD *)(v33 + 552);
  v11 = *(_QWORD *)(v33 + 512);
  v10 = *(_QWORD *)(v33 + 504);
  v9 = *(_QWORD *)(v33 + 480);
  v12 = *(_QWORD *)(v33 + 472);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v33 + 456) + 8))(*(_QWORD *)(v33 + 464), *(_QWORD *)(v33 + 448));
  v16 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v16(v8, v15);
  v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v13(v10, v12);
  __swift_destroy_boxed_opaque_existential_1(v33 + 56);
  v13(v11, v12);
  v16(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v33 + 224) + 8))(v27, v28 & 1);
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v0[75];
  v4 = v0[70];
  v5 = v0[69];
  v7 = v0[64];
  v2 = v0[60];
  v3 = v0[59];
  v0[28] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v8 + 224) + 8))();
}

double implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  double v18;
  int v19;
  double v20;
  unsigned __int8 v21;

  v10 = a2;
  v6 = "Fatal error";
  v7 = "Unexpectedly found nil while unwrapping an Optional value";
  v8 = "MediaML/MLModel.swift";
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v15 = *(_QWORD *)(v17 - 8);
  v9 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v17);
  v16 = (char *)&v4 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v4 - v13;
  (*(void (**)(void))(v2 + 16))();
  DataFrame.subscript.getter();
  Column.subscript.getter();
  v18 = v20;
  v19 = v21;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
  if ((v19 & 1) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v5 = v18;
  }
  v4 = v5;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v4;
}

uint64_t implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  unint64_t v0;
  uint64_t result;
  unint64_t v2;

  v2 = DispatchTime.uptimeNanoseconds.getter();
  v0 = DispatchTime.uptimeNanoseconds.getter();
  result = v2;
  if (v2 < v0)
  {
    __break(1u);
  }
  else
  {
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    return Double.init<A>(_:)();
  }
  return result;
}

uint64_t WifiModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  outlined destroy of Transformer?(v0 + 112);
  v5 = OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL;
  v1 = type metadata accessor for URL();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v5);
  v6 = OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + v6);
  v7 = OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  (*(void (**)(uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v7);
  swift_defaultActor_destroy();
  return v8;
}

uint64_t WifiModel.__deallocating_deinit()
{
  WifiModel.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t WifiModel.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance WifiModel()
{
  return WifiModel.unownedExecutor.getter();
}

uint64_t CellularModel.logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static CellularModel.logger);
}

uint64_t static CellularModel.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = CellularModel.logger.unsafeMutableAddressor();
  v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t variable initialization expression of CellularModel.targetColumnID()
{
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return ColumnID.init(_:_:)();
}

uint64_t CellularModel.targetColumnID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

void variable initialization expression of CellularModel.model(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = 0;
}

uint64_t key path getter for CellularModel.model : CellularModel@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[40];
  uint64_t v7;

  v4 = *a1;
  v2 = swift_retain();
  v7 = v4;
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 120))(v2);
  outlined init with take of Transformer?(v6, a2);
  return swift_release();
}

uint64_t key path setter for CellularModel.model : CellularModel(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD v5[5];

  outlined init with copy of Transformer?(a1, v5);
  v4 = *a2;
  swift_retain();
  (*(void (**)(_QWORD *))(*(_QWORD *)v4 + 128))(v5);
  return swift_release();
}

uint64_t CellularModel.model.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  swift_beginAccess();
  outlined init with copy of Transformer?(v3, a1);
  return swift_endAccess();
}

uint64_t CellularModel.model.setter(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD v5[5];

  outlined init with copy of Transformer?(a1, v5);
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  swift_beginAccess();
  outlined assign with take of Transformer?(v5, v3);
  swift_endAccess();
  return outlined destroy of Transformer?((uint64_t)a1);
}

uint64_t (*CellularModel.model.modify())()
{
  swift_beginAccess();
  return CellularModel.model.modify;
}

uint64_t CellularModel.model.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of CellularModel.cellParametersURL@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v4[1] = a1;
  v7 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v7 - 8);
  v4[0] = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v1 = (char *)v4 - v4[0];
  v6 = (char *)v4 - v4[0];
  v2 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v1, v2, v7);
  v4[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cellParameters.pkg", 0x12uLL, 1)._object;
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v6, v7);
}

uint64_t CellularModel.cellParametersURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL;
  v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t variable initialization expression of CellularModel.estimator@<X0>(uint64_t a1@<X8>)
{
  CellModelGuts.init()();
  return CellModelGuts.estimator.getter(a1);
}

uint64_t CellularModel.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t CellularModel.__allocating_init()()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = v0;
  swift_allocObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = *(_QWORD *)(v0 + 16);
  v1[1] = CellularModel.__allocating_init();
  return CellularModel.init()();
}

uint64_t CellularModel.__allocating_init()(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t CellularModel.init()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[9] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v2 = type metadata accessor for Logger();
  v1[10] = v2;
  v1[11] = *(_QWORD *)(v2 - 8);
  v1[12] = swift_task_alloc();
  v8 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v8 - 8);
  v7 = swift_task_alloc();
  v1[13] = v7;
  v1[3] = v10;
  swift_defaultActor_initialize();
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  ColumnID.init(_:_:)();
  v3 = (_QWORD *)(v10 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  v3[3] = 0;
  v3[4] = 0;
  v4 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v4, v8);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cellParameters.pkg", 0x12uLL, 1);
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  v9 = OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
  CellModelGuts.init()();
  CellModelGuts.estimator.getter(v10 + v9);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *buf;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint32_t v15;
  os_log_type_t v16;
  NSObject *v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 16) = v0;
  v2 = CellularModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v1, v2, v14);
  v17 = Logger.logObject.getter();
  v16 = static os_log_type_t.info.getter();
  *(_QWORD *)(v0 + 32) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v15 = *(_DWORD *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v18 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v17, v16))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v9 = createStorage<A>(capacity:type:)(0);
    v10 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v12 + 40) = buf;
    *(_QWORD *)(v12 + 48) = v9;
    *(_QWORD *)(v12 + 56) = v10;
    serialize(_:at:)(0, (_BYTE **)(v12 + 40));
    serialize(_:at:)(0, (_BYTE **)(v12 + 40));
    *(_QWORD *)(v12 + 64) = v18;
    v11 = (_QWORD *)swift_task_alloc();
    v11[2] = v12 + 40;
    v11[3] = v12 + 48;
    v11[4] = v12 + 56;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_241527000, v17, v16, "New Cell Model created", buf, v15);
    destroyStorage<A>(_:count:)(v9, 0, v7);
    destroyStorage<A>(_:count:)(v10, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
  }
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v12 + 96);
  v4 = *(_QWORD *)(v12 + 88);
  v5 = *(_QWORD *)(v12 + 80);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v12 + 16) + 8))(*(_QWORD *)(v12 + 72));
}

uint64_t CellularModel.getMAPE<A>(data:transformer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;

  v5[20] = v4;
  v5[19] = a4;
  v5[18] = a3;
  v5[17] = a2;
  v5[16] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  v5[13] = 0;
  v5[15] = 0;
  v6 = type metadata accessor for Logger();
  v5[21] = v6;
  v5[22] = *(_QWORD *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v5[25] = swift_task_alloc();
  v7 = type metadata accessor for DataFrame();
  v5[26] = v7;
  v5[27] = *(_QWORD *)(v7 - 8);
  v5[28] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v5[29] = v8;
  v5[30] = *(_QWORD *)(v8 - 8);
  v5[31] = swift_task_alloc();
  v5[3] = a1;
  v5[4] = a2;
  v5[5] = v11;
  return swift_task_switch();
}

uint64_t CellularModel.getMAPE<A>(data:transformer:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *buf;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  Swift::Bool v29;

  v26 = *(_QWORD *)(v0 + 248);
  v25 = *(_QWORD *)(v0 + 240);
  v27 = *(_QWORD *)(v0 + 232);
  v1 = *(_QWORD *)(v0 + 160);
  *(_QWORD *)(v0 + 16) = v0;
  *(double *)(v0 + 48) = -1.0;
  v2 = OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID;
  v3 = *(void (**)(uint64_t, uint64_t))(v25 + 16);
  *(_QWORD *)(v0 + 256) = v3;
  v3(v26, v1 + v2);
  v28._countAndFlagsBits = ColumnID.name.getter();
  v28._object = v4;
  v5 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  *(_QWORD *)(v0 + 264) = v5;
  v5(v26, v27);
  v29 = DataFrame.containsColumn(_:)(v28);
  swift_bridgeObjectRelease();
  if (v29)
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v24 + 272) = v6;
    *v6 = *(_QWORD *)(v24 + 16);
    v6[1] = CellularModel.getMAPE<A>(data:transformer:);
    return TabularTransformer.callAsFunction(_:eventHandler:)();
  }
  else
  {
    v8 = *(_QWORD *)(v24 + 184);
    v18 = *(_QWORD *)(v24 + 176);
    v19 = *(_QWORD *)(v24 + 168);
    v9 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v8, v9, v19);
    v22 = Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    *(_QWORD *)(v24 + 56) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v20 = *(_DWORD *)(v24 + 288);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v23 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v22, v21))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v15 = createStorage<A>(capacity:type:)(0);
      v16 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v24 + 64) = buf;
      *(_QWORD *)(v24 + 72) = v15;
      *(_QWORD *)(v24 + 80) = v16;
      serialize(_:at:)(0, (_BYTE **)(v24 + 64));
      serialize(_:at:)(0, (_BYTE **)(v24 + 64));
      *(_QWORD *)(v24 + 88) = v23;
      v17 = (_QWORD *)swift_task_alloc();
      v17[2] = v24 + 64;
      v17[3] = v24 + 72;
      v17[4] = v24 + 80;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, v22, v21, "No target column in data frame", buf, v20);
      destroyStorage<A>(_:count:)(v15, 0, v13);
      destroyStorage<A>(_:count:)(v16, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v11 = *(_QWORD *)(v24 + 184);
    v10 = *(_QWORD *)(v24 + 176);
    v12 = *(_QWORD *)(v24 + 168);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(double))(*(_QWORD *)(v24 + 16) + 8))(-1.0);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 280) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  Swift::OpaquePointer v20;

  v1 = v0[35];
  v17 = (void (*)(uint64_t, uint64_t))v0[33];
  v2 = (void (*)(void))v0[32];
  v18 = v0[31];
  v16 = v0[29];
  v0[2] = v0;
  v2();
  DataFrame.subscript.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
  lazy protocol witness table accessor for type Column<Double> and conformance Column<A>();
  v19 = Array.init<A>(_:)();
  v17(v18, v16);
  v0[12] = v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double?]);
  lazy protocol witness table accessor for type [Double?] and conformance [A]();
  result = Sequence.compactMap<A>(_:)();
  v20._rawValue = (void *)result;
  if (!v1)
  {
    v11 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v15 + 33);
    v9 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v15 + 32);
    v12 = *((_QWORD *)v15 + 31);
    v10 = *((_QWORD *)v15 + 29);
    v8 = *((_QWORD *)v15 + 20);
    outlined destroy of [Double?]();
    *((_QWORD *)v15 + 13) = result;
    v9(v12, v8 + OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID, v10);
    DataFrame.subscript.getter();
    v13 = Array.init<A>(_:)();
    v11(v12, v10);
    *((_QWORD *)v15 + 14) = v13;
    v14 = Sequence.compactMap<A>(_:)();
    v5 = *((_QWORD *)v15 + 28);
    v4 = *((_QWORD *)v15 + 27);
    v6 = *((_QWORD *)v15 + 26);
    outlined destroy of [Double?]();
    *((_QWORD *)v15 + 15) = v14;
    v7 = meanAbsolutePercentageError(yRealList:yPredList:)((Swift::OpaquePointer)v14, v20);
    v15[6] = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(double))(*((_QWORD *)v15 + 2) + 8))(v7);
  }
  return result;
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in CellularModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8) & 1;
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t closure #2 in CellularModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8) & 1;
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t CellularModel.train(traindata_url:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3[18] = v2;
  v3[17] = a2;
  v3[16] = a1;
  v3[13] = v3;
  v3[14] = 0;
  v3[15] = 0;
  type metadata accessor for CSVReadingOptions();
  v3[19] = swift_task_alloc();
  v4 = type metadata accessor for URL();
  v3[20] = v4;
  v3[21] = *(_QWORD *)(v4 - 8);
  v3[22] = swift_task_alloc();
  v5 = type metadata accessor for DataFrame();
  v3[23] = v5;
  v3[24] = *(_QWORD *)(v5 - 8);
  v3[25] = swift_task_alloc();
  v3[14] = a2;
  v3[15] = v8;
  return swift_task_switch();
}

uint64_t CellularModel.train(traindata_url:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;

  v1 = v0[21];
  v6 = v0[19];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 16))();
  default argument 3 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  default argument 4 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)(v6);
  DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  v4 = (uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(**(_QWORD **)(v5 + 144) + 168)
                                               + **(int **)(**(_QWORD **)(v5 + 144) + 168));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 208) = v2;
  *v2 = *(_QWORD *)(v5 + 104);
  v2[1] = CellularModel.train(traindata_url:);
  return v4(v5 + 16, *(_QWORD *)(v5 + 200));
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 104) = *v1;
  *(_QWORD *)(v2 + 216) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  void *__dst;

  v1 = v0[24];
  __dst = (void *)v0[16];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 8))();
  outlined init with take of ModelStats?(v0 + 2, __dst);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[13] + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[25];
  v2 = v0[24];
  v3 = v0[23];
  v0[13] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[13] + 8))();
}

uint64_t CellularModel.train(dataFrame:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;

  v3[42] = v2;
  v3[41] = a2;
  v3[40] = a1;
  v3[43] = *v2;
  v3[27] = v3;
  v3[28] = 0;
  v3[29] = 0;
  v3[35] = 0;
  v3[36] = 0;
  memset(v3 + 12, 0, 0x50uLL);
  v4 = type metadata accessor for URL();
  v3[44] = v4;
  v3[45] = *(_QWORD *)(v4 - 8);
  v3[46] = swift_task_alloc();
  v5 = type metadata accessor for Logger();
  v3[47] = v5;
  v3[48] = *(_QWORD *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  v6 = type metadata accessor for AnyColumnSlice();
  v3[53] = v6;
  v3[54] = *(_QWORD *)(v6 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v7 = type metadata accessor for DataFrame.Rows();
  v3[58] = v7;
  v3[59] = *(_QWORD *)(v7 - 8);
  v3[60] = swift_task_alloc();
  v3[61] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  v3[62] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  v3[63] = v8;
  v3[64] = *(_QWORD *)(v8 - 8);
  v3[65] = swift_task_alloc();
  v3[66] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  v3[67] = v9;
  v3[68] = *(_QWORD *)(v9 - 8);
  v3[69] = swift_task_alloc();
  v10 = type metadata accessor for DataFrame();
  v3[70] = v10;
  v3[71] = *(_QWORD *)(v10 - 8);
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  v11 = type metadata accessor for DataFrame.Slice();
  v3[74] = v11;
  v3[75] = *(_QWORD *)(v11 - 8);
  v3[76] = swift_task_alloc();
  v3[77] = swift_task_alloc();
  v3[78] = swift_task_alloc();
  v3[79] = swift_task_alloc();
  v3[28] = a2;
  v3[29] = v14;
  return swift_task_switch();
}

uint64_t CellularModel.train(dataFrame:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *buf;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint32_t size;
  os_log_type_t v33;
  NSObject *oslog;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  BOOL v54;

  v47 = v0[79];
  v52 = v0[78];
  v49 = v0[77];
  v53 = v0[76];
  v48 = v0[75];
  v50 = v0[74];
  v0[27] = v0;
  DataFrameProtocol.randomSplit(by:seed:)();
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  v51(v49, v47, v50);
  DataFrame.init(_:)();
  v51(v49, v52, v50);
  DataFrame.init(_:)();
  v54 = DataFrame.Slice.shape.getter() <= 0;
  v51(v53, v52, v50);
  v45 = !v54 && DataFrame.Slice.shape.getter() > 0;
  v1 = *(_QWORD *)(v46 + 608);
  v2 = *(_QWORD *)(v46 + 592);
  v44 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v46 + 600) + 8);
  *(_QWORD *)(v46 + 640) = v44;
  v44(v1, v2);
  if (v45)
  {
    v36 = *(_QWORD *)(v46 + 576);
    v37 = *(_QWORD *)(v46 + 568);
    v38 = *(_QWORD *)(v46 + 560);
    v3 = *(_QWORD *)(v46 + 528);
    v4 = *(_QWORD *)(v46 + 504);
    v39 = *(_QWORD *)(v46 + 496);
    v40 = *(_QWORD *)(v46 + 344);
    v5 = *(_QWORD *)(v46 + 336) + OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 + 512) + 16);
    *(_QWORD *)(v46 + 648) = v6;
    v6(v3, v5, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v39, v36, v38);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v38);
    v7 = swift_allocObject();
    *(_QWORD *)(v46 + 656) = v7;
    *(_QWORD *)(v7 + 16) = v40;
    v41 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    v42 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    v43 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
    v8 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
    *(_QWORD *)(v46 + 176) = v41;
    *(_QWORD *)(v46 + 184) = v42;
    *(_QWORD *)(v46 + 192) = v43;
    *(_QWORD *)(v46 + 200) = v8;
    *(_QWORD *)(v46 + 208) = MEMORY[0x24BEE13F8];
    *(_QWORD *)(v46 + 664) = *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v46 + 672) = v9;
    *v9 = *(_QWORD *)(v46 + 216);
    v9[1] = CellularModel.train(dataFrame:);
    return dispatch thunk of SupervisedTabularEstimator.fitted(to:validateOn:eventHandler:)();
  }
  else
  {
    v11 = *(_QWORD *)(v46 + 392);
    v30 = *(_QWORD *)(v46 + 384);
    v31 = *(_QWORD *)(v46 + 376);
    v12 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v11, v12, v31);
    oslog = Logger.logObject.getter();
    v33 = static os_log_type_t.error.getter();
    *(_QWORD *)(v46 + 240) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    size = *(_DWORD *)(v46 + 752);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v35 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v33))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v27 = createStorage<A>(capacity:type:)(0);
      v28 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v46 + 248) = buf;
      *(_QWORD *)(v46 + 256) = v27;
      *(_QWORD *)(v46 + 264) = v28;
      serialize(_:at:)(0, (_BYTE **)(v46 + 248));
      serialize(_:at:)(0, (_BYTE **)(v46 + 248));
      *(_QWORD *)(v46 + 272) = v35;
      v29 = (_QWORD *)swift_task_alloc();
      v29[2] = v46 + 248;
      v29[3] = v46 + 256;
      v29[4] = v46 + 264;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, oslog, v33, "Cell: Training or validation data is empty", buf, size);
      destroyStorage<A>(_:count:)(v27, 0, v25);
      destroyStorage<A>(_:count:)(v28, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v22 = *(_QWORD *)(v46 + 632);
    v21 = *(_QWORD *)(v46 + 624);
    v23 = *(_QWORD *)(v46 + 592);
    v18 = *(_QWORD *)(v46 + 584);
    v17 = *(_QWORD *)(v46 + 576);
    v16 = *(_QWORD *)(v46 + 568);
    v19 = *(_QWORD *)(v46 + 560);
    v14 = *(_QWORD *)(v46 + 392);
    v13 = *(_QWORD *)(v46 + 384);
    v15 = *(_QWORD *)(v46 + 376);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
    v20 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v20(v17, v19);
    v20(v18, v19);
    v44(v21, v23);
    v44(v22, v23);
    v24 = *(_QWORD *)(v46 + 320);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    *(_QWORD *)v24 = 0;
    *(_QWORD *)(v24 + 8) = 0;
    *(_QWORD *)(v24 + 16) = 0;
    *(_QWORD *)(v24 + 24) = 0;
    *(_QWORD *)(v24 + 32) = 0;
    *(_QWORD *)(v24 + 40) = 0;
    *(_QWORD *)(v24 + 48) = 0;
    *(_QWORD *)(v24 + 56) = 0;
    *(_QWORD *)(v24 + 64) = 0;
    *(_QWORD *)(v24 + 72) = 0;
    *(_BYTE *)(v24 + 80) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v46 + 216) + 8))();
  }
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void (*v3)(uint64_t, uint64_t);
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD, _QWORD);
  _QWORD *v12;
  _QWORD *v13;

  v2 = (_QWORD *)*v1;
  v2[27] = *v1;
  v2 += 27;
  v12 = v2 - 25;
  v13 = v2;
  v2[58] = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v9 = v12[64];
  v7 = v12[62];
  v8 = v12[61];
  v6 = v12[60];
  v10 = v12[40];
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in CellularModel.train(dataFrame:));
  outlined destroy of DataFrame?(v6);
  v3 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v12[84] = v3;
  v3(v9, v8);
  v11 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)v10 + 152)
                                                       + **(int **)(*(_QWORD *)v10 + 152));
  v4 = (_QWORD *)swift_task_alloc();
  v12[85] = v4;
  v12[86] = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
  *v4 = *v13;
  v4[1] = CellularModel.train(dataFrame:);
  return v11(v12[71], v12[67], v12[65]);
}

{
  uint64_t v0;
  Swift::String *v1;
  Swift::String *v2;
  Swift::Int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint32_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  NSObject *log;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint32_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  NSObject *oslog;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint8_t *buf;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  uint64_t countAndFlagsBits;
  uint64_t v102;
  void *object;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t, uint64_t);
  uint64_t v111;
  uint64_t trainingRowCount;
  uint64_t validationRowCount;
  uint64_t carrierCount;
  uint64_t ssidCount;
  uint64_t appNameCount;
  Swift::Double trainingMAPE;
  Swift::Double validationMAPE;
  Swift::Int trainingDate;
  Swift::Int interfaceType;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  _QWORD *v155;
  NSObject *v156;
  os_log_type_t v157;
  uint8_t *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t, uint64_t);
  uint64_t v162;
  uint8_t *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t (*v166)(uint64_t, uint64_t, uint64_t);
  uint64_t v167;
  uint8_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t (*v171)(uint64_t, uint64_t, uint64_t);
  uint64_t v172;

  validationMAPE = *(double *)(v0 + 736);
  trainingMAPE = *(double *)(v0 + 712);
  v97 = *(_QWORD *)(v0 + 488);
  v100 = *(_QWORD *)(v0 + 480);
  v96 = *(_QWORD *)(v0 + 472);
  v98 = *(_QWORD *)(v0 + 464);
  v104 = *(_QWORD *)(v0 + 456);
  v111 = *(_QWORD *)(v0 + 448);
  v106 = *(_QWORD *)(v0 + 440);
  v102 = *(_QWORD *)(v0 + 432);
  v109 = *(_QWORD *)(v0 + 424);
  v108 = *(_QWORD *)(v0 + 416);
  v131 = *(_QWORD *)(v0 + 384);
  v132 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 216) = v0;
  *(Swift::Double *)(v0 + 288) = validationMAPE;
  interfaceType = *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor();
  DataFrame.Slice.rows.getter();
  trainingRowCount = DataFrame.Rows.count.getter();
  v99 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
  v99(v97, v98);
  DataFrame.Slice.rows.getter();
  validationRowCount = DataFrame.Rows.count.getter();
  v99(v100, v98);
  v1 = kMediaML_carrier.unsafeMutableAddressor();
  countAndFlagsBits = v1->_countAndFlagsBits;
  object = v1->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x242695F08](countAndFlagsBits, object);
  AnyColumnSlice.distinct()();
  v110 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
  v110(v111, v109);
  swift_bridgeObjectRelease();
  carrierCount = AnyColumnSlice.count.getter();
  v110(v104, v109);
  v2 = kMediaML_appName.unsafeMutableAddressor();
  v105 = v2->_countAndFlagsBits;
  v107 = v2->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x242695F08](v105, v107);
  AnyColumnSlice.distinct()();
  v110(v106, v109);
  swift_bridgeObjectRelease();
  appNameCount = AnyColumnSlice.count.getter();
  v110(v111, v109);
  trainingDate = getDateInEpoch()();
  ssidCount = default argument 4 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)();
  v3 = default argument 6 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)();
  ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)((MediaML::ModelStats *)(v0 + 16), interfaceType, trainingRowCount, validationRowCount, carrierCount, ssidCount, appNameCount, v3, trainingMAPE, validationMAPE, trainingDate);
  v121 = *(_QWORD *)(v0 + 16);
  v122 = *(_QWORD *)(v0 + 24);
  v123 = *(_QWORD *)(v0 + 32);
  v124 = *(_QWORD *)(v0 + 40);
  v125 = *(_QWORD *)(v0 + 48);
  v126 = *(_QWORD *)(v0 + 56);
  v127 = *(_QWORD *)(v0 + 64);
  v128 = *(_QWORD *)(v0 + 72);
  v129 = *(_QWORD *)(v0 + 80);
  v130 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 96) = v121;
  *(_QWORD *)(v0 + 104) = v122;
  *(_QWORD *)(v0 + 112) = v123;
  *(_QWORD *)(v0 + 120) = v124;
  *(_QWORD *)(v0 + 128) = v125;
  *(_QWORD *)(v0 + 136) = v126;
  *(_QWORD *)(v0 + 144) = v127;
  *(_QWORD *)(v0 + 152) = v128;
  *(_QWORD *)(v0 + 160) = v129;
  *(_QWORD *)(v0 + 168) = v130;
  v4 = CellularModel.logger.unsafeMutableAddressor();
  v133 = *(void (**)(uint64_t, uint64_t, uint64_t))(v131 + 16);
  v133(v108, v4, v132);
  v135 = swift_allocObject();
  memcpy((void *)(v135 + 16), (const void *)(v0 + 16), 0x50uLL);
  v137 = swift_allocObject();
  memcpy((void *)(v137 + 16), (const void *)(v0 + 16), 0x50uLL);
  v139 = swift_allocObject();
  memcpy((void *)(v139 + 16), (const void *)(v0 + 16), 0x50uLL);
  v141 = swift_allocObject();
  memcpy((void *)(v141 + 16), (const void *)(v0 + 16), 0x50uLL);
  v156 = Logger.logObject.getter();
  v157 = static os_log_type_t.info.getter();
  *(_QWORD *)(v0 + 296) = 42;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 756);
  v143 = swift_allocObject();
  *(_BYTE *)(v143 + 16) = 0;
  v144 = swift_allocObject();
  *(_BYTE *)(v144 + 16) = 8;
  v136 = swift_allocObject();
  *(_QWORD *)(v136 + 16) = partial apply for implicit closure #2 in CellularModel.train(dataFrame:);
  *(_QWORD *)(v136 + 24) = v135;
  v145 = swift_allocObject();
  *(_QWORD *)(v145 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(_QWORD *)(v145 + 24) = v136;
  v146 = swift_allocObject();
  *(_BYTE *)(v146 + 16) = 0;
  v147 = swift_allocObject();
  *(_BYTE *)(v147 + 16) = 8;
  v138 = swift_allocObject();
  *(_QWORD *)(v138 + 16) = partial apply for implicit closure #3 in CellularModel.train(dataFrame:);
  *(_QWORD *)(v138 + 24) = v137;
  v148 = swift_allocObject();
  *(_QWORD *)(v148 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(_QWORD *)(v148 + 24) = v138;
  v149 = swift_allocObject();
  *(_BYTE *)(v149 + 16) = 0;
  v150 = swift_allocObject();
  *(_BYTE *)(v150 + 16) = 8;
  v140 = swift_allocObject();
  *(_QWORD *)(v140 + 16) = partial apply for implicit closure #4 in CellularModel.train(dataFrame:);
  *(_QWORD *)(v140 + 24) = v139;
  v151 = swift_allocObject();
  *(_QWORD *)(v151 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v151 + 24) = v140;
  v152 = swift_allocObject();
  *(_BYTE *)(v152 + 16) = 0;
  v153 = swift_allocObject();
  *(_BYTE *)(v153 + 16) = 8;
  v142 = swift_allocObject();
  *(_QWORD *)(v142 + 16) = partial apply for implicit closure #5 in CellularModel.train(dataFrame:);
  *(_QWORD *)(v142 + 24) = v141;
  v154 = swift_allocObject();
  *(_QWORD *)(v154 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v154 + 24) = v142;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v155 = v5;
  swift_retain();
  *v155 = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[1] = v143;
  swift_retain();
  v155[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[3] = v144;
  swift_retain();
  v155[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v155[5] = v145;
  swift_retain();
  v155[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[7] = v146;
  swift_retain();
  v155[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[9] = v147;
  swift_retain();
  v155[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v155[11] = v148;
  swift_retain();
  v155[12] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[13] = v149;
  swift_retain();
  v155[14] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[15] = v150;
  swift_retain();
  v155[16] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[17] = v151;
  swift_retain();
  v155[18] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[19] = v152;
  swift_retain();
  v155[20] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[21] = v153;
  swift_retain();
  v155[22] = closure #1 in OSLogArguments.append(_:)partial apply;
  v155[23] = v154;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v156, v157))
  {
    v6 = *(_QWORD *)(v95 + 744);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v93 = createStorage<A>(capacity:type:)(0);
    v94 = createStorage<A>(capacity:type:)(0);
    v168 = buf;
    v169 = v93;
    v170 = v94;
    serialize(_:at:)(0, &v168);
    serialize(_:at:)(4, &v168);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v143;
    result = closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    if (v6)
      return result;
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v144;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v172 = v145;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v146;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v147;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v172 = v148;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v149;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v150;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v151;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v152;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v153;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v172 = v154;
    closure #1 in osLogInternal(_:log:type:)(&v171, (uint64_t)&v168, (uint64_t)&v169, (uint64_t)&v170);
    _os_log_impl(&dword_241527000, v156, v157, "Cell model stats: trainingRowCount: %ld, validationRowCount: %ld trainingMAPE:%f, validationMAPE: %f", buf, size);
    destroyStorage<A>(_:count:)(v93, 0, v91);
    destroyStorage<A>(_:count:)(v94, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v90 = 0;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v90 = *(_QWORD *)(v95 + 744);
  }
  v89 = *(double *)(v95 + 736);
  v86 = *(_QWORD *)(v95 + 416);
  v85 = *(_QWORD *)(v95 + 384);
  v87 = *(_QWORD *)(v95 + 376);

  v88 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  v88(v86, v87);
  v8.n128_f64[0] = v89;
  if (v89 >= 0.7)
  {
    v47 = *(_QWORD *)(v95 + 736);
    v12 = *(_QWORD *)(v95 + 400);
    v46 = *(_QWORD *)(v95 + 376);
    v13 = CellularModel.logger.unsafeMutableAddressor();
    v133(v12, v13, v46);
    v49 = swift_allocObject();
    *(_QWORD *)(v49 + 16) = v47;
    log = Logger.logObject.getter();
    v60 = static os_log_type_t.info.getter();
    *(_QWORD *)(v95 + 304) = 22;
    UnsignedInteger<>.init<A>(_:)();
    v48 = *(_DWORD *)(v95 + 760);
    v52 = swift_allocObject();
    *(_BYTE *)(v52 + 16) = 0;
    v53 = swift_allocObject();
    *(_BYTE *)(v53 + 16) = 8;
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = partial apply for implicit closure #7 in CellularModel.train(dataFrame:);
    *(_QWORD *)(v50 + 24) = v49;
    v54 = swift_allocObject();
    *(_QWORD *)(v54 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(_QWORD *)(v54 + 24) = v50;
    v55 = swift_allocObject();
    *(_BYTE *)(v55 + 16) = 0;
    v56 = swift_allocObject();
    *(_BYTE *)(v56 + 16) = 8;
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = implicit closure #8 in CellularModel.train(dataFrame:);
    *(_QWORD *)(v51 + 24) = 0;
    v57 = swift_allocObject();
    *(_QWORD *)(v57 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(_QWORD *)(v57 + 24) = v51;
    _allocateUninitializedArray<A>(_:)();
    v58 = v14;
    swift_retain();
    *v58 = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[1] = v52;
    swift_retain();
    v58[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[3] = v53;
    swift_retain();
    v58[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[5] = v54;
    swift_retain();
    v58[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[7] = v55;
    swift_retain();
    v58[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[9] = v56;
    swift_retain();
    v58[10] = closure #1 in OSLogArguments.append(_:)partial apply;
    v58[11] = v57;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v60))
    {
      v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v44 = createStorage<A>(capacity:type:)(0);
      v45 = createStorage<A>(capacity:type:)(0);
      v158 = v43;
      v159 = v44;
      v160 = v45;
      serialize(_:at:)(0, &v158);
      serialize(_:at:)(2, &v158);
      v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v162 = v52;
      result = closure #1 in osLogInternal(_:log:type:)(&v161, (uint64_t)&v158, (uint64_t)&v159, (uint64_t)&v160);
      if (v90)
        return result;
      v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v162 = v53;
      closure #1 in osLogInternal(_:log:type:)(&v161, (uint64_t)&v158, (uint64_t)&v159, (uint64_t)&v160);
      v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v162 = v54;
      closure #1 in osLogInternal(_:log:type:)(&v161, (uint64_t)&v158, (uint64_t)&v159, (uint64_t)&v160);
      v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v162 = v55;
      closure #1 in osLogInternal(_:log:type:)(&v161, (uint64_t)&v158, (uint64_t)&v159, (uint64_t)&v160);
      v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v162 = v56;
      closure #1 in osLogInternal(_:log:type:)(&v161, (uint64_t)&v158, (uint64_t)&v159, (uint64_t)&v160);
      v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v162 = v57;
      closure #1 in osLogInternal(_:log:type:)(&v161, (uint64_t)&v158, (uint64_t)&v159, (uint64_t)&v160);
      _os_log_impl(&dword_241527000, log, v60, "Cell model not updated. Validation MAPE %f exceeds modelMAPEThreshold %f. ", v43, v48);
      destroyStorage<A>(_:count:)(v44, 0, v42);
      destroyStorage<A>(_:count:)(v45, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v43, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    v40 = *(_QWORD *)(v95 + 400);
    v41 = *(_QWORD *)(v95 + 376);

    v88(v40, v41);
LABEL_18:
    v38 = *(void (**)(uint64_t, uint64_t))(v95 + 640);
    v36 = *(_QWORD *)(v95 + 632);
    v35 = *(_QWORD *)(v95 + 624);
    v37 = *(_QWORD *)(v95 + 592);
    v32 = *(_QWORD *)(v95 + 584);
    v31 = *(_QWORD *)(v95 + 576);
    v30 = *(_QWORD *)(v95 + 568);
    v33 = *(_QWORD *)(v95 + 560);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v95 + 544) + 8))(*(_QWORD *)(v95 + 552), *(_QWORD *)(v95 + 536));
    v34 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v34(v31, v33);
    v34(v32, v33);
    v38(v35, v37);
    v38(v36, v37);
    v39 = *(_QWORD *)(v95 + 320);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    *(_QWORD *)v39 = v121;
    *(_QWORD *)(v39 + 8) = v122;
    *(_QWORD *)(v39 + 16) = v123;
    *(_QWORD *)(v39 + 24) = v124;
    *(_QWORD *)(v39 + 32) = v125;
    *(_QWORD *)(v39 + 40) = v126;
    *(_QWORD *)(v39 + 48) = v127;
    *(_QWORD *)(v39 + 56) = v128;
    *(_QWORD *)(v39 + 64) = v129;
    *(_QWORD *)(v39 + 72) = v130;
    *(_BYTE *)(v39 + 80) = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v95 + 216) + 8))();
  }
  v84 = *(_QWORD *)(v95 + 368);
  v82 = *(_QWORD *)(v95 + 360);
  v83 = *(_QWORD *)(v95 + 352);
  v81 = *(_QWORD *)(v95 + 336);
  (*(void (**)(_QWORD, uint64_t, __n128))(v95 + 648))(*(_QWORD *)(v95 + 520), v81 + OBJC_IVAR____TtC7MediaML13CellularModel_estimator, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16))(v84, v81 + OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL, v83);
  default argument 2 of SupervisedTabularEstimator.write(_:to:overwrite:)();
  SupervisedTabularEstimator.write(_:to:overwrite:)();
  if (!v90)
  {
    v69 = *(void (**)(uint64_t, uint64_t))(v95 + 688);
    v67 = *(_QWORD *)(v95 + 520);
    v68 = *(_QWORD *)(v95 + 504);
    v9 = *(_QWORD *)(v95 + 408);
    v70 = *(_QWORD *)(v95 + 376);
    v71 = *(_QWORD *)(v95 + 336);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v95 + 360) + 8))(*(_QWORD *)(v95 + 368), *(_QWORD *)(v95 + 352));
    v69(v67, v68);
    v10 = CellularModel.logger.unsafeMutableAddressor();
    v133(v9, v10, v70);
    swift_retain();
    swift_retain();
    v73 = swift_allocObject();
    *(_QWORD *)(v73 + 16) = partial apply for implicit closure #6 in CellularModel.train(dataFrame:);
    *(_QWORD *)(v73 + 24) = v71;
    swift_release();
    oslog = Logger.logObject.getter();
    v80 = static os_log_type_t.info.getter();
    *(_QWORD *)(v95 + 312) = 12;
    UnsignedInteger<>.init<A>(_:)();
    v72 = *(_DWORD *)(v95 + 764);
    v75 = swift_allocObject();
    *(_BYTE *)(v75 + 16) = 32;
    v76 = swift_allocObject();
    *(_BYTE *)(v76 + 16) = 8;
    v74 = swift_allocObject();
    *(_QWORD *)(v74 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
    *(_QWORD *)(v74 + 24) = v73;
    v77 = swift_allocObject();
    *(_QWORD *)(v77 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(_QWORD *)(v77 + 24) = v74;
    _allocateUninitializedArray<A>(_:)();
    v78 = v11;
    swift_retain();
    *v78 = closure #1 in OSLogArguments.append(_:)partial apply;
    v78[1] = v75;
    swift_retain();
    v78[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v78[3] = v76;
    swift_retain();
    v78[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v78[5] = v77;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v80))
    {
      v64 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v65 = createStorage<A>(capacity:type:)(0);
      v66 = createStorage<A>(capacity:type:)(1);
      v163 = v64;
      v164 = v65;
      v165 = v66;
      serialize(_:at:)(2, &v163);
      serialize(_:at:)(1, &v163);
      v166 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v167 = v75;
      closure #1 in osLogInternal(_:log:type:)(&v166, (uint64_t)&v163, (uint64_t)&v164, (uint64_t)&v165);
      v166 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v167 = v76;
      closure #1 in osLogInternal(_:log:type:)(&v166, (uint64_t)&v163, (uint64_t)&v164, (uint64_t)&v165);
      v166 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v167 = v77;
      closure #1 in osLogInternal(_:log:type:)(&v166, (uint64_t)&v163, (uint64_t)&v164, (uint64_t)&v165);
      _os_log_impl(&dword_241527000, oslog, v80, "Updated cell model written to: %s", v64, v72);
      destroyStorage<A>(_:count:)(v65, 0, v63);
      destroyStorage<A>(_:count:)(v66, 1, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v64, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    v61 = *(_QWORD *)(v95 + 408);
    v62 = *(_QWORD *)(v95 + 376);

    v88(v61, v62);
    goto LABEL_18;
  }
  v17 = *(void (**)(uint64_t, uint64_t))(v95 + 688);
  v29 = *(void (**)(uint64_t, uint64_t))(v95 + 640);
  v27 = *(_QWORD *)(v95 + 632);
  v26 = *(_QWORD *)(v95 + 624);
  v28 = *(_QWORD *)(v95 + 592);
  v23 = *(_QWORD *)(v95 + 584);
  v22 = *(_QWORD *)(v95 + 576);
  v21 = *(_QWORD *)(v95 + 568);
  v24 = *(_QWORD *)(v95 + 560);
  v19 = *(_QWORD *)(v95 + 552);
  v18 = *(_QWORD *)(v95 + 544);
  v20 = *(_QWORD *)(v95 + 536);
  v15 = *(_QWORD *)(v95 + 520);
  v16 = *(_QWORD *)(v95 + 504);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v95 + 360) + 8))(*(_QWORD *)(v95 + 368), *(_QWORD *)(v95 + 352));
  v17(v15, v16);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
  v25 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v25(v22, v24);
  v25(v23, v24);
  v29(v26, v28);
  v29(v27, v28);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v95 + 216) + 8))();
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  v14 = (void (*)(uint64_t, uint64_t))v0[80];
  v12 = v0[79];
  v11 = v0[78];
  v13 = v0[74];
  v8 = v0[73];
  v7 = v0[72];
  v6 = v0[71];
  v9 = v0[70];
  v5 = v0[66];
  v3 = v0[64];
  v4 = v0[63];
  v2 = v0[62];
  v0[27] = v0;
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in CellularModel.train(dataFrame:));
  outlined destroy of DataFrame?(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v4);
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v7, v9);
  v10(v8, v9);
  v14(v11, v13);
  v14(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[27] + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  v13 = (void (*)(uint64_t, uint64_t))v0[80];
  v11 = v0[79];
  v10 = v0[78];
  v12 = v0[74];
  v7 = v0[73];
  v6 = v0[72];
  v5 = v0[71];
  v8 = v0[70];
  v1 = v0[69];
  v2 = v0[68];
  v3 = v0[67];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9(v6, v8);
  v9(v7, v8);
  v13(v10, v12);
  v13(v11, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[27] + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  v13 = (void (*)(uint64_t, uint64_t))v0[80];
  v11 = v0[79];
  v10 = v0[78];
  v12 = v0[74];
  v7 = v0[73];
  v6 = v0[72];
  v5 = v0[71];
  v8 = v0[70];
  v1 = v0[69];
  v2 = v0[68];
  v3 = v0[67];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9(v6, v8);
  v9(v7, v8);
  v13(v10, v12);
  v13(v11, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[27] + 8))();
}

uint64_t CellularModel.train(dataFrame:)(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v9;
  _QWORD *v10;
  double *v11;

  v3 = *v2;
  *(_QWORD *)(v3 + 216) = *v2;
  v9 = (_QWORD *)(v3 + 16);
  v10 = (_QWORD *)(v3 + 216);
  v11 = (double *)(v3 + 280);
  *(double *)(v3 + 712) = a1;
  *(_QWORD *)(v3 + 720) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v4 = v9[40];
  *v11 = a1;
  v7 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)v4 + 152)
                                                              + **(int **)(*(_QWORD *)v4 + 152));
  v5 = (_QWORD *)swift_task_alloc();
  v9[89] = v5;
  *v5 = *v10;
  v5[1] = CellularModel.train(dataFrame:);
  return v7(v9[70], v9[67], v9[65], v9[86]);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 216) = *v2;
  v3 += 216;
  *(double *)(v3 + 520) = a1;
  *(_QWORD *)(v3 + 528) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t closure #1 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE **v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint32_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  uint32_t v76;
  uint64_t v77;
  _QWORD v78[4];
  uint64_t v79;

  v79 = 0;
  v77 = 0;
  v57 = 0;
  v58 = 0;
  v59 = type metadata accessor for Logger();
  v60 = *(_QWORD *)(v59 - 8);
  v61 = (*(_QWORD *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v62 = (char *)&v18 - v61;
  v65 = type metadata accessor for MetricsKey();
  v63 = *(_QWORD *)(v65 - 8);
  v64 = (*(_QWORD *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v65);
  v67 = (char *)&v18 - v64;
  v79 = a1;
  v68 = Event.metrics.getter();
  static MetricsKey.validationError.getter();
  v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Sendable);
  v2 = lazy protocol witness table accessor for type MetricsKey and conformance MetricsKey();
  MEMORY[0x2426960C4](v78, v67, v68, v65, v66, v2);
  swift_bridgeObjectRelease();
  if (v78[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v52 = v69;
      v53 = 0;
    }
    else
    {
      v52 = 0;
      v53 = 1;
    }
    v51 = v53;
    v50 = v52;
    result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v67, v65);
    v55 = v50;
    v56 = v51;
  }
  else
  {
    v54 = 0;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v67, v65);
    result = outlined destroy of Sendable?((uint64_t)v78);
    v55 = v54;
    v56 = 1;
  }
  v49 = v55;
  if ((v56 & 1) == 0)
  {
    v48 = v49;
    v4 = v62;
    v30 = v49;
    v77 = v49;
    v5 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v4, v5, v59);
    v37 = 7;
    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = v30;
    v46 = Logger.logObject.getter();
    v47 = static os_log_type_t.info.getter();
    v33 = &v75;
    v75 = 12;
    v31 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v32 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v34 = v76;
    v35 = 17;
    v40 = swift_allocObject();
    *(_BYTE *)(v40 + 16) = 0;
    v41 = swift_allocObject();
    *(_BYTE *)(v41 + 16) = 8;
    v36 = 32;
    v6 = swift_allocObject();
    v7 = v38;
    v39 = v6;
    *(_QWORD *)(v6 + 16) = partial apply for implicit closure #1 in closure #1 in CellularModel.train(dataFrame:);
    *(_QWORD *)(v6 + 24) = v7;
    v8 = swift_allocObject();
    v9 = v39;
    v43 = v8;
    *(_QWORD *)(v8 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(_QWORD *)(v8 + 24) = v9;
    v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v42 = _allocateUninitializedArray<A>(_:)();
    v44 = v10;
    swift_retain();
    v11 = v40;
    v12 = v44;
    *v44 = closure #1 in OSLogArguments.append(_:)partial apply;
    v12[1] = v11;
    swift_retain();
    v13 = v41;
    v14 = v44;
    v44[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v14[3] = v13;
    swift_retain();
    v15 = v43;
    v16 = v44;
    v44[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v16[5] = v15;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v46, (os_log_type_t)v47))
    {
      v17 = v57;
      v23 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v22 = 0;
      v24 = createStorage<A>(capacity:type:)(0);
      v25 = createStorage<A>(capacity:type:)(v22);
      v26 = &v74;
      v74 = v23;
      v27 = &v73;
      v73 = v24;
      v28 = &v72;
      v72 = v25;
      serialize(_:at:)(0, &v74);
      serialize(_:at:)(1, v26);
      v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v71 = v40;
      closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28);
      v29 = v17;
      if (v17)
      {
        __break(1u);
      }
      else
      {
        v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v71 = v41;
        closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
        v20 = 0;
        v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v71 = v43;
        closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
        _os_log_impl(&dword_241527000, v46, (os_log_type_t)v47, "Validation error: %f", v23, v34);
        v19 = 0;
        destroyStorage<A>(_:count:)(v24, 0, v21);
        destroyStorage<A>(_:count:)(v25, v19, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696394](v23, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v62, v59);
  }
  return result;
}

uint64_t implicit closure #2 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t implicit closure #3 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

double implicit closure #4 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 56);
}

double implicit closure #5 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 64);
}

uint64_t implicit closure #6 in CellularModel.train(dataFrame:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL;
  v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1 + v4);
}

double implicit closure #8 in CellularModel.train(dataFrame:)()
{
  return 0.7;
}

Swift::Void __swiftcall CellularModel.readModelFile()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[32];
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _BYTE v30[8];
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = 0;
  v24 = 0;
  v4[31] = 0;
  v5 = type metadata accessor for Logger();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v8 = (char *)v4 - v7;
  v15 = type metadata accessor for URL();
  v13 = *(_QWORD *)(v15 - 8);
  v9 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v15);
  v22 = (char *)v4 - v9;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  v10 = *(_QWORD *)(v21 - 8);
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21);
  v12 = (char *)v4 - v11;
  v33 = v14;
  (*(void (**)(char *, uint64_t))(v0 + 16))((char *)v4 - v11, v14 + OBJC_IVAR____TtC7MediaML13CellularModel_estimator);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v22, v14 + OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL, v15);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  v16 = (uint64_t *)v30;
  v31 = v1;
  v32 = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  v19 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  v2 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  v25 = v17;
  v26 = v18;
  v27 = v19;
  v28 = v2;
  v29 = MEMORY[0x24BEE13F8];
  swift_getOpaqueTypeConformance2();
  SupervisedTabularEstimator.read(from:)();
  v23 = 0;
  v3 = v14;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v15);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v21);
  (*(void (**)(_BYTE *))(*(_QWORD *)v3 + 128))(v30);
}

void *implicit closure #1 in CellularModel.readModelFile()(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v12 = v8;
  v27 = v12;
  v9[52] = v12;
  v9[51] = v29;
  v9[50] = v28;
  v9[49] = a8;
  v9[48] = a7;
  v9[47] = a6;
  v9[46] = a5;
  v9[45] = a4;
  v9[44] = a3;
  v9[43] = a2;
  v9[42] = a1;
  v9[28] = v9;
  v9[22] = 0;
  v9[23] = 0;
  v9[24] = 0;
  v9[25] = 0;
  v9[29] = 0;
  v9[30] = 0;
  v9[31] = 0;
  v9[32] = 0;
  v9[33] = 0;
  v9[34] = 0;
  v9[35] = 0;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v9[53] = v14;
  v9[54] = *(_QWORD *)(v14 - 8);
  v9[55] = swift_task_alloc();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v9[56] = v15;
  v9[57] = *(_QWORD *)(v15 - 8);
  v9[58] = swift_task_alloc();
  v16 = type metadata accessor for DataFrame();
  v9[59] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v9[60] = v17;
  v9[61] = *(_QWORD *)(v17 + 64);
  v9[62] = swift_task_alloc();
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  v18 = type metadata accessor for Logger();
  v9[65] = v18;
  v9[66] = *(_QWORD *)(v18 - 8);
  v9[67] = swift_task_alloc();
  v9[68] = swift_task_alloc();
  v19 = type metadata accessor for DispatchTime();
  v9[69] = v19;
  v20 = *(_QWORD *)(v19 - 8);
  v9[70] = v20;
  v9[71] = *(_QWORD *)(v20 + 64);
  v9[72] = swift_task_alloc();
  v9[73] = swift_task_alloc();
  v9[74] = swift_task_alloc();
  v9[75] = swift_task_alloc();
  v9[22] = a1;
  v9[23] = a2;
  v9[24] = a3;
  v9[25] = a4;
  v9[29] = a5;
  v9[30] = a6;
  v9[31] = a7;
  v9[32] = a8;
  v9[33] = v28;
  v9[34] = v29;
  v9[35] = v27;
  return swift_task_switch();
}

uint64_t CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  Swift::String *v9;
  uint64_t *v10;
  Swift::String *v11;
  uint64_t *v12;
  Swift::String *v13;
  uint64_t v14;
  uint64_t *v15;
  Swift::String *v16;
  uint64_t v17;
  uint64_t *v18;
  Swift::String *v19;
  uint64_t v20;
  uint64_t *v21;
  Swift::String *v22;
  uint64_t v23;
  uint64_t *v24;
  Swift::String *v25;
  uint64_t v26;
  uint64_t *v27;
  Swift::String *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint32_t v67;
  os_log_type_t v68;
  NSObject *v69;
  uint64_t v70;
  BOOL v71;
  uint64_t *v72;

  v1 = v0[52];
  v0[28] = v0;
  v2 = static DispatchTime.now()();
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 120))(v2);
  v71 = v0[5] == 0;
  outlined destroy of Transformer?((uint64_t)(v72 + 2));
  if (v71)
  {
    v3 = v72[68];
    v65 = v72[66];
    v66 = v72[65];
    v4 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16))(v3, v4, v66);
    v69 = Logger.logObject.getter();
    v68 = static os_log_type_t.debug.getter();
    v72[37] = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v67 = *((_DWORD *)v72 + 156);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v70 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v69, v68))
    {
      v61 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v62 = createStorage<A>(capacity:type:)(0);
      v63 = createStorage<A>(capacity:type:)(0);
      v72[38] = (uint64_t)v61;
      v72[39] = v62;
      v72[40] = v63;
      serialize(_:at:)(0, (_BYTE **)v72 + 38);
      serialize(_:at:)(0, (_BYTE **)v72 + 38);
      v72[41] = v70;
      v64 = (_QWORD *)swift_task_alloc();
      v64[2] = v72 + 38;
      v64[3] = v72 + 39;
      v64[4] = v72 + 40;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, v69, v68, "Reading cell model from disk...", v61, v67);
      destroyStorage<A>(_:count:)(v62, 0, v60);
      destroyStorage<A>(_:count:)(v63, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v61, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v58 = v72[68];
    v57 = v72[66];
    v59 = v72[65];
    v5 = v72[52];

    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8))(v58, v59);
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 176))(v6);
  }
  v7 = v72[52];
  v55 = v72[51];
  v53 = v72[50];
  v52 = v72[49];
  v51 = v72[48];
  v50 = v72[47];
  v49 = v72[46];
  v48 = v72[45];
  v46 = v72[44];
  v43 = v72[43];
  v41 = v72[42];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, [Any?]));
  _allocateUninitializedArray<A>(_:)();
  v56 = v8;
  v9 = kMediaML_carrier.unsafeMutableAddressor();
  outlined init with copy of String(v9, v56);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v40 = _allocateUninitializedArray<A>(_:)();
  v42 = v10;
  swift_bridgeObjectRetain();
  v45 = MEMORY[0x24BEE0D00];
  v42[3] = MEMORY[0x24BEE0D00];
  *v42 = v41;
  v42[1] = v43;
  _finalizeUninitializedArray<A>(_:)();
  v56[2] = v40;
  v11 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v11, v56 + 3);
  v44 = _allocateUninitializedArray<A>(_:)();
  v47 = v12;
  swift_bridgeObjectRetain();
  v47[3] = v45;
  *v47 = v46;
  v47[1] = v48;
  _finalizeUninitializedArray<A>(_:)();
  v56[5] = v44;
  v13 = kMediaML_binnedRssi.unsafeMutableAddressor();
  outlined init with copy of String(v13, v56 + 6);
  v14 = _allocateUninitializedArray<A>(_:)();
  v54 = MEMORY[0x24BEE1768];
  v15[3] = MEMORY[0x24BEE1768];
  *v15 = v49;
  _finalizeUninitializedArray<A>(_:)();
  v56[8] = v14;
  v16 = kMediaML_binnedRsrp.unsafeMutableAddressor();
  outlined init with copy of String(v16, v56 + 9);
  v17 = _allocateUninitializedArray<A>(_:)();
  v18[3] = v54;
  *v18 = v50;
  _finalizeUninitializedArray<A>(_:)();
  v56[11] = v17;
  v19 = kMediaML_binnedRsrq.unsafeMutableAddressor();
  outlined init with copy of String(v19, v56 + 12);
  v20 = _allocateUninitializedArray<A>(_:)();
  v21[3] = v54;
  *v21 = v51;
  _finalizeUninitializedArray<A>(_:)();
  v56[14] = v20;
  v22 = kMediaML_binnedRscp.unsafeMutableAddressor();
  outlined init with copy of String(v22, v56 + 15);
  v23 = _allocateUninitializedArray<A>(_:)();
  v24[3] = v54;
  *v24 = v52;
  _finalizeUninitializedArray<A>(_:)();
  v56[17] = v23;
  v25 = kMediaML_binnedSnr.unsafeMutableAddressor();
  outlined init with copy of String(v25, v56 + 18);
  v26 = _allocateUninitializedArray<A>(_:)();
  v27[3] = v54;
  *v27 = v53;
  _finalizeUninitializedArray<A>(_:)();
  v56[20] = v26;
  v28 = kMediaML_bars.unsafeMutableAddressor();
  outlined init with copy of String(v28, v56 + 21);
  v29 = _allocateUninitializedArray<A>(_:)();
  v30[3] = v54;
  *v30 = v55;
  _finalizeUninitializedArray<A>(_:)();
  v56[23] = v29;
  _finalizeUninitializedArray<A>(_:)();
  v31 = DataFrame.init(dictionaryLiteral:)();
  (*(void (**)(uint64_t))(*(_QWORD *)v7 + 120))(v31);
  if (v72[20])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TabularTransformer);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v72[12] = 0;
      v72[13] = 0;
      v72[14] = 0;
      v72[15] = 0;
      v72[16] = 0;
    }
  }
  else
  {
    outlined destroy of Transformer?((uint64_t)(v72 + 17));
    v72[12] = 0;
    v72[13] = 0;
    v72[14] = 0;
    v72[15] = 0;
    v72[16] = 0;
  }
  if (v72[15])
  {
    outlined init with take of TabularTransformer(v72 + 12, v72 + 7);
    __swift_project_boxed_opaque_existential_1(v72 + 7, v72[10]);
    v32 = (_QWORD *)swift_task_alloc();
    v72[76] = (uint64_t)v32;
    *v32 = v72[28];
    v32[1] = CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
    return TabularTransformer.callAsFunction(_:eventHandler:)();
  }
  else
  {
    v38 = v72[75];
    v37 = v72[70];
    v39 = v72[69];
    v36 = v72[64];
    v34 = v72[60];
    v35 = v72[59];
    outlined destroy of TabularTransformer?((uint64_t)(v72 + 12));
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v35);
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD))(v72[28] + 8))(0, 0);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 224) = *v1;
  *(_QWORD *)(v2 + 616) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint8_t *buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t, uint64_t);
  uint32_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;

  v44 = *(_QWORD *)(v0 + 600);
  v43 = *(_QWORD *)(v0 + 592);
  v49 = *(_QWORD *)(v0 + 584);
  v51 = *(_QWORD *)(v0 + 576);
  v46 = *(_QWORD *)(v0 + 568);
  v47 = *(_QWORD *)(v0 + 560);
  v52 = *(_QWORD *)(v0 + 552);
  v1 = *(_QWORD *)(v0 + 536);
  v34 = *(_QWORD *)(v0 + 528);
  v35 = *(_QWORD *)(v0 + 520);
  v36 = *(_QWORD *)(v0 + 504);
  v40 = *(_QWORD *)(v0 + 496);
  v37 = *(_QWORD *)(v0 + 488);
  v38 = *(_QWORD *)(v0 + 480);
  v41 = *(_QWORD *)(v0 + 472);
  v42 = *(_QWORD *)(v0 + 416);
  *(_QWORD *)(v0 + 224) = v0;
  static DispatchTime.now()();
  v2 = CellularModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v1, v2, v35);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v40, v36, v41);
  swift_retain();
  v39 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v55 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v38 + 32))(v55 + v39, v40, v41);
  *(_QWORD *)(v55 + ((v39 + v37 + 7) & 0xFFFFFFFFFFFFFFF8)) = v42;
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  v45(v49, v43, v52);
  v45(v51, v44, v52);
  v3 = *(_DWORD *)(v47 + 80);
  v48 = (v3 + 16) & ~v3;
  v50 = (v48 + v46 + v3) & ~v3;
  v57 = swift_allocObject();
  v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32);
  v53(v57 + v48, v49, v52);
  v53(v57 + v50, v51, v52);
  v66 = Logger.logObject.getter();
  v67 = static os_log_type_t.default.getter();
  *(_QWORD *)(v0 + 288) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v54 = *(_DWORD *)(v0 + 220);
  v59 = swift_allocObject();
  *(_BYTE *)(v59 + 16) = 0;
  v60 = swift_allocObject();
  *(_BYTE *)(v60 + 16) = 8;
  v56 = swift_allocObject();
  *(_QWORD *)(v56 + 16) = partial apply for implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
  *(_QWORD *)(v56 + 24) = v55;
  v61 = swift_allocObject();
  *(_QWORD *)(v61 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v61 + 24) = v56;
  v62 = swift_allocObject();
  *(_BYTE *)(v62 + 16) = 0;
  v63 = swift_allocObject();
  *(_BYTE *)(v63 + 16) = 8;
  v58 = swift_allocObject();
  *(_QWORD *)(v58 + 16) = partial apply for implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
  *(_QWORD *)(v58 + 24) = v57;
  v64 = swift_allocObject();
  *(_QWORD *)(v64 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v64 + 24) = v58;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v65 = v4;
  swift_retain();
  *v65 = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[1] = v59;
  swift_retain();
  v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[3] = v60;
  swift_retain();
  v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[5] = v61;
  swift_retain();
  v65[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[7] = v62;
  swift_retain();
  v65[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[9] = v63;
  swift_retain();
  v65[10] = closure #1 in OSLogArguments.append(_:)partial apply;
  v65[11] = v64;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v66, v67))
  {
    v5 = *(_QWORD *)(v33 + 616);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v31 = createStorage<A>(capacity:type:)(0);
    v32 = createStorage<A>(capacity:type:)(0);
    v68 = buf;
    v69 = v31;
    v70 = v32;
    serialize(_:at:)(0, &v68);
    serialize(_:at:)(2, &v68);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v59;
    result = closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    if (v5)
      return result;
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v60;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v61;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v62;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v63;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v72 = v64;
    closure #1 in osLogInternal(_:log:type:)(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    _os_log_impl(&dword_241527000, v66, v67, "Finished prediction with cell model. Predicted value = %f Time taken = %f [ns]", buf, v54);
    destroyStorage<A>(_:count:)(v31, 0, v29);
    destroyStorage<A>(_:count:)(v32, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v18 = *(_QWORD *)(v33 + 536);
  v17 = *(_QWORD *)(v33 + 528);
  v19 = *(_QWORD *)(v33 + 520);
  v23 = *(_QWORD *)(v33 + 464);
  v21 = *(_QWORD *)(v33 + 456);
  v22 = *(_QWORD *)(v33 + 448);
  v25 = *(_QWORD *)(v33 + 440);
  v24 = *(_QWORD *)(v33 + 432);
  v26 = *(_QWORD *)(v33 + 424);
  v20 = *(_QWORD *)(v33 + 416);

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v23, v20 + OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID, v22);
  DataFrame.subscript.getter();
  Column.subscript.getter();
  v27 = *(_QWORD *)(v33 + 208);
  v28 = *(_BYTE *)(v33 + 216);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
  if ((v28 & 1) != 0)
    return _assertionFailure(_:_:file:line:flags:)();
  v14 = *(_QWORD *)(v33 + 600);
  v8 = *(_QWORD *)(v33 + 592);
  v7 = *(_QWORD *)(v33 + 560);
  v15 = *(_QWORD *)(v33 + 552);
  v11 = *(_QWORD *)(v33 + 512);
  v10 = *(_QWORD *)(v33 + 504);
  v9 = *(_QWORD *)(v33 + 480);
  v12 = *(_QWORD *)(v33 + 472);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v33 + 456) + 8))(*(_QWORD *)(v33 + 464), *(_QWORD *)(v33 + 448));
  v16 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v16(v8, v15);
  v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v13(v10, v12);
  __swift_destroy_boxed_opaque_existential_1(v33 + 56);
  v13(v11, v12);
  v16(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v33 + 224) + 8))(v27, v28 & 1);
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v0[75];
  v4 = v0[70];
  v5 = v0[69];
  v7 = v0[64];
  v2 = v0[60];
  v3 = v0[59];
  v0[28] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v8 + 224) + 8))();
}

double implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  double v18;
  int v19;
  double v20;
  unsigned __int8 v21;

  v10 = a2;
  v6 = "Fatal error";
  v7 = "Unexpectedly found nil while unwrapping an Optional value";
  v8 = "MediaML/MLModel.swift";
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v15 = *(_QWORD *)(v17 - 8);
  v9 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v17);
  v16 = (char *)&v4 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v4 - v13;
  (*(void (**)(void))(v2 + 16))();
  DataFrame.subscript.getter();
  Column.subscript.getter();
  v18 = v20;
  v19 = v21;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
  if ((v19 & 1) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v5 = v18;
  }
  v4 = v5;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v4;
}

uint64_t implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  unint64_t v0;
  uint64_t result;
  unint64_t v2;

  v2 = DispatchTime.uptimeNanoseconds.getter();
  v0 = DispatchTime.uptimeNanoseconds.getter();
  result = v2;
  if (v2 < v0)
  {
    __break(1u);
  }
  else
  {
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    return Double.init<A>(_:)();
  }
  return result;
}

uint64_t CellularModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v5);
  outlined destroy of Transformer?(v0 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  v6 = OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL;
  v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + v6);
  v7 = OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  (*(void (**)(uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v7);
  swift_defaultActor_destroy();
  return v8;
}

uint64_t CellularModel.__deallocating_deinit()
{
  CellularModel.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t CellularModel.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance CellularModel()
{
  return CellularModel.unownedExecutor.getter();
}

uint64_t _s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcXEfU_TA_0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

void *outlined init with take of ModelStats?(const void *a1, void *__dst)
{
  memcpy(__dst, a1, 0x51uLL);
  return __dst;
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_241552378()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return closure #1 in WifiModel.train(dataFrame:)(a1);
}

uint64_t outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t outlined destroy of DataFrame?(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for DataFrame();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>;
  if (!lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDC5E50], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>;
  if (!lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDC5E48], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>);
    return v1;
  }
  return v3;
}

uint64_t sub_2415524C0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in WifiModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #2 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_2415524F0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in WifiModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #3 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_241552520()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #4 in WifiModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #4 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_241552550()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #5 in WifiModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #5 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v4)(void);
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a3 - 8);
  v8 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v7 - v8;
  v4();
  v13 = dispatch thunk of CustomStringConvertible.description.getter();
  v14 = v5;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  return v13;
}

uint64_t specialized static Array._allocateUninitialized(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
      v1 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v1 + 16) = v4;
      v3 = v1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
      swift_retain();
      v3 = v2;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
    return v3;
  }
  return result;
}

uint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  char IsNativeType;
  char v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;

  v30 = a1;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
  v32 = (*(_QWORD *)(*(_QWORD *)(v31 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v15 - v32;
  if (specialized Array.count.getter(v1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CSVType>);
    v29 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v28 = MEMORY[0x24BEE4B00];
    swift_retain();
    v29 = v28;
  }
  v26 = v29;
  result = specialized Array._getCount()(v30);
  v27 = result;
  if (result)
  {
    v24 = &v33[*(int *)(v31 + 48)];
    v25 = v26 + 64;
    if (v27 <= 0)
    {
      __break(1u);
    }
    else
    {
      v22 = 0;
      swift_retain();
      for (i = v22; ; i = v18)
      {
        v17 = i;
        IsNativeType = specialized Array._hoistableIsNativeTypeChecked()();
        specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)(v17, IsNativeType & 1, v30, v33);
        v18 = v17 + 1;
        v19 = *(_QWORD *)v33;
        v20 = *((_QWORD *)v33 + 1);
        result = specialized __RawDictionaryStorage.find<A>(_:)(v19, v20);
        v21 = result;
        if ((v4 & 1) != 0)
          break;
        v5 = v26;
        v6 = v21;
        v7 = v20;
        v8 = v19;
        *(_QWORD *)(v25 + 8 * (v21 / 0x40)) |= 1 << ((v21 % 0x40) & 0x3F);
        v9 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v6);
        *v9 = v8;
        v9[1] = v7;
        v15 = *(_QWORD *)(v5 + 56);
        v10 = type metadata accessor for CSVType();
        result = (*(uint64_t (**)(unint64_t, char *))(*(_QWORD *)(v10 - 8) + 32))(v15 + v21 * *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72), v24);
        v11 = *(_QWORD *)(v26 + 16);
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_19;
        v13 = v18;
        v14 = v27;
        *(_QWORD *)(v26 + 16) = v16;
        if (v13 == v14)
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
    swift_retain();
    swift_bridgeObjectRelease();
LABEL_16:
    swift_release();
    return v26;
  }
  return result;
}

uint64_t default argument 1 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  uint64_t inited;
  Swift::String *v1;
  uint64_t v3;
  Swift::String *v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  inited = swift_initStackObject();
  v6 = specialized static Array._adoptStorage(_:count:)(inited, 10);
  v5 = v1;
  *v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  v5[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("#N/A", 4uLL, 1);
  v5[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("#N/A N/A", 8uLL, 1);
  v5[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("#NA", 3uLL, 1);
  v5[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("N/A", 3uLL, 1);
  v5[5] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("NA", 2uLL, 1);
  v5[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("NULL", 4uLL, 1);
  v5[7] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("n/a", 3uLL, 1);
  v5[8] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nil", 3uLL, 1);
  v5[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("null", 4uLL, 1);
  specialized _finalizeUninitializedArray<A>(_:)();
  if (specialized Array._getCount()(v6))
    return specialized Set.init(_nonEmptyArrayLiteral:)(v6);
  swift_bridgeObjectRelease();
  v3 = MEMORY[0x24BEE4B08];
  swift_retain();
  return v3;
}

uint64_t default argument 2 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  uint64_t inited;
  Swift::String *v1;
  uint64_t v3;
  Swift::String *v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  inited = swift_initStackObject();
  v6 = specialized static Array._adoptStorage(_:count:)(inited, 4);
  v5 = v1;
  *v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("1", 1uLL, 1);
  v5[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("True", 4uLL, 1);
  v5[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TRUE", 4uLL, 1);
  v5[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("true", 4uLL, 1);
  specialized _finalizeUninitializedArray<A>(_:)();
  if (specialized Array._getCount()(v6))
    return specialized Set.init(_nonEmptyArrayLiteral:)(v6);
  swift_bridgeObjectRelease();
  v3 = MEMORY[0x24BEE4B08];
  swift_retain();
  return v3;
}

uint64_t default argument 3 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  uint64_t inited;
  Swift::String *v1;
  uint64_t v3;
  Swift::String *v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  inited = swift_initStackObject();
  v6 = specialized static Array._adoptStorage(_:count:)(inited, 4);
  v5 = v1;
  *v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0", 1uLL, 1);
  v5[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("False", 5uLL, 1);
  v5[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("FALSE", 5uLL, 1);
  v5[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("false", 5uLL, 1);
  specialized _finalizeUninitializedArray<A>(_:)();
  if (specialized Array._getCount()(v6))
    return specialized Set.init(_nonEmptyArrayLiteral:)(v6);
  swift_bridgeObjectRelease();
  v3 = MEMORY[0x24BEE4B08];
  swift_retain();
  return v3;
}

uint64_t specialized static Array._adoptStorage(_:count:)(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = 2 * a2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> specialized _finalizeUninitializedArray<A>(_:)()
{
  specialized Array._endMutation()();
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  char IsNativeType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE __dst[72];
  _BYTE v22[72];

  if (specialized Array.count.getter(a1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
    v19 = static _SetStorage.allocate(capacity:)();
  }
  else
  {
    v18 = MEMORY[0x24BEE4B08];
    swift_retain();
    v19 = v18;
  }
  v17 = specialized Array._getCount()(a1);
  if (!v17)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    return v19;
  }
  v15 = v19 + 56;
  for (i = 0; ; ++i)
  {
    IsNativeType = specialized Array._hoistableIsNativeTypeChecked()();
    specialized Array._checkSubscript(_:wasNativeTypeChecked:)(i, IsNativeType & 1, a1);
    result = specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)(i, IsNativeType & 1, a1);
    v13 = result;
    v14 = v2;
    if (__OFADD__(i, 1))
      break;
    Hasher.init(_seed:)();
    memcpy(__dst, v22, sizeof(__dst));
    String.hash(into:)();
    result = Hasher._finalize()();
    v10 = (1 << (*(_BYTE *)(v19 + 32) & 0x3F)) - 1;
    v11 = result & v10;
    if ((*(_QWORD *)(v15 + 8 * ((result & (unint64_t)v10) / 0x40)) & (1 << (((result & (unint64_t)v10)
                                                                                     % 0x40) & 0x3F))) != 0)
    {
      result = static String.== infix(_:_:)();
      if ((result & 1) != 0)
        goto LABEL_20;
      if ((*(_QWORD *)(v15 + 8 * (((v11 + 1) & (unint64_t)v10) / 0x40)) & (1 << ((((v11 + 1) & (unint64_t)v10)
                                                                                          % 0x40) & 0x3F))) != 0)
      {
        for (j = (v11 + 1) & v10; ; j = (j + 1) & v10)
        {
          result = static String.== infix(_:_:)();
          if ((result & 1) != 0)
            break;
          if ((*(_QWORD *)(v15 + 8 * (((j + 1) & (unint64_t)v10) / 0x40)) & (1 << ((((j + 1) & (unint64_t)v10)
                                                                                            % 0x40) & 0x3F))) == 0)
          {
            v8 = (j + 1) & v10;
            goto LABEL_22;
          }
        }
LABEL_20:
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      v8 = (v11 + 1) & v10;
    }
    else
    {
      v8 = result & v10;
    }
LABEL_22:
    *(_QWORD *)(v15 + 8 * (v8 / 0x40)) |= 1 << ((v8 % 0x40) & 0x3F);
    v4 = (uint64_t *)(*(_QWORD *)(v19 + 48) + 16 * v8);
    *v4 = v13;
    v4[1] = v14;
    v5 = *(_QWORD *)(v19 + 16);
    v7 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_31;
    *(_QWORD *)(v19 + 16) = v7;
LABEL_27:
    if (i + 1 == v17)
      goto LABEL_29;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t specialized Array._hoistableIsNativeTypeChecked()()
{
  return 1;
}

{
  return 1;
}

uint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(uint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else if (result < *(_QWORD *)(a3 + 16))
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v4;

  if ((a2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a3 + 32 + 16 * a1);
    swift_bridgeObjectRetain();
    return v4;
  }
  else
  {
    result = specialized _ArrayBuffer._getElementSlowPath(_:)(a1, a3);
    __break(1u);
    __break(1u);
  }
  return result;
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)(uint64_t result, uint64_t a2)
{
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (result >= *(_QWORD *)(a2 + 16))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x20 + 8 * result);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) == 0)
  {
    static String._createEmpty(withInitialCapacity:)(82);
    v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Down-casted Array element failed to match the target type\nExpected ", 0x43uLL, 1);
    String.append(_:)(v2);
    swift_bridgeObjectRelease();
    v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("String", 6uLL, 1);
    String.append(_:)(v3);
    swift_bridgeObjectRelease();
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" but found ", 0xBuLL, 1);
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    swift_getObjectType();
    swift_unknownObjectRelease();
    v5._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    String.init(stringInterpolation:)();
    _assertionFailure(_:_:flags:)();
    __break(1u);
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t static String._createEmpty(withInitialCapacity:)(Swift::Int a1)
{
  swift_bridgeObjectRetain();
  if (a1 > 15)
    _StringGuts.grow(_:)(a1);
  return 0;
}

char *specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;

  if ((a2 & 1) != 0)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
    return outlined init with copy of (String, CSVType)((char *)(a3+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80))+ a1 * *(_QWORD *)(*(_QWORD *)(v5 - 8) + 72)), a4);
  }
  else
  {
    v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(a1, a3);
    result = (char *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
    if (*(_QWORD *)(*((_QWORD *)result - 1) + 64) == 8)
    {
      v10 = v6;
      outlined init with copy of (String, CSVType)((char *)&v10, a4);
      return (char *)swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v2;
  _BYTE __dst[72];
  _BYTE v7[72];

  Hasher.init(_seed:)();
  memcpy(__dst, v7, sizeof(__dst));
  String.hash(into:)();
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v2);
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  _QWORD v9[2];
  int v10;
  _QWORD *v11;
  void *object;
  uint64_t ObjectType;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;

  v21 = a1;
  v19 = a2;
  v20 = "Fatal error";
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
  v23 = (*(_QWORD *)(*(_QWORD *)(v22 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  result = MEMORY[0x24BDAC7A8](v21);
  v24 = (uint64_t)v9 - v23;
  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v21 >= *(_QWORD *)(v19 + 16))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v17 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x20 + 8 * v21);
  v18 = &v26;
  v26 = v17;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) == 0)
  {
    v3 = static String._createEmpty(withInitialCapacity:)(82);
    v11 = v25;
    v25[0] = v3;
    v25[1] = v4;
    v10 = 1;
    v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Down-casted Array element failed to match the target type\nExpected ", 0x43uLL, 1);
    v9[0] = v5._object;
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("(String, CSVType)", 0x11uLL, v10 & 1);
    v9[1] = v6._object;
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    v16 = 11;
    v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" but found ", 0xBuLL, v10 & 1);
    object = v7._object;
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    ObjectType = swift_getObjectType();
    swift_unknownObjectRelease();
    v15 = 0;
    v8._countAndFlagsBits = _typeName(_:qualified:)();
    v14 = v8._object;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    String.init(stringInterpolation:)();
    _assertionFailure(_:_:flags:)();
    __break(1u);
  }
  outlined destroy of (String, CSVType)(v24);
  return v17;
}

uint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v9 = (1 << (*(_BYTE *)(v3 + 32) & 0x3F)) - 1;
  v10 = a3 & v9;
  if ((*(_QWORD *)(v3 + 64 + 8 * ((a3 & (unint64_t)v9) / 0x40)) & (1 << (((a3 & (unint64_t)v9) % 0x40) & 0x3F))) == 0)
    return a3 & v9;
  if ((static String.== infix(_:_:)() & 1) != 0)
    return v10;
  if ((*(_QWORD *)(v8 + 64 + 8 * (((v10 + 1) & (unint64_t)v9) / 0x40)) & (1 << ((((v10 + 1) & (unint64_t)v9)
                                                                                         % 0x40) & 0x3F))) != 0)
  {
    v7 = (v10 + 1) & v9;
    while ((static String.== infix(_:_:)() & 1) == 0)
    {
      if ((*(_QWORD *)(v8 + 64 + 8 * (((v7 + 1) & (unint64_t)v9) / 0x40)) & (1 << ((((v7 + 1) & (unint64_t)v9)
                                                                                            % 0x40) & 0x3F))) == 0)
        return (v7 + 1) & v9;
      v7 = (v7 + 1) & v9;
    }
    return v7;
  }
  return (v10 + 1) & v9;
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  id v1;
  void *v3;

  a1();
  v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_241553C04()
{
  return swift_deallocObject();
}

_BYTE **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_241553C34()
{
  return swift_deallocObject();
}

uint64_t sub_241553C64()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_1@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_241553CAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t sub_241553D48()
{
  return swift_deallocObject();
}

uint64_t sub_241553D78()
{
  return swift_deallocObject();
}

uint64_t sub_241553DA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241553DF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241553E8C()
{
  return swift_deallocObject();
}

uint64_t sub_241553EBC()
{
  return swift_deallocObject();
}

uint64_t sub_241553EEC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241553F34()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_241553F7C()
{
  return swift_deallocObject();
}

uint64_t sub_241553FAC()
{
  return swift_deallocObject();
}

uint64_t sub_241553FDC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241554024()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24155406C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #7 in WifiModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #7 in WifiModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_24155409C()
{
  return swift_deallocObject();
}

uint64_t sub_2415540CC()
{
  return swift_deallocObject();
}

uint64_t sub_2415540FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241554144()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24155418C()
{
  return swift_deallocObject();
}

uint64_t sub_2415541BC()
{
  return swift_deallocObject();
}

uint64_t sub_2415541EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241554234()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in WifiModel.train(dataFrame:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return implicit closure #6 in WifiModel.train(dataFrame:)(v1, a1);
}

uint64_t sub_241554284()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = type metadata accessor for URL();
  v1 = lazy protocol witness table accessor for type URL and conformance URL();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    v0 = type metadata accessor for URL();
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDCDB28], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
    return v1;
  }
  return v3;
}

uint64_t sub_241554378()
{
  return swift_deallocObject();
}

uint64_t sub_2415543A8()
{
  return swift_deallocObject();
}

uint64_t sub_2415543D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241554420()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t lazy protocol witness table accessor for type Column<Double> and conformance Column<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type Column<Double> and conformance Column<A>;
  if (!lazy protocol witness table cache variable for type Column<Double> and conformance Column<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Column<Double>);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDF5F98], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type Column<Double> and conformance Column<A>);
    return v1;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type [Double?] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Double?] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double?] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double?]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Double?] and conformance [A]);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Double?]()
{
  swift_bridgeObjectRelease();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;

  v3 = result;
  if ((*(_DWORD *)(*(_QWORD *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    v1 = swift_allocBox();
    result = v2;
    *v3 = v1;
  }
  return result;
}

_QWORD *__swift_deallocate_boxed_opaque_existential_1(_QWORD *result)
{
  uint64_t v1;
  int v2;

  v1 = result[3];
  v2 = *(_DWORD *)(*(_QWORD *)(v1 - 8) + 80);
  if ((v2 & 0x20000) != 0)
    return (_QWORD *)MEMORY[0x242696A90](*result, ((v2 + 16) & ~(unint64_t)v2)+ *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64), v2 | 7);
  return result;
}

uint64_t sub_2415546EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in WifiModel.readModelFile()()
{
  uint64_t v0;

  return implicit closure #1 in WifiModel.readModelFile()(*(void **)(v0 + 16));
}

uint64_t sub_241554730()
{
  return swift_deallocObject();
}

uint64_t sub_241554760()
{
  return swift_deallocObject();
}

uint64_t sub_241554790()
{
  swift_release();
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_2415547D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD *v4;
  id v7;
  uint64_t v8;

  v7 = (id)a4();
  v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v8 + 8;
  v4 = *a2;
  if (*a2)
  {
    *v4 = v7;
    *a2 = v4 + 1;
  }
  else
  {

  }
}

uint64_t sub_24155495C()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3)
{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t outlined destroy of TabularTransformer?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

void *outlined init with take of TabularTransformer(const void *a1, void *__dst)
{
  memcpy(__dst, a1, 0x28uLL);
  return __dst;
}

uint64_t sub_241554A1C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  swift_release();
  return swift_deallocObject();
}

double partial apply for implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for DataFrame() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)(v0 + v2, *(_QWORD *)(v0 + ((v2 + *(_QWORD *)(v1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_241554AF4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(unint64_t);

  v5 = type metadata accessor for DispatchTime();
  v1 = *(_QWORD *)(v5 - 8);
  v2 = (*(_DWORD *)(v1 + 80) + 16) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  v4 = (v2 + *(_QWORD *)(v1 + 64) + *(_DWORD *)(v1 + 80)) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  v6 = *(void (**)(unint64_t))(v1 + 8);
  v6(v0 + v2);
  ((void (*)(unint64_t, uint64_t))v6)(v0 + v4, v5);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  type metadata accessor for DispatchTime();
  return implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)();
}

uint64_t sub_241554BE8()
{
  return swift_deallocObject();
}

uint64_t sub_241554C18()
{
  return swift_deallocObject();
}

uint64_t sub_241554C48()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241554C90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241554CD8()
{
  return swift_deallocObject();
}

uint64_t sub_241554D08()
{
  return swift_deallocObject();
}

uint64_t sub_241554D38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241554D80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241554E78()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return closure #1 in CellularModel.train(dataFrame:)(a1);
}

uint64_t sub_241554EA8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in CellularModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #2 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_241554ED8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in CellularModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #3 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_241554F08()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #4 in CellularModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #4 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_241554F38()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #5 in CellularModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #5 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_241554F68()
{
  return swift_deallocObject();
}

uint64_t sub_241554F98()
{
  return swift_deallocObject();
}

uint64_t sub_241554FC8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555010()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415550AC()
{
  return swift_deallocObject();
}

uint64_t sub_2415550DC()
{
  return swift_deallocObject();
}

uint64_t sub_24155510C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555154()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415551F0()
{
  return swift_deallocObject();
}

uint64_t sub_241555220()
{
  return swift_deallocObject();
}

uint64_t sub_241555250()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555298()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415552E0()
{
  return swift_deallocObject();
}

uint64_t sub_241555310()
{
  return swift_deallocObject();
}

uint64_t sub_241555340()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555388()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415553D0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #7 in CellularModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #7 in CellularModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_241555400()
{
  return swift_deallocObject();
}

uint64_t sub_241555430()
{
  return swift_deallocObject();
}

uint64_t sub_241555460()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415554A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415554F0()
{
  return swift_deallocObject();
}

uint64_t sub_241555520()
{
  return swift_deallocObject();
}

uint64_t sub_241555550()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555598()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in CellularModel.train(dataFrame:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return implicit closure #6 in CellularModel.train(dataFrame:)(v1, a1);
}

uint64_t sub_2415555E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = type metadata accessor for URL();
  v1 = lazy protocol witness table accessor for type URL and conformance URL();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_24155566C()
{
  return swift_deallocObject();
}

uint64_t sub_24155569C()
{
  return swift_deallocObject();
}

uint64_t sub_2415556CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555714()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24155575C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in CellularModel.readModelFile()()
{
  uint64_t v0;

  return implicit closure #1 in CellularModel.readModelFile()(*(void **)(v0 + 16));
}

uint64_t sub_2415557A0()
{
  return swift_deallocObject();
}

uint64_t sub_2415557D0()
{
  return swift_deallocObject();
}

uint64_t sub_241555800()
{
  swift_release();
  return swift_deallocObject();
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_241555848()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241555890()
{
  swift_release();
  return swift_deallocObject();
}

void closure #1 in OSLogArguments.append(_:)partial apply(uint64_t *a1, _QWORD **a2, uint64_t a3)
{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_2415558D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  swift_release();
  return swift_deallocObject();
}

double partial apply for implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for DataFrame() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)(v0 + v2, *(_QWORD *)(v0 + ((v2 + *(_QWORD *)(v1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_2415559B0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(unint64_t);

  v5 = type metadata accessor for DispatchTime();
  v1 = *(_QWORD *)(v5 - 8);
  v2 = (*(_DWORD *)(v1 + 80) + 16) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  v4 = (v2 + *(_QWORD *)(v1 + 64) + *(_DWORD *)(v1 + 80)) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  v6 = *(void (**)(unint64_t))(v1 + 8);
  v6(v0 + v2);
  ((void (*)(unint64_t, uint64_t))v6)(v0 + v4, v5);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  type metadata accessor for DispatchTime();
  return implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)();
}

uint64_t sub_241555AA4()
{
  return swift_deallocObject();
}

uint64_t sub_241555AD4()
{
  return swift_deallocObject();
}

uint64_t sub_241555B04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555B4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555B94()
{
  return swift_deallocObject();
}

uint64_t sub_241555BC4()
{
  return swift_deallocObject();
}

uint64_t sub_241555BF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241555C3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t initializeBufferWithCopyOfBuffer for ModelStats(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy80_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x50uLL);
}

uint64_t getEnumTagSinglePayload for ModelStats(uint64_t a1, int a2)
{
  int v3;

  if (a2)
  {
    if (*(_BYTE *)(a1 + 80))
      v3 = *(_DWORD *)a1;
    else
      v3 = -1;
  }
  else
  {
    v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelStats(uint64_t result, int a2, int a3)
{
  _BOOL4 v3;

  v3 = a3 != 0;
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 72) = 0;
    if (a3)
    {
      if (v3)
        *(_BYTE *)(result + 80) = 1;
      else
        __break(1u);
    }
  }
  else if (a3)
  {
    if (v3)
      *(_BYTE *)(result + 80) = 0;
    else
      __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelStats()
{
  return &type metadata for ModelStats;
}

ValueMetadata *type metadata accessor for WiFiModelGuts()
{
  return &type metadata for WiFiModelGuts;
}

ValueMetadata *type metadata accessor for CellModelGuts()
{
  return &type metadata for CellModelGuts;
}

uint64_t ObjC metadata update function for WifiModel()
{
  return type metadata accessor for WifiModel();
}

uint64_t type metadata accessor for WifiModel()
{
  uint64_t v1;

  v1 = type metadata singleton initialization cache for WifiModel;
  if (!type metadata singleton initialization cache for WifiModel)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t type metadata completion function for WifiModel()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t updated;

  updated = type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    updated = type metadata accessor for ColumnID<Double>();
    if (v1 <= 0x3F)
    {
      updated = type metadata accessor for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0(319);
      if (v2 <= 0x3F)
      {
        updated = swift_updateClassMetadata2();
        if (!updated)
          return 0;
      }
    }
  }
  return updated;
}

uint64_t type metadata accessor for ColumnID<Double>()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;

  v4 = lazy cache variable for type metadata for ColumnID<Double>;
  if (!lazy cache variable for type metadata for ColumnID<Double>)
  {
    v3 = type metadata accessor for ColumnID();
    v4 = v3;
    if (!v0)
    {
      v1 = v3;
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for ColumnID<Double>);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v4;
  uint64_t v6;
  _QWORD v7[5];

  v6 = lazy cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0;
  if (!lazy cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0)
  {
    v7[0] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    v7[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    v7[2] = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
    v7[3] = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
    v7[4] = MEMORY[0x24BEE13F8];
    v4 = MEMORY[0x242696A00](a1, v7, MEMORY[0x24BDC5E18], 0);
    v6 = v4;
    if (!v1)
    {
      v2 = v4;
      atomic_store(v4, (unint64_t *)&lazy cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
      return v2;
    }
  }
  return v6;
}

uint64_t ObjC metadata update function for CellularModel()
{
  return type metadata accessor for CellularModel();
}

uint64_t type metadata accessor for CellularModel()
{
  uint64_t v1;

  v1 = type metadata singleton initialization cache for CellularModel;
  if (!type metadata singleton initialization cache for CellularModel)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t type metadata completion function for CellularModel()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t updated;

  updated = type metadata accessor for ColumnID<Double>();
  if (v0 <= 0x3F)
  {
    updated = type metadata accessor for URL();
    if (v1 <= 0x3F)
    {
      updated = type metadata accessor for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0(319);
      if (v2 <= 0x3F)
      {
        updated = swift_updateClassMetadata2();
        if (!updated)
          return 0;
      }
    }
  }
  return updated;
}

uint64_t sub_241556564()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

void *outlined init with take of Transformer?(const void *a1, void *a2)
{
  memcpy(a2, a1, 0x28uLL);
  return a2;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    v0 = MEMORY[0x242696A30](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
    return v0;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type MetricsKey and conformance MetricsKey()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type MetricsKey and conformance MetricsKey;
  if (!lazy protocol witness table cache variable for type MetricsKey and conformance MetricsKey)
  {
    v0 = type metadata accessor for MetricsKey();
    v1 = MEMORY[0x242696A30](MEMORY[0x24BDC5820], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type MetricsKey and conformance MetricsKey);
    return v1;
  }
  return v3;
}

uint64_t outlined destroy of Sendable?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t sub_241556770()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in CellularModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #1 in closure #1 in CellularModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_2415567A0()
{
  return swift_deallocObject();
}

uint64_t sub_2415567D0()
{
  return swift_deallocObject();
}

uint64_t sub_241556800()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241556848()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241556890()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in WifiModel.train(dataFrame:)()
{
  uint64_t v0;

  return implicit closure #1 in closure #1 in WifiModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_2415568C0()
{
  return swift_deallocObject();
}

uint64_t sub_2415568F0()
{
  return swift_deallocObject();
}

uint64_t sub_241556920()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241556968()
{
  swift_release();
  return swift_deallocObject();
}

char *outlined init with copy of (String, CSVType)(char *a1, char *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  v4 = *((_QWORD *)a1 + 1);
  swift_bridgeObjectRetain();
  *((_QWORD *)a2 + 1) = v4;
  v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType))
              + 48);
  v2 = type metadata accessor for CSVType();
  (*(void (**)(char *, char *))(*(_QWORD *)(v2 - 8) + 16))(&a2[v5], &a1[v5]);
  return a2;
}

uint64_t outlined destroy of (String, CSVType)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType))
              + 48);
  v1 = type metadata accessor for CSVType();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t one-time initialization function for dbPath()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *object;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v11 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v11 - 8);
  v5 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0 = MEMORY[0x24BDAC7A8](v11);
  v1 = (char *)&v4 - v5;
  v10 = (char *)&v4 - v5;
  v6 = dbPath;
  __swift_allocate_value_buffer(v0, dbPath);
  v7 = __swift_project_value_buffer(v11, (uint64_t)v6);
  v2 = mediaMLDataDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v1, v2, v11);
  object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rawdata.db", 0xAuLL, 1)._object;
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t dbPath.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for dbPath != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)dbPath);
}

uint64_t WiFiDataPointForWriting.sessionID.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

double WiFiDataPointForWriting.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t WiFiDataPointForWriting.appName.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForWriting.bucketedSSID.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForWriting.hour.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t WiFiDataPointForWriting.dow.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t WiFiDataPointForWriting.rssi.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t WiFiDataPointForWriting.cca.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t WiFiDataPointForWriting.snr.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t WiFiDataPointForWriting.noise.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

double WiFiDataPointForWriting.txRate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

double WiFiDataPointForWriting.rxRate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 112);
}

double WiFiDataPointForWriting.throughputTrue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 120);
}

void __swiftcall WiFiDataPointForWriting.init(sessionID:timestamp:appName:bucketedSSID:hour:dow:rssi:cca:snr:noise:txRate:rxRate:throughputTrue:)(MediaML::WiFiDataPointForWriting *__return_ptr retstr, Swift::String sessionID, Swift::Double timestamp, Swift::String appName, Swift::String bucketedSSID, Swift::Int hour, Swift::Int dow, Swift::Int rssi, Swift::Int cca, Swift::Int snr, Swift::Int noise, Swift::Double txRate, Swift::Double rxRate, Swift::Double throughputTrue)
{
  Swift::String __src[8];

  __src[0] = sessionID;
  *(Swift::Double *)&__src[1]._countAndFlagsBits = timestamp;
  *(Swift::String *)&__src[1]._object = appName;
  *(Swift::String *)&__src[2]._object = bucketedSSID;
  __src[3]._object = (void *)hour;
  __src[4]._countAndFlagsBits = dow;
  __src[4]._object = (void *)rssi;
  __src[5]._countAndFlagsBits = cca;
  __src[5]._object = (void *)snr;
  __src[6]._countAndFlagsBits = noise;
  *(Swift::Double *)&__src[6]._object = txRate;
  *(Swift::Double *)&__src[7]._countAndFlagsBits = rxRate;
  *(Swift::Double *)&__src[7]._object = throughputTrue;
  memcpy(retstr, __src, sizeof(MediaML::WiFiDataPointForWriting));
}

uint64_t CellDataPointForWriting.sessionID.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

double CellDataPointForWriting.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t CellDataPointForWriting.appName.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForWriting.carrier.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForWriting.hour.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t CellDataPointForWriting.dow.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t CellDataPointForWriting.rssi.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t CellDataPointForWriting.rsrp.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t CellDataPointForWriting.rscp.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t CellDataPointForWriting.rsrq.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

double CellDataPointForWriting.snr.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

uint64_t CellDataPointForWriting.bars.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

double CellDataPointForWriting.throughputTrue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 120);
}

void __swiftcall CellDataPointForWriting.init(sessionID:timestamp:appName:carrier:hour:dow:rssi:rsrp:rscp:rsrq:snr:bars:throughputTrue:)(MediaML::CellDataPointForWriting *__return_ptr retstr, Swift::String sessionID, Swift::Double timestamp, Swift::String appName, Swift::String carrier, Swift::Int hour, Swift::Int dow, Swift::Int rssi, Swift::Int rsrp, Swift::Int rscp, Swift::Int rsrq, Swift::Double snr, Swift::Int bars, Swift::Double throughputTrue)
{
  Swift::String __src[8];

  __src[0] = sessionID;
  *(Swift::Double *)&__src[1]._countAndFlagsBits = timestamp;
  *(Swift::String *)&__src[1]._object = appName;
  *(Swift::String *)&__src[2]._object = carrier;
  __src[3]._object = (void *)hour;
  __src[4]._countAndFlagsBits = dow;
  __src[4]._object = (void *)rssi;
  __src[5]._countAndFlagsBits = rsrp;
  __src[5]._object = (void *)rscp;
  __src[6]._countAndFlagsBits = rsrq;
  *(Swift::Double *)&__src[6]._object = snr;
  __src[7]._countAndFlagsBits = bars;
  *(Swift::Double *)&__src[7]._object = throughputTrue;
  memcpy(retstr, __src, sizeof(MediaML::CellDataPointForWriting));
}

uint64_t WiFiDataPointForPrediciton.appName.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForPrediciton.bucketedSSID.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForPrediciton.hour.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t WiFiDataPointForPrediciton.dow.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t WiFiDataPointForPrediciton.rssi.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t WiFiDataPointForPrediciton.noise.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

double WiFiDataPointForPrediciton.txRate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

double WiFiDataPointForPrediciton.rxRate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 72);
}

void __swiftcall WiFiDataPointForPrediciton.init(appName:bucketedSSID:hour:dow:rssi:noise:txRate:rxRate:)(MediaML::WiFiDataPointForPrediciton *__return_ptr retstr, Swift::String appName, Swift::String bucketedSSID, Swift::Int hour, Swift::Int dow, Swift::Int rssi, Swift::Int noise, Swift::Double txRate, Swift::Double rxRate)
{
  retstr->appName = appName;
  retstr->bucketedSSID = bucketedSSID;
  retstr->hour = hour;
  retstr->dow = dow;
  retstr->rssi = rssi;
  retstr->noise = noise;
  retstr->txRate = txRate;
  retstr->rxRate = rxRate;
}

uint64_t CellDataPointForPrediction.appName.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForPrediction.carrier.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForPrediction.binnedRssi.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t CellDataPointForPrediction.binnedRsrp.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t CellDataPointForPrediction.binnedRscp.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t CellDataPointForPrediction.binnedRsrq.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t CellDataPointForPrediction.binnedSnr.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t CellDataPointForPrediction.bars.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

void __swiftcall CellDataPointForPrediction.init(appName:carrier:binnedRssi:binnedRsrp:binnedRscp:binnedRsrq:binnedSnr:bars:)(MediaML::CellDataPointForPrediction *__return_ptr retstr, Swift::String appName, Swift::String carrier, Swift::Int binnedRssi, Swift::Int binnedRsrp, Swift::Int binnedRscp, Swift::Int binnedRsrq, Swift::Int binnedSnr, Swift::Int bars)
{
  retstr->appName = appName;
  retstr->carrier = carrier;
  retstr->binnedRssi = binnedRssi;
  retstr->binnedRsrp = binnedRsrp;
  retstr->binnedRscp = binnedRscp;
  retstr->binnedRsrq = binnedRsrq;
  retstr->binnedSnr = binnedSnr;
  retstr->bars = bars;
}

uint64_t DataWriter.logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static DataWriter.logger);
}

uint64_t static DataWriter.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = DataWriter.logger.unsafeMutableAddressor();
  v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t variable initialization expression of DataWriter.currentVersion()
{
  return 1;
}

uint64_t DataWriter.currentVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

uint64_t DataWriter.__allocating_init()()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = v0;
  swift_allocObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = *(_QWORD *)(v0 + 16);
  v1[1] = DataWriter.__allocating_init();
  return DataWriter.init()();
}

_QWORD *DataWriter.__allocating_init()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;

  v3 = *v2;
  *(_QWORD *)(v3 + 16) = *v2;
  v7 = (_QWORD *)(v3 + 16);
  v4 = swift_task_dealloc();
  if (v1)
    return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v7 + 8))(v7, v4);
  else
    return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v7 + 8))(v7, a1);
}

uint64_t DataWriter.init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;

  *(_QWORD *)(v1 + 88) = v0;
  *(_QWORD *)(v1 + 96) = *v0;
  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = 0;
  v2 = type metadata accessor for Logger();
  *(_QWORD *)(v1 + 104) = v2;
  *(_QWORD *)(v1 + 112) = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v1 + 120) = swift_task_alloc();
  *(_QWORD *)(v1 + 128) = swift_task_alloc();
  type metadata accessor for SQLiteDB.Location();
  v10 = (const void *)swift_task_alloc();
  *(_QWORD *)(v1 + 136) = v10;
  *(_QWORD *)(v1 + 24) = v0;
  swift_defaultActor_initialize();
  *(_BYTE *)(v1 + 160) = 0;
  *(_BYTE *)(v1 + 160) = 2;
  v0[15] = 1;
  type metadata accessor for SQLiteDB();
  v7 = dbPath.unsafeMutableAddressor();
  v9 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v9 - 8);
  (*(void (**)(const void *, uint64_t))(v8 + 16))(v10, v7);
  (*(void (**)(const void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v9);
  v11 = SQLiteDB.__allocating_init(_:)(v10);
  *(_BYTE *)(v5 + 160) = 3;
  *(_QWORD *)(v6 + 112) = v11;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 144) = v3;
  *v3 = *(_QWORD *)(v5 + 16);
  v3[1] = DataWriter.init();
  return DataWriter.createTables()();
}

_QWORD *DataWriter.init()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *log;
  uint32_t size;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *buf;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint32_t v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  _QWORD *v47;
  _BYTE *v48;
  _QWORD *v49;
  uint32_t *v50;
  _QWORD *v51;
  uint32_t *v52;
  _QWORD *v53;
  uint8_t **v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;

  v63 = *v1;
  v2 = v63;
  v63 = *v1;
  *(_QWORD *)(v2 + 16) = v63;
  v46 = (_QWORD *)(v2 + 16);
  v47 = (_QWORD *)(v2 + 16);
  v48 = (_BYTE *)(v2 + 160);
  v49 = (_QWORD *)(v2 + 32);
  v50 = (uint32_t *)(v2 + 152);
  v51 = (_QWORD *)(v2 + 40);
  v52 = (uint32_t *)(v2 + 156);
  v53 = (_QWORD *)(v2 + 48);
  v54 = (uint8_t **)(v2 + 56);
  v55 = (uint64_t *)(v2 + 64);
  v56 = (uint64_t *)(v2 + 72);
  v57 = (uint64_t *)(v2 + 80);
  swift_task_dealloc();
  if (v0)
  {
    v7 = v46[13];
    v12 = v46[12];
    v13 = v46[11];
    v8 = v45;
    *v49 = v45;
    v9 = DataWriter.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v7, v9, v13);
    v10 = v45;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v45;
    default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
    swift_bridgeObjectRelease();
    log = Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    *v51 = 12;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    size = *v50;
    v30 = swift_allocObject();
    *(_BYTE *)(v30 + 16) = 64;
    v24 = swift_allocObject();
    *(_BYTE *)(v24 + 16) = 8;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = partial apply for implicit closure #1 in DataWriter.init();
    *(_QWORD *)(v15 + 24) = v14;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0;
    *(_QWORD *)(v16 + 24) = v15;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0;
    *(_QWORD *)(v25 + 24) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    v17 = v11;
    swift_retain();
    *v17 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
    v17[1] = v30;
    swift_retain();
    v17[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v17[3] = v24;
    swift_retain();
    v17[4] = _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
    v17[5] = v25;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v21))
    {
      v26 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v28 = createStorage<A>(capacity:type:)(1);
      v29 = createStorage<A>(capacity:type:)(0);
      v58 = v26;
      v59 = v28;
      v60 = v29;
      serialize(_:at:)(2, &v58);
      serialize(_:at:)(1, &v58);
      v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
      v62 = v30;
      closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)&v58, (uint64_t)&v59, (uint64_t)&v60);
      v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v62 = v24;
      closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)&v58, (uint64_t)&v59, (uint64_t)&v60);
      v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
      v62 = v25;
      closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)&v58, (uint64_t)&v59, (uint64_t)&v60);
      _os_log_impl(&dword_241527000, log, v21, "DataWrite creation failed with error=%@", v26, size);
      destroyStorage<A>(_:count:)(v28, 1, v27);
      destroyStorage<A>(_:count:)(v29, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v26, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    v19 = v46[13];
    v18 = v46[12];
    v20 = v46[11];

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
    swift_willThrow();

    if (*v48 == 3)
    {
      swift_release();
    }
    else
    {
      if ((*v48 & 1) != 0)
        swift_release();
      swift_defaultActor_destroy();
      swift_deallocPartialClassInstance();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = swift_task_dealloc();
    return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v47 + 8))(v47, v6);
  }
  else
  {
    v3 = v46[14];
    v39 = v46[12];
    v40 = v46[11];
    v4 = DataWriter.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v3, v4, v40);
    v41 = Logger.logObject.getter();
    v42 = static os_log_type_t.info.getter();
    *v53 = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v43 = *v52;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v44 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v41, v42))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v36 = createStorage<A>(capacity:type:)(0);
      v37 = createStorage<A>(capacity:type:)(0);
      *v54 = buf;
      *v55 = v36;
      *v56 = v37;
      serialize(_:at:)(0, v54);
      serialize(_:at:)(0, v54);
      *v57 = v44;
      v38 = (_QWORD *)swift_task_alloc();
      v38[2] = v54;
      v38[3] = v55;
      v38[4] = v56;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v45)
        return v45;
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, v41, v42, "DataWriter created successfully!", buf, v43);
      destroyStorage<A>(_:count:)(v36, 0, v35);
      destroyStorage<A>(_:count:)(v37, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v33 = v46[14];
    v31 = v46[12];
    v32 = v46[11];

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (_QWORD *)(*(uint64_t (**)(_QWORD))(*v47 + 8))(v46[9]);
  }
}

uint64_t DataWriter.createTables()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[84] = v0;
  v1[58] = v1;
  v1[59] = 0;
  v1[56] = 0;
  v1[57] = 0;
  v1[60] = 0;
  v1[62] = 0;
  v1[63] = 0;
  v1[65] = 0;
  v1[66] = 0;
  v1[68] = 0;
  v1[71] = 0;
  type metadata accessor for SQLiteDB.Location();
  v1[85] = swift_task_alloc();
  v2 = type metadata accessor for URL();
  v1[86] = v2;
  v1[87] = *(_QWORD *)(v2 - 8);
  v1[88] = swift_task_alloc();
  v1[89] = swift_task_alloc();
  v3 = type metadata accessor for Logger();
  v1[90] = v3;
  v1[91] = *(_QWORD *)(v3 - 8);
  v1[92] = swift_task_alloc();
  v1[93] = swift_task_alloc();
  v1[94] = swift_task_alloc();
  v1[95] = swift_task_alloc();
  v1[59] = v0;
  return swift_task_switch();
}

{
  Swift::String *v0;
  Swift::String v1;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._countAndFlagsBits = (uint64_t)v0;
  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CREATE TABLE IF NOT EXISTS \"admin\" (\n\tversion INTEGER NOT NULL\n);\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"processedwifi\" (\n"
         "\tsession_id TEXT NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tssid TEXT NOT NULL,\n"
         "\thour INT NOT NULL,\n"
         "\tdow INT NOT NULL,\n"
         "\trssi INT NOT NULL,\n"
         "\tnoise INT NOT NULL,\n"
         "\ttx_rate DOUBLE NOT NULL,\n"
         "\trx_rate DOUBLE NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"wifi\" (\n"
         "\tsession_id TEXT NOT NULL,\n"
         "\ttimestamp DOUBLE NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tssid TEXT NOT NULL,\n"
         "\thour INT NOT NULL,\n"
         "\tdow INT NOT NULL,\n"
         "\trssi INT NOT NULL,\n"
         "\tcca INT NOT NULL,\n"
         "\tnoise INT NOT NULL,\n"
         "\tsnr INT NOT NULL,\n"
         "\ttx_rate DOUBLE NOT NULL,\n"
         "\trx_rate DOUBLE NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"cell\" (\n"
         "\tsession_id TEXT NOT NULL,\n"
         "\ttimestamp DOUBLE NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tcarrier TEXT NOT NULL,\n"
         "\thour INT NOT NULL,\n"
         "\tdow INT NOT NULL,\n"
         "\trssi INT NOT NULL,\n"
         "\trsrp INT NOT NULL,\n"
         "\trscp INT NOT NULL,\n"
         "\trsrq INT NOT NULL,\n"
         "\tsnr INT NOT NULL,\n"
         "\tbars INT NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"processedcell\" (\n"
         "\tcarrier TEXT NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tbinned_rssi INT NOT NULL,\n"
         "\tbinned_rsrp INT NOT NULL,\n"
         "\tbinned_rscp INT NOT NULL,\n"
         "\tbinned_rsrq INT NOT NULL,\n"
         "\tbinned_snr INT NOT NULL,\n"
         "\tbars INT NOT NULL,\n"
         "\tcount INT NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"modelStats\" (\n"
         "\tinterfaceType Int NOT NULL,\n"
         "\ttrainingRowCount Int NOT NULL,\n"
         "\tvalidationRowCount INT NOT NULL,\n"
         "\tcarrierCount INT NOT NULL,\n"
         "\tssidCount INT NOT NULL,\n"
         "\tappNameCount INT NOT NULL,\n"
         "\tsessionIDCount INT NOT NULL,\n"
         "\ttrainingMAPE DOUBLE NOT NULL,\n"
         "\tvalidationMAPE DOUBLE NOT NULL,\n"
         "\ttrainingDate INT NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"wifiStdDev\" (\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tssid TEXT NOT NULL,\n"
         "\tthroughput_stddev DOUBLE NOT NULL,\n"
         "\ttraining_date INT NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"cellStdDev\" (\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tcarrier TEXT NOT NULL,\n"
         "\tbars INT NOT NULL,\n"
         "\tthroughput_stddev DOUBLE NOT NULL,\n"
         "\ttraining_date INT NOT NULL\n"
         ");",
         0x7DFuLL,
         1);
  v0[48] = v1;
  v0[28] = v1;
  swift_beginAccess();
  v0[49]._countAndFlagsBits = *(_QWORD *)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 768);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 792) = v2;
  if (!v2)
    swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 672);
  *(_QWORD *)(v0 + 464) = v0;
  swift_beginAccess();
  *(_QWORD *)(v0 + 800) = *(_QWORD *)(v2 + 112);
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 808) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from wifi", 0x19uLL, 1);
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[102];
  v2 = v0[101];
  v3 = v0[99];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #1 in DataWriter.createTables());
  v0[103] = v3;
  if (!v3)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint32_t v18;
  os_log_type_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;

  v0[58] = v0;
  v23 = v0[61];
  v0[63] = v23;
  if (v23 < *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor())
  {
    *(_QWORD *)(v22 + 936) = *(_QWORD *)(v22 + 824);
    v5 = *(_QWORD *)(v22 + 672);
    swift_beginAccess();
    *(_QWORD *)(v22 + 944) = *(_QWORD *)(v5 + 112);
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v22 + 952) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from cell", 0x19uLL, 1);
    return swift_task_switch();
  }
  v1 = *(_QWORD *)(v22 + 760);
  v16 = *(_QWORD *)(v22 + 728);
  v17 = *(_QWORD *)(v22 + 720);
  v2 = DataWriter.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v2, v17);
  v20 = Logger.logObject.getter();
  v19 = static os_log_type_t.info.getter();
  *(_QWORD *)(v22 + 632) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v18 = *(_DWORD *)(v22 + 1308);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v21 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(v20, v19))
  {
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v22 + 824);
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(v22 + 824);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v13 = createStorage<A>(capacity:type:)(0);
  v14 = createStorage<A>(capacity:type:)(0);
  *(_QWORD *)(v22 + 640) = buf;
  *(_QWORD *)(v22 + 648) = v13;
  *(_QWORD *)(v22 + 656) = v14;
  serialize(_:at:)(0, (_BYTE **)(v22 + 640));
  serialize(_:at:)(0, (_BYTE **)(v22 + 640));
  *(_QWORD *)(v22 + 664) = v21;
  v15 = (_QWORD *)swift_task_alloc();
  v15[2] = v22 + 640;
  v15[3] = v22 + 648;
  v15[4] = v22 + 656;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_241527000, v20, v19, "Wifi raw data too large, deleting...", buf, v18);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
    v10 = 0;
LABEL_7:
    *(_QWORD *)(v22 + 832) = v10;
    v7 = *(_QWORD *)(v22 + 760);
    v6 = *(_QWORD *)(v22 + 728);
    v8 = *(_QWORD *)(v22 + 720);
    v9 = *(_QWORD *)(v22 + 672);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    swift_beginAccess();
    *(_QWORD *)(v22 + 840) = *(_QWORD *)(v9 + 112);
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v22 + 848) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM wifi", 0x10uLL, 1);
    return swift_task_switch();
  }
  return result;
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 848);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 864) = v2;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  v0[54]._object = *(void **)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  v0[55] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return swift_task_switch();
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 880);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 896) = v2;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  v0[56]._object = *(void **)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  v0[57] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pragma wal_checkpoint(truncate)", 0x1FuLL, 1);
  return swift_task_switch();
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 912);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 928) = v2;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 464) = v0;
  *(_QWORD *)(v0 + 936) = *(_QWORD *)(v0 + 928);
  v2 = *(_QWORD *)(v0 + 672);
  swift_beginAccess();
  *(_QWORD *)(v0 + 944) = *(_QWORD *)(v2 + 112);
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 952) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from cell", 0x19uLL, 1);
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[120];
  v2 = v0[119];
  v3 = v0[117];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #2 in DataWriter.createTables());
  v0[121] = v3;
  if (!v3)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint32_t v18;
  os_log_type_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;

  v0[58] = v0;
  v23 = v0[64];
  v0[66] = v23;
  if (v23 < *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor())
  {
    *(_QWORD *)(v22 + 1080) = *(_QWORD *)(v22 + 968);
    v5 = *(_QWORD *)(v22 + 672);
    swift_beginAccess();
    *(_QWORD *)(v22 + 1088) = *(_QWORD *)(v5 + 112);
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v22 + 1096) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT version FROM admin", 0x19uLL, 1);
    return swift_task_switch();
  }
  v1 = *(_QWORD *)(v22 + 752);
  v16 = *(_QWORD *)(v22 + 728);
  v17 = *(_QWORD *)(v22 + 720);
  v2 = DataWriter.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v2, v17);
  v20 = Logger.logObject.getter();
  v19 = static os_log_type_t.info.getter();
  *(_QWORD *)(v22 + 592) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v18 = *(_DWORD *)(v22 + 1304);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v21 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(v20, v19))
  {
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v22 + 968);
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(v22 + 968);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v13 = createStorage<A>(capacity:type:)(0);
  v14 = createStorage<A>(capacity:type:)(0);
  *(_QWORD *)(v22 + 600) = buf;
  *(_QWORD *)(v22 + 608) = v13;
  *(_QWORD *)(v22 + 616) = v14;
  serialize(_:at:)(0, (_BYTE **)(v22 + 600));
  serialize(_:at:)(0, (_BYTE **)(v22 + 600));
  *(_QWORD *)(v22 + 624) = v21;
  v15 = (_QWORD *)swift_task_alloc();
  v15[2] = v22 + 600;
  v15[3] = v22 + 608;
  v15[4] = v22 + 616;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_241527000, v20, v19, "Cell raw data too large, deleting...", buf, v18);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
    v10 = 0;
LABEL_7:
    *(_QWORD *)(v22 + 976) = v10;
    v7 = *(_QWORD *)(v22 + 752);
    v6 = *(_QWORD *)(v22 + 728);
    v8 = *(_QWORD *)(v22 + 720);
    v9 = *(_QWORD *)(v22 + 672);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    swift_beginAccess();
    *(_QWORD *)(v22 + 984) = *(_QWORD *)(v9 + 112);
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v22 + 992) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM cell", 0x10uLL, 1);
    return swift_task_switch();
  }
  return result;
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 992);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 1008) = v2;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  v0[63]._object = *(void **)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  v0[64] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return swift_task_switch();
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 1024);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 1040) = v2;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  v0[65]._object = *(void **)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  v0[66] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pragma wal_checkpoint(truncate)", 0x1FuLL, 1);
  return swift_task_switch();
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 1056);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 1072) = v2;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 464) = v0;
  *(_QWORD *)(v0 + 1080) = *(_QWORD *)(v0 + 1072);
  v2 = *(_QWORD *)(v0 + 672);
  swift_beginAccess();
  *(_QWORD *)(v0 + 1088) = *(_QWORD *)(v2 + 112);
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 1096) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT version FROM admin", 0x19uLL, 1);
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[138];
  v2 = v0[137];
  v3 = v0[135];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #3 in DataWriter.createTables());
  v0[139] = v3;
  if (!v3)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t size;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[84];
  v0[58] = v0;
  v35 = v0[67];
  v0[68] = v35;
  if (v35 == *(_QWORD *)(v1 + 120))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v34 + 464) + 8))();
  }
  else
  {
    v2 = *(_QWORD *)(v34 + 744);
    v18 = *(_QWORD *)(v34 + 728);
    v19 = *(_QWORD *)(v34 + 720);
    v23 = *(_QWORD *)(v34 + 672);
    v3 = DataWriter.logger.unsafeMutableAddressor();
    v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    *(_QWORD *)(v34 + 1120) = v4;
    v4(v2, v3, v19);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v35;
    swift_retain();
    v32 = Logger.logObject.getter();
    v33 = static os_log_type_t.error.getter();
    *(_QWORD *)(v34 + 552) = 22;
    *(_QWORD *)(v34 + 1128) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(_QWORD *)(v34 + 1136) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(_QWORD *)(v34 + 1144) = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    size = *(_DWORD *)(v34 + 1296);
    v25 = swift_allocObject();
    *(_BYTE *)(v25 + 16) = 0;
    v26 = swift_allocObject();
    *(_BYTE *)(v26 + 16) = 8;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = partial apply for implicit closure #1 in DataWriter.createTables();
    *(_QWORD *)(v22 + 24) = v21;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = _sSiIegd_SiIegr_TRTA_2;
    *(_QWORD *)(v27 + 24) = v22;
    v28 = swift_allocObject();
    *(_BYTE *)(v28 + 16) = 0;
    v29 = swift_allocObject();
    *(_BYTE *)(v29 + 16) = 8;
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = partial apply for implicit closure #2 in DataWriter.createTables();
    *(_QWORD *)(v24 + 24) = v23;
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(_QWORD *)(v30 + 24) = v24;
    *(_QWORD *)(v34 + 1152) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    v31 = v5;
    swift_retain();
    *v31 = closure #1 in OSLogArguments.append(_:)partial apply;
    v31[1] = v25;
    swift_retain();
    v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v31[3] = v26;
    swift_retain();
    v31[4] = _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
    v31[5] = v27;
    swift_retain();
    v31[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v31[7] = v28;
    swift_retain();
    v31[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v31[9] = v29;
    swift_retain();
    v31[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v31[11] = v30;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (!os_log_type_enabled(v32, v33))
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v13 = *(_QWORD *)(v34 + 1112);
      goto LABEL_7;
    }
    v6 = *(_QWORD *)(v34 + 1112);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v16 = createStorage<A>(capacity:type:)(0);
    v17 = createStorage<A>(capacity:type:)(0);
    v36 = buf;
    v39 = v16;
    v40[0] = v17;
    serialize(_:at:)(0, &v36);
    serialize(_:at:)(2, &v36);
    v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v38 = v25;
    result = closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v36, (uint64_t)&v39, (uint64_t)v40);
    if (!v6)
    {
      v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v38 = v26;
      closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v36, (uint64_t)&v39, (uint64_t)v40);
      v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
      v38 = v27;
      closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v36, (uint64_t)&v39, (uint64_t)v40);
      v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v38 = v28;
      closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v36, (uint64_t)&v39, (uint64_t)v40);
      v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v38 = v29;
      closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v36, (uint64_t)&v39, (uint64_t)v40);
      v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v38 = v30;
      closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v36, (uint64_t)&v39, (uint64_t)v40);
      _os_log_impl(&dword_241527000, v32, v33, "DB Version mis-match %ld != %ld, deleting old DB...", buf, size);
      destroyStorage<A>(_:count:)(v16, 0, v14);
      destroyStorage<A>(_:count:)(v17, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v13 = 0;
LABEL_7:
      *(_QWORD *)(v34 + 1160) = v13;
      v10 = *(_QWORD *)(v34 + 744);
      v9 = *(_QWORD *)(v34 + 728);
      v11 = *(_QWORD *)(v34 + 720);
      v12 = *(_QWORD *)(v34 + 672);

      v8 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      *(_QWORD *)(v34 + 1168) = v8;
      v8(v10, v11);
      swift_beginAccess();
      *(_QWORD *)(v34 + 1176) = *(_QWORD *)(v12 + 112);
      swift_retain();
      swift_endAccess();
      return swift_task_switch();
    }
  }
  return result;
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSURL *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSURL *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  unsigned __int8 v28;
  _QWORD *v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  unsigned __int8 v38;

  v34 = v0[89];
  v1 = v0[88];
  v31 = v0[87];
  v32 = v0[86];
  v0[58] = v0;
  v37 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v2 = dbPath.unsafeMutableAddressor();
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
  v30(v1, v2, v32);
  URL.deletingLastPathComponent()();
  v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  v33(v1, v32);
  URL._bridgeToObjectiveC()(v3);
  v36 = v4;
  v33(v34, v32);
  v0[70] = 0;
  v38 = objc_msgSend(v37, sel_removeItemAtURL_error_, v36, v0 + 70);
  v35 = (void *)v0[70];
  v5 = v35;

  if ((v38 & 1) == 0)
  {
    v16 = _convertNSErrorToError(_:)();

    swift_willThrow();
    v17 = (id)v16;
LABEL_6:
    v29[160] = v17;
    v18 = v29[84];
    v13 = v17;
    v29[71] = v17;
    swift_beginAccess();
    v29[161] = *(_QWORD *)(v18 + 112);
    swift_retain();
    swift_endAccess();
    return swift_task_switch();
  }
  v6 = v29[89];
  v24 = v29[86];
  v27 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v7 = mediaMLDataDirectory.unsafeMutableAddressor();
  v30(v6, v7, v24);
  URL._bridgeToObjectiveC()(v8);
  v26 = v9;
  v33(v6, v24);
  v29[72] = 0;
  v28 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v26, 1, 0, v29 + 72);
  v25 = (void *)v29[72];
  v10 = v25;

  if ((v28 & 1) == 0)
  {
    v15 = _convertNSErrorToError(_:)();

    swift_willThrow();
    v17 = (id)v15;
    goto LABEL_6;
  }
  v11 = (void *)v29[145];
  v20 = v29[87];
  v21 = v29[86];
  v22 = (const void *)v29[85];
  type metadata accessor for SQLiteDB();
  v12 = dbPath.unsafeMutableAddressor();
  v30((uint64_t)v22, v12, v21);
  (*(void (**)(const void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v22, 0, 1, v21);
  v23 = SQLiteDB.__allocating_init(_:)(v22);
  v29[148] = v11;
  if (v11)
  {
    v17 = v11;
    goto LABEL_6;
  }
  v19 = v29[84];
  swift_beginAccess();
  *(_QWORD *)(v19 + 112) = v23;
  swift_release();
  swift_endAccess();
  swift_beginAccess();
  v29[149] = *(_QWORD *)(v19 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;

  v1 = *(Swift::String *)(v0 + 768);
  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(_QWORD *)(v0 + 1200) = v2;
  if (!v2)
    swift_release();
  return swift_task_switch();
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  v0[75]._object = *(void **)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  v0[76] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO admin (version) VALUES (?)", 0x26uLL, 1);
  swift_retain();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[153];
  v2 = v0[152];
  v3 = v0[150];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #4 in DataWriter.createTables());
  v0[154] = v3;
  if (!v3)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint8_t *buf;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1120);
  v1 = *(_QWORD *)(v0 + 736);
  v14 = *(_QWORD *)(v0 + 720);
  v17 = *(_QWORD *)(v0 + 672);
  *(_QWORD *)(v0 + 464) = v0;
  v2 = DataWriter.logger.unsafeMutableAddressor();
  v15(v1, v2, v14);
  swift_retain();
  v23 = Logger.logObject.getter();
  v24 = static os_log_type_t.info.getter();
  *(_QWORD *)(v0 + 584) = 12;
  UnsignedInteger<>.init<A>(_:)();
  v16 = *(_DWORD *)(v0 + 1300);
  v19 = swift_allocObject();
  *(_BYTE *)(v19 + 16) = 0;
  v20 = swift_allocObject();
  *(_BYTE *)(v20 + 16) = 8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = partial apply for implicit closure #3 in DataWriter.createTables();
  *(_QWORD *)(v18 + 24) = v17;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(_QWORD *)(v21 + 24) = v18;
  _allocateUninitializedArray<A>(_:)();
  v22 = v3;
  swift_retain();
  *v22 = closure #1 in OSLogArguments.append(_:)partial apply;
  v22[1] = v19;
  swift_retain();
  v22[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v22[3] = v20;
  swift_retain();
  v22[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v22[5] = v21;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v23, v24))
  {
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_6;
  }
  v4 = v13[154];
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v11 = createStorage<A>(capacity:type:)(0);
  v12 = createStorage<A>(capacity:type:)(0);
  v25 = buf;
  v28 = v11;
  v29[0] = v12;
  serialize(_:at:)(0, &v25);
  serialize(_:at:)(1, &v25);
  v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v27 = v19;
  result = closure #1 in osLogInternal(_:log:type:)(&v26, (uint64_t)&v25, (uint64_t)&v28, (uint64_t)v29);
  if (!v4)
  {
    v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v27 = v20;
    closure #1 in osLogInternal(_:log:type:)(&v26, (uint64_t)&v25, (uint64_t)&v28, (uint64_t)v29);
    v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v27 = v21;
    closure #1 in osLogInternal(_:log:type:)(&v26, (uint64_t)&v25, (uint64_t)&v28, (uint64_t)v29);
    _os_log_impl(&dword_241527000, v23, v24, "Created new DB with version=%ld", buf, v16);
    destroyStorage<A>(_:count:)(v11, 0, v9);
    destroyStorage<A>(_:count:)(v12, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
LABEL_6:
    v8 = (void (*)(uint64_t, uint64_t))v13[146];
    v6 = v13[92];
    v7 = v13[90];

    v8(v6, v7);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v13[58] + 8))();
  }
  return result;
}

{
  _QWORD *v0;
  id v1;
  id v3;
  uint64_t v4;

  v3 = (id)v0[99];
  v4 = v0[84];
  v0[58] = v0;
  swift_release();
  v1 = v3;
  v0[60] = v3;
  swift_beginAccess();
  v0[155] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 792);
  *(_QWORD *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 464) + 8))();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 1248);
  *(_QWORD *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 464) + 8))();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[103];
  v0[156] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  v0[157] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[108];
  v0[156] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  v0[157] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[112];
  v0[156] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  v0[157] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[116];
  v0[156] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  v0[157] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 1264);
  *(_QWORD *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 464) + 8))();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[121];
  v0[158] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  v0[159] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[126];
  v0[158] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  v0[159] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[130];
  v0[158] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  v0[159] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[134];
  v0[158] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  v0[159] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 464) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 464) + 8))();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 1280);
  *(_QWORD *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 464) + 8))();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_release();
  v3 = (void *)v0[150];
  v0[160] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[71] = v3;
  swift_beginAccess();
  v0[161] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

{
  _QWORD *v0;
  id v1;
  void *v3;
  uint64_t v4;

  v0[58] = v0;
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (void *)v0[154];
  v0[160] = v3;
  v4 = v0[84];
  v1 = v3;
  v0[71] = v3;
  swift_beginAccess();
  v0[161] = *(_QWORD *)(v4 + 112);
  swift_retain();
  swift_endAccess();
  return swift_task_switch();
}

void *implicit closure #1 in DataWriter.init()(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t sub_24155D610()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in DataWriter.init()()
{
  uint64_t v0;

  return implicit closure #1 in DataWriter.init()(*(void **)(v0 + 16));
}

uint64_t DataWriter.writeRawDataForWiFi(data:)(void *__src)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v2[40] = v1;
  v2[39] = __src;
  v2[37] = v2;
  v2[38] = 0;
  memcpy(v2 + 18, __src, 0x80uLL);
  memcpy(v2 + 2, v2 + 18, 0x80uLL);
  v2[38] = v4;
  return swift_task_switch();
}

uint64_t DataWriter.writeRawDataForWiFi(data:)()
{
  Swift::String *v0;
  uint64_t v1;
  uint64_t countAndFlagsBits;
  uint64_t object;

  countAndFlagsBits = v0[20]._countAndFlagsBits;
  object = (uint64_t)v0[19]._object;
  v0[18]._object = v0;
  swift_beginAccess();
  v0[20]._object = *(void **)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  v0[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO wifi (session_id, timestamp, app_name, ssid, hour, dow, rssi, cca, noise, snr, tx_rate, rx_rate, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0xACuLL, 1);
  outlined retain of WiFiDataPointForWriting(object);
  v1 = swift_task_alloc();
  v0[22]._countAndFlagsBits = v1;
  *(_QWORD *)(v1 + 16) = object;
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[43];
  v2 = v0[42];
  v0[37] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #1 in DataWriter.writeRawDataForWiFi(data:));
  v0[45] = 0;
  v4 = *(_QWORD *)(v5 + 312);
  swift_task_dealloc();
  outlined release of WiFiDataPointForWriting(v4);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 296) = v0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 296) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 312);
  *(_QWORD *)(v0 + 296) = v0;
  swift_task_dealloc();
  outlined release of WiFiDataPointForWriting(v2);
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 296) + 8))();
}

uint64_t closure #1 in DataWriter.writeRawDataForWiFi(data:)(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  v10 = v3;
  v24 = *a2;
  outlined retain of String();
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 24) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 32) = &protocol witness table for String;
  *(_OWORD *)v10 = v24;
  v23 = *((_QWORD *)a2 + 2);
  v9 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v10 + 64) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v10 + 72) = &protocol witness table for Double;
  *(_QWORD *)(v10 + 40) = v23;
  v22 = *(__int128 *)((char *)a2 + 24);
  outlined retain of String();
  *(_QWORD *)(v10 + 104) = v7;
  *(_QWORD *)(v10 + 112) = &protocol witness table for String;
  *(_OWORD *)(v10 + 80) = v22;
  v21 = *(__int128 *)((char *)a2 + 40);
  outlined retain of String();
  *(_QWORD *)(v10 + 144) = v7;
  *(_QWORD *)(v10 + 152) = &protocol witness table for String;
  *(_OWORD *)(v10 + 120) = v21;
  v20 = *((_QWORD *)a2 + 7);
  v4 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v10 + 184) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v10 + 192) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 160) = v20;
  v19 = *((_QWORD *)a2 + 8);
  *(_QWORD *)(v10 + 224) = v4;
  *(_QWORD *)(v10 + 232) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 200) = v19;
  v18 = *((_QWORD *)a2 + 9);
  *(_QWORD *)(v10 + 264) = v4;
  *(_QWORD *)(v10 + 272) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 240) = v18;
  v17 = *((_QWORD *)a2 + 10);
  *(_QWORD *)(v10 + 304) = v4;
  *(_QWORD *)(v10 + 312) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 280) = v17;
  v16 = *((_QWORD *)a2 + 12);
  *(_QWORD *)(v10 + 344) = v4;
  *(_QWORD *)(v10 + 352) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 320) = v16;
  v15 = *((_QWORD *)a2 + 11);
  *(_QWORD *)(v10 + 384) = v4;
  *(_QWORD *)(v10 + 392) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 360) = v15;
  v14 = *((_QWORD *)a2 + 13);
  *(_QWORD *)(v10 + 424) = v9;
  *(_QWORD *)(v10 + 432) = &protocol witness table for Double;
  *(_QWORD *)(v10 + 400) = v14;
  v13 = *((_QWORD *)a2 + 14);
  *(_QWORD *)(v10 + 464) = v9;
  *(_QWORD *)(v10 + 472) = &protocol witness table for Double;
  *(_QWORD *)(v10 + 440) = v13;
  v12 = *((_QWORD *)a2 + 15);
  *(_QWORD *)(v10 + 504) = v9;
  *(_QWORD *)(v10 + 512) = &protocol witness table for Double;
  *(_QWORD *)(v10 + 480) = v12;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(_QWORD *)a1 + 192))();
  result = swift_bridgeObjectRelease();
  if (!v11)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(result);
  return result;
}

uint64_t DataWriter.writeRawDataForCell(data:)(void *__src)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v2[40] = v1;
  v2[39] = __src;
  v2[37] = v2;
  v2[38] = 0;
  memcpy(v2 + 18, __src, 0x80uLL);
  memcpy(v2 + 2, v2 + 18, 0x80uLL);
  v2[38] = v4;
  return swift_task_switch();
}

uint64_t DataWriter.writeRawDataForCell(data:)()
{
  Swift::String *v0;
  uint64_t v1;
  uint64_t countAndFlagsBits;
  uint64_t object;

  countAndFlagsBits = v0[20]._countAndFlagsBits;
  object = (uint64_t)v0[19]._object;
  v0[18]._object = v0;
  swift_beginAccess();
  v0[20]._object = *(void **)(countAndFlagsBits + 112);
  swift_retain();
  swift_endAccess();
  v0[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO cell (session_id, timestamp, app_name, carrier, hour, dow, rssi, rsrp, rscp, rsrq, snr, bars, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0xA9uLL, 1);
  outlined retain of CellDataPointForWriting(object);
  v1 = swift_task_alloc();
  v0[22]._countAndFlagsBits = v1;
  *(_QWORD *)(v1 + 16) = object;
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[43];
  v2 = v0[42];
  v0[37] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #1 in DataWriter.writeRawDataForCell(data:));
  v0[45] = 0;
  v4 = *(_QWORD *)(v5 + 312);
  swift_task_dealloc();
  outlined release of CellDataPointForWriting(v4);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 296) = v0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 296) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 312);
  *(_QWORD *)(v0 + 296) = v0;
  swift_task_dealloc();
  outlined release of CellDataPointForWriting(v2);
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 296) + 8))();
}

uint64_t closure #1 in DataWriter.writeRawDataForCell(data:)(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  v10 = v3;
  v24 = *a2;
  outlined retain of String();
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 24) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 32) = &protocol witness table for String;
  *(_OWORD *)v10 = v24;
  v23 = *((_QWORD *)a2 + 2);
  v9 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v10 + 64) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v10 + 72) = &protocol witness table for Double;
  *(_QWORD *)(v10 + 40) = v23;
  v22 = *(__int128 *)((char *)a2 + 24);
  outlined retain of String();
  *(_QWORD *)(v10 + 104) = v7;
  *(_QWORD *)(v10 + 112) = &protocol witness table for String;
  *(_OWORD *)(v10 + 80) = v22;
  v21 = *(__int128 *)((char *)a2 + 40);
  outlined retain of String();
  *(_QWORD *)(v10 + 144) = v7;
  *(_QWORD *)(v10 + 152) = &protocol witness table for String;
  *(_OWORD *)(v10 + 120) = v21;
  v20 = *((_QWORD *)a2 + 7);
  v4 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v10 + 184) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v10 + 192) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 160) = v20;
  v19 = *((_QWORD *)a2 + 8);
  *(_QWORD *)(v10 + 224) = v4;
  *(_QWORD *)(v10 + 232) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 200) = v19;
  v18 = *((_QWORD *)a2 + 9);
  *(_QWORD *)(v10 + 264) = v4;
  *(_QWORD *)(v10 + 272) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 240) = v18;
  v17 = *((_QWORD *)a2 + 10);
  *(_QWORD *)(v10 + 304) = v4;
  *(_QWORD *)(v10 + 312) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 280) = v17;
  v16 = *((_QWORD *)a2 + 11);
  *(_QWORD *)(v10 + 344) = v4;
  *(_QWORD *)(v10 + 352) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 320) = v16;
  v15 = *((_QWORD *)a2 + 12);
  *(_QWORD *)(v10 + 384) = v4;
  *(_QWORD *)(v10 + 392) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 360) = v15;
  v14 = *((_QWORD *)a2 + 13);
  *(_QWORD *)(v10 + 424) = v9;
  *(_QWORD *)(v10 + 432) = &protocol witness table for Double;
  *(_QWORD *)(v10 + 400) = v14;
  v13 = *((_QWORD *)a2 + 14);
  *(_QWORD *)(v10 + 464) = v4;
  *(_QWORD *)(v10 + 472) = &protocol witness table for Int;
  *(_QWORD *)(v10 + 440) = v13;
  v12 = *((_QWORD *)a2 + 15);
  *(_QWORD *)(v10 + 504) = v9;
  *(_QWORD *)(v10 + 512) = &protocol witness table for Double;
  *(_QWORD *)(v10 + 480) = v12;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(_QWORD *)a1 + 192))();
  result = swift_bridgeObjectRelease();
  if (!v11)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(result);
  return result;
}

uint64_t DataWriter.readModelStatsFromDB()()
{
  uint64_t v0;
  _QWORD *v1;

  v1[9] = v0;
  v1[5] = v1;
  v1[6] = 0;
  v1[8] = 0;
  v1[6] = v0;
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 40) = v0;
  swift_beginAccess();
  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v2 + 112);
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT interfaceType, trainingRowCount, validationRowCount, carrierCount, ssidCount, appNameCount, sessionIDCount, trainingMAPE, validationMAPE, trainingDate FROM modelStats LIMIT 2", 0xB5uLL, 1);
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[12];
  v3 = v0[11];
  v0[5] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]?);
  SQLiteDB.withStatement<A>(sql:handler:)(v3, v2, (void (*)(void))closure #1 in DataWriter.readModelStatsFromDB());
  v0[13] = 0;
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 56));
}

{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v4;

  v1 = (void *)v0[13];
  v0[5] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v2 = v1;
  v0[8] = v1;
  swift_willThrow();

  return (*(uint64_t (**)())(*(_QWORD *)(v4 + 40) + 8))();
}

void closure #1 in DataWriter.readModelStatsFromDB()(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  _BYTE v6[16];
  _QWORD *v7;
  _QWORD v8[2];

  v8[0] = 0;
  v8[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  _allocateUninitializedArray<A>(_:)();
  v8[0] = Dictionary.init(dictionaryLiteral:)();
  v7 = v8;
  (*(void (**)(uint64_t (*)(uint64_t), _BYTE *))(*(_QWORD *)a1 + 144))(partial apply for closure #1 in closure #1 in DataWriter.readModelStatsFromDB(), v6);
  if (!v5)
  {
    v3 = v8[0];
    swift_bridgeObjectRetain();
    *a2 = v3;
  }
  outlined destroy of [String : Any]();
}

uint64_t closure #1 in closure #1 in DataWriter.readModelStatsFromDB()(uint64_t a1)
{
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  Swift::String *v6;
  Swift::String *v7;
  Swift::String *v8;
  Swift::String *v9;
  Swift::String *v10;
  Swift::String *v11;
  Swift::String *v12;
  Swift::String *v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  SQLiteDB.Row.get<A>(at:)(0, a1, MEMORY[0x24BEE0D00], (uint64_t)&protocol witness table for String);
  if (v30)
  {
    v15 = MEMORY[0x24BEE1768];
    SQLiteDB.Row.get<A>(at:)(1, a1, MEMORY[0x24BEE1768], (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(2, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(3, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(4, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(5, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(6, a1, v15, (uint64_t)&protocol witness table for Int);
    v16 = MEMORY[0x24BEE13C8];
    SQLiteDB.Row.get<A>(at:)(7, a1, MEMORY[0x24BEE13C8], (uint64_t)&protocol witness table for Double);
    SQLiteDB.Row.get<A>(at:)(8, a1, v16, (uint64_t)&protocol witness table for Double);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
    _allocateUninitializedArray<A>(_:)();
    v17 = v5;
    v6 = kMediaML_trainingRowCount.unsafeMutableAddressor();
    outlined init with copy of String(v6, v17);
    v17[5] = v15;
    v17[2] = v29;
    v7 = kMediaML_validationRowCount.unsafeMutableAddressor();
    outlined init with copy of String(v7, v17 + 6);
    v17[11] = v15;
    v17[8] = v28;
    v8 = kMediaML_carrier.unsafeMutableAddressor();
    outlined init with copy of String(v8, v17 + 12);
    v17[17] = v15;
    v17[14] = v27;
    v9 = kMediaML_ssid.unsafeMutableAddressor();
    outlined init with copy of String(v9, v17 + 18);
    v17[23] = v15;
    v17[20] = v26;
    v10 = kMediaML_appNameCount.unsafeMutableAddressor();
    outlined init with copy of String(v10, v17 + 24);
    v17[29] = v15;
    v17[26] = v25;
    v11 = kMediaML_sessionIDCount.unsafeMutableAddressor();
    outlined init with copy of String(v11, v17 + 30);
    v17[35] = v15;
    v17[32] = v24;
    v12 = kMediaML_trainingMAPE.unsafeMutableAddressor();
    outlined init with copy of String(v12, v17 + 36);
    v17[41] = v16;
    v17[38] = v23;
    v13 = kMediaML_validationMAPE.unsafeMutableAddressor();
    outlined init with copy of String(v13, v17 + 42);
    v17[47] = v16;
    v17[44] = v22;
    _finalizeUninitializedArray<A>(_:)();
    Dictionary.init(dictionaryLiteral:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    Dictionary.subscript.setter();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("interfaceType is missing", 0x18uLL, 1);
    v20 = SQLError.init(code:desc:)(0xFFFFFFFFLL, v1._countAndFlagsBits, v1._object);
    v18 = v2;
    v19 = v3;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)v4 = v20;
    *(_QWORD *)(v4 + 8) = v18;
    *(_QWORD *)(v4 + 16) = v19;
    return swift_willThrow();
  }
}

uint64_t DataWriter.readWiFiStdDev(appName:ssid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[24] = v4;
  v5[23] = a4;
  v5[22] = a3;
  v5[21] = a2;
  v5[20] = a1;
  v5[15] = v5;
  v5[5] = 0;
  v5[6] = 0;
  v5[7] = 0;
  v5[8] = 0;
  v5[16] = 0;
  v5[18] = 0;
  v5[19] = 0;
  v5[5] = a1;
  v5[6] = a2;
  v5[7] = a3;
  v5[8] = a4;
  v5[16] = v4;
  return swift_task_switch();
}

uint64_t DataWriter.readWiFiStdDev(appName:ssid:)()
{
  _QWORD *v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = v0[24];
  v11 = v0[23];
  v10 = v0[22];
  v9 = v0[21];
  v8 = v0[20];
  v0[15] = v0;
  swift_beginAccess();
  v0[25] = *(_QWORD *)(v7 + 112);
  swift_retain();
  swift_endAccess();
  v0[9] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v0[10] = v1;
  v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\tSELECT AVG(throughput_stddev) FROM wifiStdDev WHERE app_name LIKE '", 0x44uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease();
  v0[11] = v8;
  v0[12] = v9;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("' AND ssid LIKE '", 0x11uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease();
  v0[13] = v10;
  v0[14] = v11;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("'", 1uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  v0[26] = String.init(stringInterpolation:)();
  v0[27] = v5;
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[27];
  v2 = v0[26];
  v0[15] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #1 in DataWriter.readWiFiStdDev(appName:ssid:));
  v0[28] = 0;
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

{
  _QWORD *v0;

  v0[15] = v0;
  v0[19] = v0[17];
  return (*(uint64_t (**)(void))(v0[15] + 8))();
}

{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v4;

  v1 = (void *)v0[28];
  v0[15] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v2 = v1;
  v0[18] = v1;
  swift_willThrow();

  return (*(uint64_t (**)())(*(_QWORD *)(v4 + 120) + 8))();
}

uint64_t closure #1 in DataWriter.readWiFiStdDev(appName:ssid:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  _QWORD v7[2];

  v7[1] = a1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD, _UNKNOWN **))(*(_QWORD *)a1 + 160))(v7, MEMORY[0x24BEE13C8], &protocol witness table for Double);
  if (v2)
  {

    v4 = 0;
    v5 = 1;
  }
  else
  {
    v4 = v7[0];
    v5 = 0;
  }
  result = 0;
  if ((v5 & 1) != 0)
    *a2 = 0;
  else
    *a2 = v4;
  return result;
}

uint64_t DataWriter.readCellStdDev(appName:carrier:bars:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[27] = v5;
  v6[26] = a5;
  v6[25] = a4;
  v6[24] = a3;
  v6[23] = a2;
  v6[22] = a1;
  v6[15] = v6;
  v6[5] = 0;
  v6[6] = 0;
  v6[7] = 0;
  v6[8] = 0;
  v6[16] = 0;
  v6[17] = 0;
  v6[20] = 0;
  v6[21] = 0;
  v6[5] = a1;
  v6[6] = a2;
  v6[7] = a3;
  v6[8] = a4;
  v6[16] = a5;
  v6[17] = v5;
  return swift_task_switch();
}

uint64_t DataWriter.readCellStdDev(appName:carrier:bars:)()
{
  _QWORD *v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = v0[27];
  v13 = v0[26];
  v12 = v0[25];
  v11 = v0[24];
  v10 = v0[23];
  v9 = v0[22];
  v0[15] = v0;
  swift_beginAccess();
  v0[28] = *(_QWORD *)(v8 + 112);
  swift_retain();
  swift_endAccess();
  v0[9] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v0[10] = v1;
  v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT AVG(throughput_stddev) FROM cellStdDev WHERE app_name LIKE '", 0x43uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease();
  v0[11] = v9;
  v0[12] = v10;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("' AND carrier LIKE '", 0x14uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease();
  v0[13] = v11;
  v0[14] = v12;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("' AND bars LIKE ", 0x10uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v4);
  swift_bridgeObjectRelease();
  v0[19] = v13;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  v0[29] = String.init(stringInterpolation:)();
  v0[30] = v6;
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[30];
  v2 = v0[29];
  v0[15] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #1 in DataWriter.readCellStdDev(appName:carrier:bars:));
  v0[31] = 0;
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

{
  _QWORD *v0;

  v0[15] = v0;
  v0[21] = v0[18];
  return (*(uint64_t (**)(void))(v0[15] + 8))();
}

{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v4;

  v1 = (void *)v0[31];
  v0[15] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  v2 = v1;
  v0[20] = v1;
  swift_willThrow();

  return (*(uint64_t (**)())(*(_QWORD *)(v4 + 120) + 8))();
}

uint64_t closure #1 in DataWriter.readCellStdDev(appName:carrier:bars:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  _QWORD v7[2];

  v7[1] = a1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD, _UNKNOWN **))(*(_QWORD *)a1 + 160))(v7, MEMORY[0x24BEE13C8], &protocol witness table for Double);
  if (v2)
  {

    v4 = 0;
    v5 = 1;
  }
  else
  {
    v4 = v7[0];
    v5 = 0;
  }
  result = 0;
  if ((v5 & 1) != 0)
    *a2 = 0;
  else
    *a2 = v4;
  return result;
}

uint64_t closure #1 in DataWriter.createTables()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  _QWORD v7[2];

  v7[1] = a1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD, _UNKNOWN **))(*(_QWORD *)a1 + 160))(v7, MEMORY[0x24BEE1768], &protocol witness table for Int);
  if (v2)
  {

    v4 = 0;
    v5 = 1;
  }
  else
  {
    v4 = v7[0];
    v5 = 0;
  }
  result = 0;
  if ((v5 & 1) != 0)
    *a2 = 0;
  else
    *a2 = v4;
  return result;
}

uint64_t closure #2 in DataWriter.createTables()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  _QWORD v7[2];

  v7[1] = a1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD, _UNKNOWN **))(*(_QWORD *)a1 + 160))(v7, MEMORY[0x24BEE1768], &protocol witness table for Int);
  if (v2)
  {

    v4 = 0;
    v5 = 1;
  }
  else
  {
    v4 = v7[0];
    v5 = 0;
  }
  result = 0;
  if ((v5 & 1) != 0)
    *a2 = 0;
  else
    *a2 = v4;
  return result;
}

uint64_t closure #3 in DataWriter.createTables()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  _QWORD v7[2];

  v7[1] = a1;
  (*(void (**)(_QWORD *__return_ptr, _QWORD, _UNKNOWN **))(*(_QWORD *)a1 + 160))(v7, MEMORY[0x24BEE1768], &protocol witness table for Int);
  if (v2)
  {

    v4 = 0;
    v5 = 1;
  }
  else
  {
    v4 = v7[0];
    v5 = 0;
  }
  result = 0;
  if ((v5 & 1) != 0)
    *a2 = 0;
  else
    *a2 = v4;
  return result;
}

uint64_t implicit closure #2 in DataWriter.createTables()(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

uint64_t closure #4 in DataWriter.createTables()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  v3 = *(_QWORD *)(a2 + 120);
  v4[3] = MEMORY[0x24BEE1768];
  v4[4] = &protocol witness table for Int;
  *v4 = v3;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(_QWORD *)a1 + 192))();
  result = swift_bridgeObjectRelease();
  if (!v8)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(result);
  return result;
}

uint64_t implicit closure #3 in DataWriter.createTables()(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

uint64_t DataWriter.deinit()
{
  uint64_t v1;

  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t DataWriter.__deallocating_deinit()
{
  DataWriter.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t DataWriter.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance DataWriter()
{
  return DataWriter.unownedExecutor.getter();
}

uint64_t MediaML.logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static MediaML.logger);
}

uint64_t static MediaML.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MediaML.logger.unsafeMutableAddressor();
  v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t variable initialization expression of MediaML.dataWriter()
{
  return 0;
}

uint64_t MediaML.dataWriter.getter()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 112);
  swift_retain();
  swift_endAccess();
  return v2;
}

uint64_t MediaML.dataWriter.setter(uint64_t a1)
{
  uint64_t v1;

  swift_retain();
  swift_beginAccess();
  *(_QWORD *)(v1 + 112) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*MediaML.dataWriter.modify())()
{
  swift_beginAccess();
  return MediaML.dataWriter.modify;
}

uint64_t MediaML.dataWriter.modify()
{
  return swift_endAccess();
}

uint64_t MediaML.wifiModel.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 120);
  swift_retain();
  return v2;
}

uint64_t MediaML.cellModel.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 128);
  swift_retain();
  return v2;
}

uint64_t MediaML.ensureDataWriter()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v1[18] = v0;
  v1[8] = v1;
  v1[9] = 0;
  v1[16] = 0;
  v2 = type metadata accessor for Logger();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[9] = v4;
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *buf;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint32_t v15;
  os_log_type_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = v0[18];
  v0[8] = v0;
  swift_beginAccess();
  v21 = *(_QWORD *)(v20 + 112);
  swift_retain();
  swift_endAccess();
  v0[10] = v21;
  if (v0[10])
  {
    outlined destroy of DataWriter?();
    v1 = *(_QWORD *)(v19 + 176);
    v13 = *(_QWORD *)(v19 + 160);
    v14 = *(_QWORD *)(v19 + 152);
    v2 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v1, v2, v14);
    v17 = Logger.logObject.getter();
    v16 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v19 + 88) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v15 = *(_DWORD *)(v19 + 208);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v18 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v17, v16))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v10 = createStorage<A>(capacity:type:)(0);
      v11 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v19 + 96) = buf;
      *(_QWORD *)(v19 + 104) = v10;
      *(_QWORD *)(v19 + 112) = v11;
      serialize(_:at:)(0, (_BYTE **)(v19 + 96));
      serialize(_:at:)(0, (_BYTE **)(v19 + 96));
      *(_QWORD *)(v19 + 120) = v18;
      v12 = (_QWORD *)swift_task_alloc();
      v12[2] = v19 + 96;
      v12[3] = v19 + 104;
      v12[4] = v19 + 112;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, v17, v16, "DataWriter already initialized", buf, v15);
      destroyStorage<A>(_:count:)(v10, 0, v8);
      destroyStorage<A>(_:count:)(v11, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v6 = *(_QWORD *)(v19 + 176);
    v5 = *(_QWORD *)(v19 + 160);
    v7 = *(_QWORD *)(v19 + 152);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v19 + 64) + 8))();
  }
  else
  {
    outlined destroy of DataWriter?();
    type metadata accessor for DataWriter();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v19 + 184) = v3;
    *v3 = *(_QWORD *)(v19 + 64);
    v3[1] = MediaML.ensureDataWriter();
    return DataWriter.__allocating_init()();
  }
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;

  v3 = v0[24];
  v2 = v0[18];
  v0[8] = v0;
  swift_beginAccess();
  *(_QWORD *)(v2 + 112) = v3;
  swift_release();
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[8] + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;

  v18 = *(id *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 168);
  v16 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 64) = v0;
  v2 = v18;
  *(_QWORD *)(v0 + 128) = v18;
  v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v3, v17);
  v4 = v18;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  v27 = Logger.logObject.getter();
  v28 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 136) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v19 = *(_DWORD *)(v0 + 212);
  v23 = swift_allocObject();
  *(_BYTE *)(v23 + 16) = 64;
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = 8;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = partial apply for implicit closure #1 in MediaML.ensureDataWriter();
  *(_QWORD *)(v21 + 24) = v20;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v22 + 24) = v21;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v25 + 24) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v26 = v5;
  swift_retain();
  *v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v27, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v13 = createStorage<A>(capacity:type:)(1);
    v14 = createStorage<A>(capacity:type:)(0);
    v29 = buf;
    v30 = v13;
    v31 = v14;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl(&dword_241527000, v27, v28, "Failed to create DataWriter with error %@", buf, v19);
    destroyStorage<A>(_:count:)(v13, 1, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v10 = (id)v15[25];
  v8 = v15[21];
  v7 = v15[20];
  v9 = v15[19];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v15[8] + 8))();
}

uint64_t MediaML.ensureDataWriter()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[8] = *v2;
  v3 += 8;
  v3[16] = a1;
  v3[17] = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

void *implicit closure #1 in MediaML.ensureDataWriter()(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t MediaML.writeWifiData(data:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2[139] = v1;
  v2[138] = a1;
  v2[110] = v2;
  v2[111] = 0;
  v2[112] = 0;
  v2[115] = 0;
  v2[74] = 0;
  v2[75] = 0;
  v2[116] = 0;
  v2[80] = 0;
  v2[81] = 0;
  v2[86] = 0;
  v2[87] = 0;
  v2[117] = 0;
  v2[118] = 0;
  v2[119] = 0;
  v2[120] = 0;
  v2[121] = 0;
  v2[122] = 0;
  v2[123] = 0;
  v2[124] = 0;
  v2[100] = 0;
  v2[101] = 0;
  v2[102] = 0;
  v2[103] = 0;
  v2[125] = 0;
  v3 = type metadata accessor for Logger();
  v2[140] = v3;
  v2[141] = *(_QWORD *)(v3 - 8);
  v2[142] = swift_task_alloc();
  v2[143] = swift_task_alloc();
  v4 = type metadata accessor for Calendar.Component();
  v2[144] = v4;
  v2[145] = *(_QWORD *)(v4 - 8);
  v2[146] = swift_task_alloc();
  v5 = type metadata accessor for Calendar();
  v2[147] = v5;
  v2[148] = *(_QWORD *)(v5 - 8);
  v2[149] = swift_task_alloc();
  v6 = type metadata accessor for Date();
  v2[150] = v6;
  v2[151] = *(_QWORD *)(v6 - 8);
  v2[152] = swift_task_alloc();
  v2[111] = a1;
  v2[112] = v8;
  return swift_task_switch();
}

uint64_t MediaML.writeWifiData(data:)()
{
  _QWORD *v0;
  double v2;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String bucketedSSID;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v17;
  double v18;
  char v19;
  double v20;
  char v21;
  Swift::String v22;
  double v23;
  char v24;
  double v25;
  char v26;
  Swift::String v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  Swift::String v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  Swift::String v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  Swift::String v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t hour;
  void (*v50)(uint64_t, _QWORD, uint64_t);
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t dow;
  Swift::String v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  Swift::String v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  Swift::Double timestamp;
  Swift::String v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  Swift::Double throughputTrue;
  Swift::String v75;
  Swift::String v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;
  Swift::Int rssi;
  Swift::Int cca;
  Swift::Int snr;
  Swift::Int noise;
  Swift::Double v87;
  Swift::Double v88;

  v78 = v0[139];
  v0[110] = v0;
  swift_beginAccess();
  v79 = *(_QWORD *)(v78 + 112);
  swift_retain();
  swift_endAccess();
  v0[113] = v79;
  if (v0[113])
  {
    outlined destroy of DataWriter?();
    Date.init()();
    v76 = *kMediaML_throughputTrue.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 544) = v76;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (!*(_QWORD *)(v77 + 200))
      return _assertionFailure(_:_:file:line:flags:)();
    outlined init with take of Any(v77 + 176, v77 + 144);
    swift_dynamicCast();
    throughputTrue = *(double *)(v77 + 912);
    *(Swift::Double *)(v77 + 920) = throughputTrue;
    v75 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 560) = v75;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 232))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v72 = *(_QWORD *)(v77 + 864);
        v73 = *(_QWORD *)(v77 + 872);
      }
      else
      {
        v72 = 0;
        v73 = 0;
      }
      v70 = v72;
      v71 = v73;
    }
    else
    {
      outlined destroy of Any?(v77 + 208);
      v70 = 0;
      v71 = 0;
    }
    *(_QWORD *)(v77 + 576) = v70;
    *(_QWORD *)(v77 + 584) = v71;
    if (*(_QWORD *)(v77 + 584))
    {
      v80 = *(Swift::String *)(v77 + 576);
    }
    else
    {
      v80 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    *(_QWORD *)(v77 + 1224) = v80._object;
    *(Swift::String *)(v77 + 592) = v80;
    Date.timeIntervalSince1970.getter();
    timestamp = v2;
    *(double *)(v77 + 928) = v2;
    v69 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 608) = v69;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 264))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v66 = *(_QWORD *)(v77 + 848);
        v67 = *(_QWORD *)(v77 + 856);
      }
      else
      {
        v66 = 0;
        v67 = 0;
      }
      v64 = v66;
      v65 = v67;
    }
    else
    {
      outlined destroy of Any?(v77 + 240);
      v64 = 0;
      v65 = 0;
    }
    *(_QWORD *)(v77 + 624) = v64;
    *(_QWORD *)(v77 + 632) = v65;
    if (*(_QWORD *)(v77 + 632))
    {
      v81 = *(Swift::String *)(v77 + 624);
    }
    else
    {
      v81 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    *(_QWORD *)(v77 + 1232) = v81._object;
    *(Swift::String *)(v77 + 640) = v81;
    v63 = *kMediaML_ssid.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 656) = v63;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 296))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v61 = *(_QWORD *)(v77 + 832);
        v62 = *(_QWORD *)(v77 + 840);
      }
      else
      {
        v61 = 0;
        v62 = 0;
      }
      v59 = v61;
      v60 = v62;
    }
    else
    {
      outlined destroy of Any?(v77 + 272);
      v59 = 0;
      v60 = 0;
    }
    *(_QWORD *)(v77 + 672) = v59;
    *(_QWORD *)(v77 + 680) = v60;
    if (*(_QWORD *)(v77 + 680))
    {
      v82 = *(Swift::String *)(v77 + 672);
    }
    else
    {
      v82 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    v54 = *(_QWORD *)(v77 + 1192);
    v48 = *(_QWORD *)(v77 + 1184);
    v55 = *(_QWORD *)(v77 + 1176);
    v53 = *(_QWORD *)(v77 + 1168);
    v47 = *(_QWORD *)(v77 + 1160);
    v51 = *(_QWORD *)(v77 + 1152);
    *(_QWORD *)(v77 + 1240) = v82._object;
    *(Swift::String *)(v77 + 688) = v82;
    static Calendar.current.getter();
    v50 = *(void (**)(uint64_t, _QWORD, uint64_t))(v47 + 104);
    v50(v53, *MEMORY[0x24BDCF230], v51);
    hour = Calendar.component(_:from:)();
    v52 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v52(v53, v51);
    v56 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
    v56(v54, v55);
    *(_QWORD *)(v77 + 936) = hour;
    static Calendar.current.getter();
    v50(v53, *MEMORY[0x24BDCF278], v51);
    dow = Calendar.component(_:from:)();
    v52(v53, v51);
    v56(v54, v55);
    *(_QWORD *)(v77 + 944) = dow;
    v58 = *kMediaML_rssi.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 704) = v58;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 328))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v45 = *(_QWORD *)(v77 + 1096);
        v46 = 0;
      }
      else
      {
        v45 = 0;
        v46 = 1;
      }
      v43 = v45;
      v44 = v46;
    }
    else
    {
      outlined destroy of Any?(v77 + 304);
      v43 = 0;
      v44 = 1;
    }
    rssi = (v44 & 1) != 0 ? 0 : v43;
    *(_QWORD *)(v77 + 952) = rssi;
    v42 = *kMediaML_cca.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 720) = v42;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 360))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v40 = *(_QWORD *)(v77 + 1088);
        v41 = 0;
      }
      else
      {
        v40 = 0;
        v41 = 1;
      }
      v38 = v40;
      v39 = v41;
    }
    else
    {
      outlined destroy of Any?(v77 + 336);
      v38 = 0;
      v39 = 1;
    }
    cca = (v39 & 1) != 0 ? 0 : v38;
    *(_QWORD *)(v77 + 960) = cca;
    v37 = *kMediaML_snr.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 736) = v37;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 392))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v35 = *(_QWORD *)(v77 + 1080);
        v36 = 0;
      }
      else
      {
        v35 = 0;
        v36 = 1;
      }
      v33 = v35;
      v34 = v36;
    }
    else
    {
      outlined destroy of Any?(v77 + 368);
      v33 = 0;
      v34 = 1;
    }
    snr = (v34 & 1) != 0 ? 0 : v33;
    *(_QWORD *)(v77 + 968) = snr;
    v32 = *kMediaML_noise.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 752) = v32;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 424))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v30 = *(_QWORD *)(v77 + 1072);
        v31 = 0;
      }
      else
      {
        v30 = 0;
        v31 = 1;
      }
      v28 = v30;
      v29 = v31;
    }
    else
    {
      outlined destroy of Any?(v77 + 400);
      v28 = 0;
      v29 = 1;
    }
    noise = (v29 & 1) != 0 ? 0 : v28;
    *(_QWORD *)(v77 + 976) = noise;
    v27 = *kMediaML_rxRate.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 768) = v27;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 456))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v25 = *(double *)(v77 + 1064);
        v26 = 0;
      }
      else
      {
        v25 = 0.0;
        v26 = 1;
      }
      v23 = v25;
      v24 = v26;
    }
    else
    {
      outlined destroy of Any?(v77 + 432);
      v23 = 0.0;
      v24 = 1;
    }
    v87 = (v24 & 1) != 0 ? 0.0 : v23;
    *(Swift::Double *)(v77 + 984) = v87;
    v22 = *kMediaML_txRate.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v77 + 784) = v22;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v77 + 488))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v20 = *(double *)(v77 + 1056);
        v21 = 0;
      }
      else
      {
        v20 = 0.0;
        v21 = 1;
      }
      v18 = v20;
      v19 = v21;
    }
    else
    {
      outlined destroy of Any?(v77 + 464);
      v18 = 0.0;
      v19 = 1;
    }
    v88 = (v19 & 1) != 0 ? 0.0 : v18;
    *(Swift::Double *)(v77 + 992) = v88;
    if (rssi >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor())
    {
      if (rssi >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
        && rssi < *rssiBucket_medium_high_boundary.unsafeMutableAddressor())
      {
        v15 = *rssiBucket_medium.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        *(Swift::String *)(v77 + 800) = v15;
      }
      else
      {
        v14 = *rssiBucket_high.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        *(Swift::String *)(v77 + 800) = v14;
      }
    }
    else
    {
      v17 = *rssiBucket_low.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      *(Swift::String *)(v77 + 800) = v17;
    }
    v12 = *(_QWORD *)(v77 + 1112);
    countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("_", 1uLL, 1)._countAndFlagsBits;
    v7 = MEMORY[0x242696154](v82._countAndFlagsBits, v82._object, countAndFlagsBits);
    v10 = v4;
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(v77 + 800);
    v9 = *(_QWORD *)(v77 + 808);
    swift_bridgeObjectRetain();
    bucketedSSID._countAndFlagsBits = MEMORY[0x242696154](v7, v10, v8, v9);
    bucketedSSID._object = v5;
    *(_QWORD *)(v77 + 1248) = v5;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(Swift::String *)(v77 + 816) = bucketedSSID;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    WiFiDataPointForWriting.init(sessionID:timestamp:appName:bucketedSSID:hour:dow:rssi:cca:snr:noise:txRate:rxRate:throughputTrue:)((MediaML::WiFiDataPointForWriting *)(v77 + 16), v80, timestamp, v81, bucketedSSID, hour, dow, rssi, cca, snr, noise, v88, v87, throughputTrue);
    swift_beginAccess();
    v13 = *(_QWORD *)(v12 + 112);
    *(_QWORD *)(v77 + 1256) = v13;
    swift_retain();
    swift_endAccess();
    if (v13)
    {
      v6 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v77 + 1264) = v6;
      *v6 = *(_QWORD *)(v77 + 880);
      v6[1] = MediaML.writeWifiData(data:);
      return DataWriter.writeRawDataForWiFi(data:)((void *)(v77 + 16));
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
  else
  {
    outlined destroy of DataWriter?();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v77 + 880) + 8))();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 880) = *v1;
  *(_QWORD *)(v2 + 1272) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint32_t size;
  os_log_type_t v20;
  NSObject *oslog;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 1144);
  v17 = *(_QWORD *)(v0 + 1128);
  v18 = *(_QWORD *)(v0 + 1120);
  *(_QWORD *)(v0 + 880) = v0;
  v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v1, v2, v18);
  oslog = Logger.logObject.getter();
  v20 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 1016) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 1284);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v22 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(oslog, v20))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(v16 + 1272);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v13 = createStorage<A>(capacity:type:)(0);
  v14 = createStorage<A>(capacity:type:)(0);
  *(_QWORD *)(v16 + 1024) = buf;
  *(_QWORD *)(v16 + 1032) = v13;
  *(_QWORD *)(v16 + 1040) = v14;
  serialize(_:at:)(0, (_BYTE **)(v16 + 1024));
  serialize(_:at:)(0, (_BYTE **)(v16 + 1024));
  *(_QWORD *)(v16 + 1048) = v22;
  v15 = (_QWORD *)swift_task_alloc();
  v15[2] = v16 + 1024;
  v15[3] = v16 + 1032;
  v15[4] = v16 + 1040;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_241527000, oslog, v20, "WiFi Data write to disk finished", buf, size);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
LABEL_6:
    v6 = *(_QWORD *)(v16 + 1144);
    v5 = *(_QWORD *)(v16 + 1128);
    v7 = *(_QWORD *)(v16 + 1120);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
    v9 = *(_QWORD *)(v16 + 1216);
    v8 = *(_QWORD *)(v16 + 1208);
    v10 = *(_QWORD *)(v16 + 1200);
    outlined release of WiFiDataPointForWriting(v16 + 16);
    swift_bridgeObjectRelease();
    outlined destroy of String();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v16 + 880) + 8))();
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *buf;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint32_t size;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  NSObject *oslog;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;

  v21 = *(id *)(v0 + 1272);
  v1 = *(_QWORD *)(v0 + 1136);
  v19 = *(_QWORD *)(v0 + 1128);
  v20 = *(_QWORD *)(v0 + 1120);
  *(_QWORD *)(v0 + 880) = v0;
  swift_release();
  v2 = v21;
  *(_QWORD *)(v0 + 1000) = v21;
  v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v1, v3, v20);
  v4 = v21;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v21;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  v31 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 1008) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 1280);
  v26 = swift_allocObject();
  *(_BYTE *)(v26 + 16) = 64;
  v27 = swift_allocObject();
  *(_BYTE *)(v27 + 16) = 8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = partial apply for implicit closure #11 in MediaML.writeWifiData(data:);
  *(_QWORD *)(v24 + 24) = v23;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v25 + 24) = v24;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v28 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v29 = v5;
  swift_retain();
  *v29 = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[1] = v26;
  swift_retain();
  v29[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[3] = v27;
  swift_retain();
  v29[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v16 = createStorage<A>(capacity:type:)(1);
    v17 = createStorage<A>(capacity:type:)(0);
    v32 = buf;
    v33 = v16;
    v34 = v17;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl(&dword_241527000, oslog, v31, "Failed to write wifi data with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v16, 1, v14);
    destroyStorage<A>(_:count:)(v17, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v10 = (id)v18[159];
  v8 = v18[142];
  v7 = v18[141];
  v9 = v18[140];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  v12 = v18[152];
  v11 = v18[151];
  v13 = v18[150];
  outlined release of WiFiDataPointForWriting((uint64_t)(v18 + 2));
  swift_bridgeObjectRelease();
  outlined destroy of String();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v18[110] + 8))();
}

void *implicit closure #11 in MediaML.writeWifiData(data:)(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t MediaML.writeCellData(data:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  *(_QWORD *)(v2 + 1128) = v1;
  *(_QWORD *)(v2 + 1120) = a1;
  *(_QWORD *)(v2 + 944) = v2;
  *(_QWORD *)(v2 + 952) = 0;
  *(_QWORD *)(v2 + 960) = 0;
  *(_QWORD *)(v2 + 984) = 0;
  *(_QWORD *)(v2 + 576) = 0;
  *(_QWORD *)(v2 + 584) = 0;
  *(_QWORD *)(v2 + 608) = 0;
  *(_QWORD *)(v2 + 616) = 0;
  *(_QWORD *)(v2 + 992) = 0;
  *(_QWORD *)(v2 + 640) = 0;
  *(_QWORD *)(v2 + 648) = 0;
  *(_QWORD *)(v2 + 1000) = 0;
  *(_QWORD *)(v2 + 1008) = 0;
  *(_QWORD *)(v2 + 848) = 0;
  *(_BYTE *)(v2 + 856) = 0;
  *(_QWORD *)(v2 + 864) = 0;
  *(_BYTE *)(v2 + 872) = 0;
  *(_QWORD *)(v2 + 880) = 0;
  *(_BYTE *)(v2 + 888) = 0;
  *(_QWORD *)(v2 + 896) = 0;
  *(_BYTE *)(v2 + 904) = 0;
  *(_QWORD *)(v2 + 912) = 0;
  *(_BYTE *)(v2 + 920) = 0;
  *(_QWORD *)(v2 + 928) = 0;
  *(_BYTE *)(v2 + 936) = 0;
  *(_QWORD *)(v2 + 1016) = 0;
  v3 = type metadata accessor for Logger();
  *(_QWORD *)(v2 + 1136) = v3;
  *(_QWORD *)(v2 + 1144) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 1152) = swift_task_alloc();
  *(_QWORD *)(v2 + 1160) = swift_task_alloc();
  v4 = type metadata accessor for Calendar.Component();
  *(_QWORD *)(v2 + 1168) = v4;
  *(_QWORD *)(v2 + 1176) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 1184) = swift_task_alloc();
  v5 = type metadata accessor for Calendar();
  *(_QWORD *)(v2 + 1192) = v5;
  *(_QWORD *)(v2 + 1200) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 1208) = swift_task_alloc();
  v6 = type metadata accessor for Date();
  *(_QWORD *)(v2 + 1216) = v6;
  *(_QWORD *)(v2 + 1224) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 1232) = swift_task_alloc();
  *(_QWORD *)(v2 + 952) = a1;
  *(_QWORD *)(v2 + 960) = v8;
  return swift_task_switch();
}

uint64_t MediaML.writeCellData(data:)()
{
  _QWORD *v0;
  double v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  Swift::String v10;
  double v11;
  char v12;
  double v13;
  char v14;
  Swift::String v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  Swift::String v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  Swift::String v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  Swift::String v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t hour;
  void (*v38)(uint64_t, _QWORD, uint64_t);
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  uint64_t dow;
  Swift::String v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  Swift::Double timestamp;
  Swift::String v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  Swift::String v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  Swift::Double throughputTrue;
  Swift::String v63;
  Swift::String v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  Swift::String v68;
  Swift::String v69;
  Swift::String v70;
  Swift::Int rssi;
  Swift::Int rsrp;
  Swift::Int rscp;
  Swift::Int rsrq;
  Swift::Double v75;
  Swift::Int bars;

  v66 = v0[141];
  v0[118] = v0;
  swift_beginAccess();
  v67 = *(_QWORD *)(v66 + 112);
  swift_retain();
  swift_endAccess();
  v0[121] = v67;
  if (v0[121])
  {
    outlined destroy of DataWriter?();
    Date.init()();
    v64 = *kMediaML_throughputTrue.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 544) = v64;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (!*(_QWORD *)(v65 + 200))
      return _assertionFailure(_:_:file:line:flags:)();
    outlined init with take of Any(v65 + 176, v65 + 144);
    swift_dynamicCast();
    throughputTrue = *(double *)(v65 + 976);
    *(Swift::Double *)(v65 + 984) = throughputTrue;
    v63 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 560) = v63;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 232))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v60 = *(_QWORD *)(v65 + 832);
        v61 = *(_QWORD *)(v65 + 840);
      }
      else
      {
        v60 = 0;
        v61 = 0;
      }
      v58 = v60;
      v59 = v61;
    }
    else
    {
      outlined destroy of Any?(v65 + 208);
      v58 = 0;
      v59 = 0;
    }
    *(_QWORD *)(v65 + 1240) = v59;
    *(_QWORD *)(v65 + 576) = v58;
    *(_QWORD *)(v65 + 584) = v59;
    v57 = *kMediaML_carrier.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 592) = v57;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 264))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v55 = *(_QWORD *)(v65 + 816);
        v56 = *(_QWORD *)(v65 + 824);
      }
      else
      {
        v55 = 0;
        v56 = 0;
      }
      v53 = v55;
      v54 = v56;
    }
    else
    {
      outlined destroy of Any?(v65 + 240);
      v53 = 0;
      v54 = 0;
    }
    *(_QWORD *)(v65 + 1248) = v54;
    *(_QWORD *)(v65 + 608) = v53;
    *(_QWORD *)(v65 + 616) = v54;
    Date.timeIntervalSince1970.getter();
    timestamp = v2;
    *(double *)(v65 + 992) = v2;
    v52 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 624) = v52;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 296))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v49 = *(_QWORD *)(v65 + 800);
        v50 = *(_QWORD *)(v65 + 808);
      }
      else
      {
        v49 = 0;
        v50 = 0;
      }
      v47 = v49;
      v48 = v50;
    }
    else
    {
      outlined destroy of Any?(v65 + 272);
      v47 = 0;
      v48 = 0;
    }
    *(_QWORD *)(v65 + 1256) = v48;
    v42 = *(_QWORD *)(v65 + 1208);
    v36 = *(_QWORD *)(v65 + 1200);
    v43 = *(_QWORD *)(v65 + 1192);
    v41 = *(_QWORD *)(v65 + 1184);
    v35 = *(_QWORD *)(v65 + 1176);
    v39 = *(_QWORD *)(v65 + 1168);
    *(_QWORD *)(v65 + 640) = v47;
    *(_QWORD *)(v65 + 648) = v48;
    static Calendar.current.getter();
    v38 = *(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104);
    v38(v41, *MEMORY[0x24BDCF230], v39);
    hour = Calendar.component(_:from:)();
    v40 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v40(v41, v39);
    v44 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v44(v42, v43);
    *(_QWORD *)(v65 + 1000) = hour;
    static Calendar.current.getter();
    v38(v41, *MEMORY[0x24BDCF278], v39);
    dow = Calendar.component(_:from:)();
    v40(v41, v39);
    v44(v42, v43);
    *(_QWORD *)(v65 + 1008) = dow;
    v46 = *kMediaML_rssi.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 656) = v46;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 328))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v33 = *(_QWORD *)(v65 + 1112);
        v34 = 0;
      }
      else
      {
        v33 = 0;
        v34 = 1;
      }
      v31 = v33;
      v32 = v34;
    }
    else
    {
      outlined destroy of Any?(v65 + 304);
      v31 = 0;
      v32 = 1;
    }
    *(_QWORD *)(v65 + 848) = v31;
    *(_BYTE *)(v65 + 856) = v32 & 1;
    v30 = *kMediaML_rsrp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 672) = v30;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 360))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v28 = *(_QWORD *)(v65 + 1104);
        v29 = 0;
      }
      else
      {
        v28 = 0;
        v29 = 1;
      }
      v26 = v28;
      v27 = v29;
    }
    else
    {
      outlined destroy of Any?(v65 + 336);
      v26 = 0;
      v27 = 1;
    }
    *(_QWORD *)(v65 + 864) = v26;
    *(_BYTE *)(v65 + 872) = v27 & 1;
    v25 = *kMediaML_rsrq.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 688) = v25;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 392))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = *(_QWORD *)(v65 + 1096);
        v24 = 0;
      }
      else
      {
        v23 = 0;
        v24 = 1;
      }
      v21 = v23;
      v22 = v24;
    }
    else
    {
      outlined destroy of Any?(v65 + 368);
      v21 = 0;
      v22 = 1;
    }
    *(_QWORD *)(v65 + 880) = v21;
    *(_BYTE *)(v65 + 888) = v22 & 1;
    v20 = *kMediaML_rscp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 704) = v20;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 424))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v18 = *(_QWORD *)(v65 + 1088);
        v19 = 0;
      }
      else
      {
        v18 = 0;
        v19 = 1;
      }
      v16 = v18;
      v17 = v19;
    }
    else
    {
      outlined destroy of Any?(v65 + 400);
      v16 = 0;
      v17 = 1;
    }
    *(_QWORD *)(v65 + 896) = v16;
    *(_BYTE *)(v65 + 904) = v17 & 1;
    v15 = *kMediaML_snr.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 720) = v15;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 456))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v13 = *(double *)(v65 + 1080);
        v14 = 0;
      }
      else
      {
        v13 = 0.0;
        v14 = 1;
      }
      v11 = v13;
      v12 = v14;
    }
    else
    {
      outlined destroy of Any?(v65 + 432);
      v11 = 0.0;
      v12 = 1;
    }
    *(double *)(v65 + 912) = v11;
    *(_BYTE *)(v65 + 920) = v12 & 1;
    v10 = *kMediaML_bars.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v65 + 736) = v10;
    MEMORY[0x2426960C4]();
    outlined destroy of String();
    if (*(_QWORD *)(v65 + 488))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v8 = *(_QWORD *)(v65 + 1072);
        v9 = 0;
      }
      else
      {
        v8 = 0;
        v9 = 1;
      }
      v6 = v8;
      v7 = v9;
    }
    else
    {
      outlined destroy of Any?(v65 + 464);
      v6 = 0;
      v7 = 1;
    }
    *(_QWORD *)(v65 + 928) = v6;
    *(_BYTE *)(v65 + 936) = v7 & 1;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v65 + 752) = v58;
    *(_QWORD *)(v65 + 760) = v59;
    if (*(_QWORD *)(v65 + 760))
    {
      v68 = *(Swift::String *)(v65 + 752);
    }
    else
    {
      v68 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    swift_bridgeObjectRetain();
    *(_QWORD *)(v65 + 768) = v47;
    *(_QWORD *)(v65 + 776) = v48;
    if (*(_QWORD *)(v65 + 776))
    {
      v69 = *(Swift::String *)(v65 + 768);
    }
    else
    {
      v69 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    swift_bridgeObjectRetain();
    *(_QWORD *)(v65 + 784) = v53;
    *(_QWORD *)(v65 + 792) = v54;
    if (*(_QWORD *)(v65 + 792))
    {
      v70 = *(Swift::String *)(v65 + 784);
    }
    else
    {
      v70 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    rssi = (v32 & 1) != 0 ? 0 : v31;
    rsrp = (v27 & 1) != 0 ? 0 : v26;
    rscp = (v17 & 1) != 0 ? 0 : v16;
    rsrq = (v22 & 1) != 0 ? 0 : v21;
    v75 = (v12 & 1) != 0 ? 0.0 : v11;
    bars = (v7 & 1) != 0 ? 0 : v6;
    v4 = *(_QWORD *)(v65 + 1128);
    CellDataPointForWriting.init(sessionID:timestamp:appName:carrier:hour:dow:rssi:rsrp:rscp:rsrq:snr:bars:throughputTrue:)((MediaML::CellDataPointForWriting *)(v65 + 16), v68, timestamp, v69, v70, hour, dow, rssi, rsrp, rscp, rsrq, v75, bars, throughputTrue);
    swift_beginAccess();
    v5 = *(_QWORD *)(v4 + 112);
    *(_QWORD *)(v65 + 1264) = v5;
    swift_retain();
    swift_endAccess();
    if (v5)
    {
      v3 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v65 + 1272) = v3;
      *v3 = *(_QWORD *)(v65 + 944);
      v3[1] = MediaML.writeCellData(data:);
      return DataWriter.writeRawDataForCell(data:)((void *)(v65 + 16));
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
  else
  {
    outlined destroy of DataWriter?();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v65 + 944) + 8))();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 944) = *v1;
  *(_QWORD *)(v2 + 1280) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint32_t size;
  os_log_type_t v20;
  NSObject *oslog;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 1160);
  v17 = *(_QWORD *)(v0 + 1144);
  v18 = *(_QWORD *)(v0 + 1136);
  *(_QWORD *)(v0 + 944) = v0;
  v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v1, v2, v18);
  oslog = Logger.logObject.getter();
  v20 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 1032) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 876);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v22 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(oslog, v20))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(v16 + 1280);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v13 = createStorage<A>(capacity:type:)(0);
  v14 = createStorage<A>(capacity:type:)(0);
  *(_QWORD *)(v16 + 1040) = buf;
  *(_QWORD *)(v16 + 1048) = v13;
  *(_QWORD *)(v16 + 1056) = v14;
  serialize(_:at:)(0, (_BYTE **)(v16 + 1040));
  serialize(_:at:)(0, (_BYTE **)(v16 + 1040));
  *(_QWORD *)(v16 + 1064) = v22;
  v15 = (_QWORD *)swift_task_alloc();
  v15[2] = v16 + 1040;
  v15[3] = v16 + 1048;
  v15[4] = v16 + 1056;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_241527000, oslog, v20, "Cell Data write to disk finished", buf, size);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
LABEL_6:
    v6 = *(_QWORD *)(v16 + 1160);
    v5 = *(_QWORD *)(v16 + 1144);
    v7 = *(_QWORD *)(v16 + 1136);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
    v9 = *(_QWORD *)(v16 + 1232);
    v8 = *(_QWORD *)(v16 + 1224);
    v10 = *(_QWORD *)(v16 + 1216);
    outlined release of CellDataPointForWriting(v16 + 16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v16 + 944) + 8))();
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *buf;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint32_t size;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  NSObject *oslog;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;

  v21 = *(id *)(v0 + 1280);
  v1 = *(_QWORD *)(v0 + 1152);
  v19 = *(_QWORD *)(v0 + 1144);
  v20 = *(_QWORD *)(v0 + 1136);
  *(_QWORD *)(v0 + 944) = v0;
  swift_release();
  v2 = v21;
  *(_QWORD *)(v0 + 1016) = v21;
  v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v1, v3, v20);
  v4 = v21;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v21;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  v31 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 1024) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 860);
  v26 = swift_allocObject();
  *(_BYTE *)(v26 + 16) = 64;
  v27 = swift_allocObject();
  *(_BYTE *)(v27 + 16) = 8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = partial apply for implicit closure #10 in MediaML.writeCellData(data:);
  *(_QWORD *)(v24 + 24) = v23;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v25 + 24) = v24;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v28 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v29 = v5;
  swift_retain();
  *v29 = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[1] = v26;
  swift_retain();
  v29[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[3] = v27;
  swift_retain();
  v29[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v16 = createStorage<A>(capacity:type:)(1);
    v17 = createStorage<A>(capacity:type:)(0);
    v32 = buf;
    v33 = v16;
    v34 = v17;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl(&dword_241527000, oslog, v31, "Failed to write cell data with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v16, 1, v14);
    destroyStorage<A>(_:count:)(v17, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v10 = (id)v18[160];
  v8 = v18[144];
  v7 = v18[143];
  v9 = v18[142];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  v12 = v18[154];
  v11 = v18[153];
  v13 = v18[152];
  outlined release of CellDataPointForWriting((uint64_t)(v18 + 2));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v18[118] + 8))();
}

void *implicit closure #10 in MediaML.writeCellData(data:)(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t MediaML.writeData(data:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;

  v2[23] = v1;
  v2[22] = a1;
  v2[14] = v2;
  v2[15] = 0;
  v2[16] = 0;
  v2[17] = 0;
  v2[19] = 0;
  v3 = type metadata accessor for Logger();
  v2[24] = v3;
  v2[25] = *(_QWORD *)(v3 - 8);
  v2[26] = swift_task_alloc();
  v2[15] = a1;
  v2[16] = v5;
  return swift_task_switch();
}

uint64_t MediaML.writeData(data:)()
{
  Swift::String *v0;
  _QWORD *v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  Swift::String v8;

  v0[7]._countAndFlagsBits = (uint64_t)v0;
  v8 = *kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v0[5] = v8;
  MEMORY[0x2426960C4]();
  outlined destroy of String();
  if (v0[2]._object)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = v7[21];
      v6 = 0;
    }
    else
    {
      v5 = 0;
      v6 = 1;
    }
    v3 = v5;
    v4 = v6;
  }
  else
  {
    outlined destroy of Any?((uint64_t)(v7 + 2));
    v3 = 0;
    v4 = 1;
  }
  v7[27] = v3;
  if ((v4 & 1) != 0)
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v7[14] + 8))();
  }
  else
  {
    v7[17] = v3;
    v1 = (_QWORD *)swift_task_alloc();
    v7[28] = v1;
    *v1 = v7[14];
    v1[1] = MediaML.writeData(data:);
    return MediaML.ensureDataWriter()();
  }
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 112) = *(_QWORD *)v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  char v10;
  double v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  uint64_t v17;
  uint8_t *buf;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint32_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;

  v26 = *(_QWORD *)(v0 + 216);
  v1 = *(_QWORD *)(v0 + 208);
  v22 = *(_QWORD *)(v0 + 200);
  v23 = *(_QWORD *)(v0 + 192);
  v24 = *(_QWORD *)(v0 + 176);
  *(_QWORD *)(v0 + 112) = v0;
  v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v1, v2, v23);
  swift_bridgeObjectRetain();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v24;
  swift_retain();
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = partial apply for implicit closure #1 in MediaML.writeData(data:);
  *(_QWORD *)(v28 + 24) = v25;
  swift_release();
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v26;
  v39 = Logger.logObject.getter();
  v40 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 144) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v27 = *(_DWORD *)(v0 + 248);
  v32 = swift_allocObject();
  *(_BYTE *)(v32 + 16) = 32;
  v33 = swift_allocObject();
  *(_BYTE *)(v33 + 16) = 8;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_0;
  *(_QWORD *)(v29 + 24) = v28;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_1;
  *(_QWORD *)(v34 + 24) = v29;
  v35 = swift_allocObject();
  *(_BYTE *)(v35 + 16) = 0;
  v36 = swift_allocObject();
  *(_BYTE *)(v36 + 16) = 8;
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = partial apply for implicit closure #2 in MediaML.writeData(data:);
  *(_QWORD *)(v31 + 24) = v30;
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(_QWORD *)(v37 + 24) = v31;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v38 = v3;
  swift_retain();
  *v38 = closure #1 in OSLogArguments.append(_:)partial apply;
  v38[1] = v32;
  swift_retain();
  v38[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v38[3] = v33;
  swift_retain();
  v38[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
  v38[5] = v34;
  swift_retain();
  v38[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v38[7] = v35;
  swift_retain();
  v38[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v38[9] = v36;
  swift_retain();
  v38[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v38[11] = v37;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v39, v40))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v19 = createStorage<A>(capacity:type:)(0);
    v20 = createStorage<A>(capacity:type:)(1);
    v41 = buf;
    v42 = v19;
    v43 = v20;
    serialize(_:at:)(2, &v41);
    serialize(_:at:)(2, &v41);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v45 = v32;
    closure #1 in osLogInternal(_:log:type:)(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v45 = v33;
    closure #1 in osLogInternal(_:log:type:)(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
    v45 = v34;
    closure #1 in osLogInternal(_:log:type:)(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v45 = v35;
    closure #1 in osLogInternal(_:log:type:)(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v45 = v36;
    closure #1 in osLogInternal(_:log:type:)(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v45 = v37;
    closure #1 in osLogInternal(_:log:type:)(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    _os_log_impl(&dword_241527000, v39, v40, "Got data to write to SQL %s for interface=%ld", buf, v27);
    destroyStorage<A>(_:count:)(v19, 0, v17);
    destroyStorage<A>(_:count:)(v20, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v14 = *(_QWORD *)(v21 + 208);
  v13 = *(_QWORD *)(v21 + 200);
  v15 = *(_QWORD *)(v21 + 192);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  v16 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  *(Swift::String *)(v21 + 96) = v16;
  MEMORY[0x2426960C4]();
  outlined destroy of String();
  if (*(_QWORD *)(v21 + 72))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v11 = *(double *)(v21 + 160);
      v12 = 0;
    }
    else
    {
      v11 = 0.0;
      v12 = 1;
    }
    v9 = v11;
    v10 = v12;
  }
  else
  {
    outlined destroy of Any?(v21 + 48);
    v9 = 0.0;
    v10 = 1;
  }
  if ((v10 & 1) != 0)
    goto LABEL_18;
  *(double *)(v21 + 152) = v9;
  if (v9 <= 0.0)
    goto LABEL_18;
  v8 = *(_QWORD *)(v21 + 216);
  if (v8 == *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor())
  {
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v21 + 232) = v4;
    *v4 = *(_QWORD *)(v21 + 112);
    v4[1] = MediaML.writeData(data:);
    return MediaML.writeWifiData(data:)(*(_QWORD *)(v21 + 176));
  }
  v7 = *(_QWORD *)(v21 + 216);
  if (v7 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
LABEL_18:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v21 + 112) + 8))();
  }
  else
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v21 + 240) = v6;
    *v6 = *(_QWORD *)(v21 + 112);
    v6[1] = MediaML.writeData(data:);
    return MediaML.writeCellData(data:)(*(_QWORD *)(v21 + 176));
  }
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 112) = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 112) + 8))();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 112) = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 112) + 8))();
}

uint64_t implicit closure #1 in MediaML.writeData(data:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = a1;
  *a2 = a1;
  return result;
}

uint64_t MediaML.validateWifiDataForPrediction(data:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t *v58;
  uint64_t *v59;
  _BYTE **v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t *v66;
  uint32_t v67;
  int v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t *v79;
  uint64_t *v80;
  _BYTE **v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t *v87;
  uint32_t v88;
  int v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint8_t *v96;
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  uint64_t *v100;
  uint64_t *v101;
  _BYTE **v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t *v108;
  uint32_t v109;
  int v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint8_t *v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int v119;
  uint64_t *v120;
  uint64_t *v121;
  _BYTE **v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t *v128;
  uint32_t v129;
  int v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint8_t *v136;
  uint64_t v137;
  uint64_t v138;
  unsigned int v139;
  uint64_t *v140;
  uint64_t *v141;
  _BYTE **v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  uint64_t *v148;
  uint32_t v149;
  int v150;
  NSObject *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint8_t *v156;
  uint64_t v157;
  uint64_t v158;
  unsigned int v159;
  uint64_t *v160;
  uint64_t *v161;
  _BYTE **v162;
  uint64_t *v163;
  uint64_t *v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t v167;
  uint64_t *v168;
  uint32_t v169;
  int v170;
  NSObject *v171;
  uint64_t v172;
  int v174;
  _BOOL4 v175;
  Swift::String v176;
  Swift::String *v177;
  int v178;
  _BOOL4 v179;
  Swift::String v180;
  Swift::String *v181;
  int v182;
  _BOOL4 v183;
  Swift::String v184;
  Swift::String *v185;
  int v186;
  _BOOL4 v187;
  Swift::String v188;
  Swift::String *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  Swift::String v194;
  Swift::String *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  char *v204;
  unint64_t v205;
  char *v206;
  unint64_t v207;
  char *v208;
  unint64_t v209;
  char *v210;
  unint64_t v211;
  char *v212;
  unint64_t v213;
  char *v214;
  Swift::String v215;
  uint64_t v216;
  Swift::String *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  _BYTE *v223;
  uint64_t v224;
  uint32_t v225;
  Swift::String v226;
  _QWORD v227[5];
  uint64_t v228;
  uint64_t v229;
  _BYTE *v230;
  uint64_t v231;
  uint32_t v232;
  Swift::String v233;
  _QWORD v234[5];
  uint64_t v235;
  uint64_t v236;
  _BYTE *v237;
  uint64_t v238;
  uint32_t v239;
  Swift::String v240;
  _QWORD v241[5];
  uint64_t v242;
  uint64_t v243;
  _BYTE *v244;
  uint64_t v245;
  uint32_t v246;
  Swift::String v247;
  _QWORD v248[5];
  uint64_t v249;
  uint64_t v250;
  _BYTE *v251;
  uint64_t v252;
  uint32_t v253;
  Swift::String v254;
  _QWORD v255[5];
  uint64_t v256;
  uint64_t v257;
  _BYTE *v258;
  uint64_t v259;
  uint32_t v260;
  Swift::String v261;
  _QWORD v262[4];
  uint64_t v263;
  uint64_t v264;

  v216 = a1;
  v264 = 0;
  v263 = 0;
  v200 = 0;
  v201 = type metadata accessor for Logger();
  v202 = *(_QWORD *)(v201 - 8);
  v203 = (*(_QWORD *)(v202 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v216);
  v204 = (char *)&v50 - v203;
  v205 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v206 = (char *)&v50 - v205;
  v207 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v208 = (char *)&v50 - v207;
  v209 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v210 = (char *)&v50 - v209;
  v211 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v212 = (char *)&v50 - v211;
  v213 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v214 = (char *)&v50 - v213;
  v264 = v12;
  v263 = v1;
  v215 = *kMediaML_ssid.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v217 = &v261;
  v261 = v215;
  MEMORY[0x2426960C4](v262);
  outlined destroy of String();
  if (v262[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
      v199 = v218;
    else
      v199 = 0;
    v198 = v199;
  }
  else
  {
    v71 = 0;
    outlined destroy of Any?((uint64_t)v262);
    v198 = v71;
  }
  v197 = v198;
  if (v198)
  {
    v196 = v197;
    swift_bridgeObjectRelease();
    v194 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v195 = &v254;
    v254 = v194;
    MEMORY[0x2426960C4](v255);
    outlined destroy of String();
    if (v255[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
        v193 = v219;
      else
        v193 = 0;
      v192 = v193;
    }
    else
    {
      v92 = 0;
      outlined destroy of Any?((uint64_t)v255);
      v192 = v92;
    }
    v191 = v192;
    if (v192)
    {
      v190 = v191;
      swift_bridgeObjectRelease();
      v188 = *kMediaML_rssi.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v189 = &v247;
      v247 = v188;
      MEMORY[0x2426960C4](v248);
      outlined destroy of String();
      if (v248[3])
      {
        v187 = (swift_dynamicCast() & 1) == 0;
        v186 = v187;
      }
      else
      {
        outlined destroy of Any?((uint64_t)v248);
        v186 = 1;
      }
      if ((v186 & 1) != 0)
      {
        v31 = v208;
        v32 = MediaML.logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v202 + 16))(v31, v32, v201);
        v111 = Logger.logObject.getter();
        v110 = static os_log_type_t.error.getter();
        v108 = &v245;
        v245 = 2;
        v106 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v107 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        v109 = v246;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v112 = _allocateUninitializedArray<A>(_:)();
        if (os_log_type_enabled(v111, (os_log_type_t)v110))
        {
          v33 = v200;
          v96 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          v94 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v95 = 0;
          v97 = createStorage<A>(capacity:type:)(0);
          v98 = createStorage<A>(capacity:type:)(v95);
          v102 = &v244;
          v244 = v96;
          v103 = &v243;
          v243 = v97;
          v100 = &v242;
          v242 = v98;
          v99 = 0;
          serialize(_:at:)(0, &v244);
          serialize(_:at:)(v99, v102);
          v241[4] = v112;
          v101 = &v50;
          MEMORY[0x24BDAC7A8](&v50);
          v34 = v103;
          v35 = &v50 - 6;
          v104 = &v50 - 6;
          v35[2] = (uint64_t)v102;
          v35[3] = (uint64_t)v34;
          v35[4] = v36;
          v105 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
          lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
          Sequence.forEach(_:)();
          if (v33)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_241527000, v111, (os_log_type_t)v110, "rssi in data dictionary is not of expected type Int", v96, v109);
            v93 = 0;
            destroyStorage<A>(_:count:)(v97, 0, v94);
            destroyStorage<A>(_:count:)(v98, v93, MEMORY[0x24BEE4AD8] + 8);
            MEMORY[0x242696394](v96, MEMORY[0x24BEE4260]);
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        (*(void (**)(char *, uint64_t))(v202 + 8))(v208, v201);
        return 0;
      }
      else
      {
        v184 = *kMediaML_noise.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        v185 = &v240;
        v240 = v184;
        MEMORY[0x2426960C4](v241);
        outlined destroy of String();
        if (v241[3])
        {
          v183 = (swift_dynamicCast() & 1) == 0;
          v182 = v183;
        }
        else
        {
          outlined destroy of Any?((uint64_t)v241);
          v182 = 1;
        }
        if ((v182 & 1) != 0)
        {
          v25 = v210;
          v26 = MediaML.logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v202 + 16))(v25, v26, v201);
          v131 = Logger.logObject.getter();
          v130 = static os_log_type_t.error.getter();
          v128 = &v238;
          v238 = 2;
          v126 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          v127 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          v129 = v239;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          v132 = _allocateUninitializedArray<A>(_:)();
          if (os_log_type_enabled(v131, (os_log_type_t)v130))
          {
            v27 = v200;
            v116 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            v114 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            v115 = 0;
            v117 = createStorage<A>(capacity:type:)(0);
            v118 = createStorage<A>(capacity:type:)(v115);
            v122 = &v237;
            v237 = v116;
            v123 = &v236;
            v236 = v117;
            v120 = &v235;
            v235 = v118;
            v119 = 0;
            serialize(_:at:)(0, &v237);
            serialize(_:at:)(v119, v122);
            v234[4] = v132;
            v121 = &v50;
            MEMORY[0x24BDAC7A8](&v50);
            v28 = v123;
            v29 = &v50 - 6;
            v124 = &v50 - 6;
            v29[2] = (uint64_t)v122;
            v29[3] = (uint64_t)v28;
            v29[4] = v30;
            v125 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
            lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
            Sequence.forEach(_:)();
            if (v27)
            {
              __break(1u);
            }
            else
            {
              _os_log_impl(&dword_241527000, v131, (os_log_type_t)v130, "noise in data dictionary is not of expected type Double", v116, v129);
              v113 = 0;
              destroyStorage<A>(_:count:)(v117, 0, v114);
              destroyStorage<A>(_:count:)(v118, v113, MEMORY[0x24BEE4AD8] + 8);
              MEMORY[0x242696394](v116, MEMORY[0x24BEE4260]);
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          (*(void (**)(char *, uint64_t))(v202 + 8))(v210, v201);
          return 0;
        }
        else
        {
          v180 = *kMediaML_rxRate.unsafeMutableAddressor();
          swift_bridgeObjectRetain();
          v181 = &v233;
          v233 = v180;
          MEMORY[0x2426960C4](v234);
          outlined destroy of String();
          if (v234[3])
          {
            v179 = (swift_dynamicCast() & 1) == 0;
            v178 = v179;
          }
          else
          {
            outlined destroy of Any?((uint64_t)v234);
            v178 = 1;
          }
          if ((v178 & 1) != 0)
          {
            v19 = v212;
            v20 = MediaML.logger.unsafeMutableAddressor();
            (*(void (**)(char *, uint64_t, uint64_t))(v202 + 16))(v19, v20, v201);
            v151 = Logger.logObject.getter();
            v150 = static os_log_type_t.error.getter();
            v148 = &v231;
            v231 = 2;
            v146 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            v147 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type Int and conformance Int();
            UnsignedInteger<>.init<A>(_:)();
            v149 = v232;
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
            v152 = _allocateUninitializedArray<A>(_:)();
            if (os_log_type_enabled(v151, (os_log_type_t)v150))
            {
              v21 = v200;
              v136 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
              v134 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              v135 = 0;
              v137 = createStorage<A>(capacity:type:)(0);
              v138 = createStorage<A>(capacity:type:)(v135);
              v142 = &v230;
              v230 = v136;
              v143 = &v229;
              v229 = v137;
              v140 = &v228;
              v228 = v138;
              v139 = 0;
              serialize(_:at:)(0, &v230);
              serialize(_:at:)(v139, v142);
              v227[4] = v152;
              v141 = &v50;
              MEMORY[0x24BDAC7A8](&v50);
              v22 = v143;
              v23 = &v50 - 6;
              v144 = &v50 - 6;
              v23[2] = (uint64_t)v142;
              v23[3] = (uint64_t)v22;
              v23[4] = v24;
              v145 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
              lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
              Sequence.forEach(_:)();
              if (v21)
              {
                __break(1u);
              }
              else
              {
                _os_log_impl(&dword_241527000, v151, (os_log_type_t)v150, "rxRate in data dictionary is not of expected type Double", v136, v149);
                v133 = 0;
                destroyStorage<A>(_:count:)(v137, 0, v134);
                destroyStorage<A>(_:count:)(v138, v133, MEMORY[0x24BEE4AD8] + 8);
                MEMORY[0x242696394](v136, MEMORY[0x24BEE4260]);
                swift_bridgeObjectRelease();
              }
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            (*(void (**)(char *, uint64_t))(v202 + 8))(v212, v201);
            return 0;
          }
          else
          {
            v176 = *kMediaML_txRate.unsafeMutableAddressor();
            swift_bridgeObjectRetain();
            v177 = &v226;
            v226 = v176;
            MEMORY[0x2426960C4](v227);
            outlined destroy of String();
            if (v227[3])
            {
              v175 = (swift_dynamicCast() & 1) == 0;
              v174 = v175;
            }
            else
            {
              outlined destroy of Any?((uint64_t)v227);
              v174 = 1;
            }
            if ((v174 & 1) != 0)
            {
              v13 = v214;
              v14 = MediaML.logger.unsafeMutableAddressor();
              (*(void (**)(char *, uint64_t, uint64_t))(v202 + 16))(v13, v14, v201);
              v171 = Logger.logObject.getter();
              v170 = static os_log_type_t.error.getter();
              v168 = &v224;
              v224 = 2;
              v166 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              v167 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              lazy protocol witness table accessor for type Int and conformance Int();
              UnsignedInteger<>.init<A>(_:)();
              v169 = v225;
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
              v172 = _allocateUninitializedArray<A>(_:)();
              if (os_log_type_enabled(v171, (os_log_type_t)v170))
              {
                v15 = v200;
                v156 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                v154 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                v155 = 0;
                v157 = createStorage<A>(capacity:type:)(0);
                v158 = createStorage<A>(capacity:type:)(v155);
                v162 = &v223;
                v223 = v156;
                v163 = &v222;
                v222 = v157;
                v160 = &v221;
                v221 = v158;
                v159 = 0;
                serialize(_:at:)(0, &v223);
                serialize(_:at:)(v159, v162);
                v220 = v172;
                v161 = &v50;
                MEMORY[0x24BDAC7A8](&v50);
                v16 = v163;
                v17 = &v50 - 6;
                v164 = &v50 - 6;
                v17[2] = (uint64_t)v162;
                v17[3] = (uint64_t)v16;
                v17[4] = v18;
                v165 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
                lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
                Sequence.forEach(_:)();
                if (v15)
                {
                  __break(1u);
                }
                else
                {
                  _os_log_impl(&dword_241527000, v171, (os_log_type_t)v170, "txRate in data dictionary is not of expected type Double", v156, v169);
                  v153 = 0;
                  destroyStorage<A>(_:count:)(v157, 0, v154);
                  destroyStorage<A>(_:count:)(v158, v153, MEMORY[0x24BEE4AD8] + 8);
                  MEMORY[0x242696394](v156, MEMORY[0x24BEE4260]);
                  swift_bridgeObjectRelease();
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }

              (*(void (**)(char *, uint64_t))(v202 + 8))(v214, v201);
              return 0;
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
    else
    {
      v37 = v206;
      v38 = MediaML.logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v202 + 16))(v37, v38, v201);
      v90 = Logger.logObject.getter();
      v89 = static os_log_type_t.error.getter();
      v87 = &v252;
      v252 = 2;
      v85 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v86 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v88 = v253;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v91 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v90, (os_log_type_t)v89))
      {
        v39 = v200;
        v75 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v74 = 0;
        v76 = createStorage<A>(capacity:type:)(0);
        v77 = createStorage<A>(capacity:type:)(v74);
        v81 = &v251;
        v251 = v75;
        v82 = &v250;
        v250 = v76;
        v79 = &v249;
        v249 = v77;
        v78 = 0;
        serialize(_:at:)(0, &v251);
        serialize(_:at:)(v78, v81);
        v248[4] = v91;
        v80 = &v50;
        MEMORY[0x24BDAC7A8](&v50);
        v40 = v82;
        v41 = &v50 - 6;
        v83 = &v50 - 6;
        v41[2] = (uint64_t)v81;
        v41[3] = (uint64_t)v40;
        v41[4] = v42;
        v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v39)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_241527000, v90, (os_log_type_t)v89, "appName in data dictionary is not of expected type String", v75, v88);
          v72 = 0;
          destroyStorage<A>(_:count:)(v76, 0, v73);
          destroyStorage<A>(_:count:)(v77, v72, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x242696394](v75, MEMORY[0x24BEE4260]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v202 + 8))(v206, v201);
      return 0;
    }
  }
  else
  {
    v43 = v204;
    v44 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v202 + 16))(v43, v44, v201);
    v69 = Logger.logObject.getter();
    v68 = static os_log_type_t.error.getter();
    v66 = &v259;
    v259 = 2;
    v64 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v65 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v67 = v260;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v70 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v69, (os_log_type_t)v68))
    {
      v45 = v200;
      v54 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v53 = 0;
      v55 = createStorage<A>(capacity:type:)(0);
      v56 = createStorage<A>(capacity:type:)(v53);
      v60 = &v258;
      v258 = v54;
      v61 = &v257;
      v257 = v55;
      v58 = &v256;
      v256 = v56;
      v57 = 0;
      serialize(_:at:)(0, &v258);
      serialize(_:at:)(v57, v60);
      v255[4] = v70;
      v59 = &v50;
      MEMORY[0x24BDAC7A8](&v50);
      v46 = v61;
      v47 = &v50 - 6;
      v62 = &v50 - 6;
      v47[2] = (uint64_t)v60;
      v47[3] = (uint64_t)v46;
      v47[4] = v48;
      v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v45)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_241527000, v69, (os_log_type_t)v68, "ssid in data dictionary is not of expected type String", v54, v67);
        v51 = 0;
        destroyStorage<A>(_:count:)(v55, 0, v52);
        destroyStorage<A>(_:count:)(v56, v51, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696394](v54, MEMORY[0x24BEE4260]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v202 + 8))(v204, v201);
    return 0;
  }
}

void *MediaML.prepareWifiDataForPrediction(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  Swift::String v6;
  uint64_t v7;
  void *v8;
  void *object;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String *v15;
  MediaML::WiFiDataPointForPrediciton *v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v20;
  _BYTE *v21;
  Swift::Double v22;
  _BYTE *v23;
  Swift::Double v24;
  Swift::String v25;
  uint64_t v26;
  Swift::String *v27;
  _BYTE *v28;
  Swift::Int v29;
  Swift::String v30;
  uint64_t v31;
  Swift::String *v32;
  _BYTE *v33;
  Swift::Int v34;
  Swift::String v35;
  uint64_t v36;
  Swift::String *v37;
  _BYTE *v38;
  Swift::String v39;
  Swift::String v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  Swift::String v47;
  uint64_t v48;
  uint64_t v49;
  Swift::String *v50;
  void *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  Swift::Int v64;
  void (*v65)(char *, uint64_t, uint64_t);
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  char *v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  Swift::Int v73;
  Swift::String v74;
  uint64_t v75;
  Swift::String *v76;
  Swift::String v77;
  Swift::String v78;
  Swift::Double v79;
  Swift::Double v80;
  Swift::String v81;
  _QWORD v82[4];
  _BYTE v83[32];
  Swift::Double v84;
  Swift::Double v85;
  Swift::String v86;
  _QWORD v87[4];
  _BYTE v88[32];
  Swift::Int v89;
  Swift::Int v90;
  Swift::String v91;
  _QWORD v92[4];
  _BYTE v93[32];
  Swift::Int v94;
  Swift::Int v95;
  Swift::String v96;
  _QWORD v97[4];
  _BYTE v98[32];
  Swift::String v99;
  Swift::String v100;
  Swift::String v101;
  _QWORD v102[4];
  _BYTE v103[32];
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  Swift::String v108;
  _QWORD v109[4];
  _BYTE v110[32];
  Swift::Int v111;
  Swift::Int v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  MediaML::WiFiDataPointForPrediciton v116;

  v51 = a2;
  v75 = a1;
  v52 = "Fatal error";
  v53 = "Unexpectedly found nil while unwrapping an Optional value";
  v54 = "MediaML/MediaML.swift";
  v115 = 0;
  v114 = 0;
  v113 = 0;
  v112 = 0;
  v111 = 0;
  v104 = 0;
  v105 = 0;
  v99 = (Swift::String)0;
  v94 = 0;
  v89 = 0;
  v84 = 0.0;
  v79 = 0.0;
  v78 = (Swift::String)0;
  v77 = (Swift::String)0;
  v56 = 0;
  v67 = type metadata accessor for Calendar.Component();
  v62 = *(_QWORD **)(v67 - 8);
  v55 = (v62[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v69 = (char *)&object - v55;
  v71 = type metadata accessor for Calendar();
  v63 = *(_QWORD *)(v71 - 8);
  v57 = (*(_QWORD *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v56);
  v70 = (char *)&object - v57;
  v58 = type metadata accessor for Date();
  v59 = *(_QWORD *)(v58 - 8);
  v60 = (*(_QWORD *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v75);
  v66 = (char *)&object - v60;
  v115 = (char *)&object - v60;
  v114 = v2;
  v113 = v61;
  Date.init()();
  static Calendar.current.getter();
  v3 = *MEMORY[0x24BDCF230];
  v65 = (void (*)(char *, uint64_t, uint64_t))v62[13];
  v65(v69, v3, v67);
  v4 = Calendar.component(_:from:)();
  v5 = v70;
  v64 = v4;
  v68 = (void (*)(char *, uint64_t))v62[1];
  v68(v69, v67);
  v72 = *(void (**)(char *, uint64_t))(v63 + 8);
  v72(v5, v71);
  v112 = v64;
  static Calendar.current.getter();
  v65(v69, *MEMORY[0x24BDCF278], v67);
  v73 = Calendar.component(_:from:)();
  v68(v69, v67);
  v72(v70, v71);
  v111 = v73;
  v74 = *kMediaML_ssid.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v76 = &v108;
  v108 = v74;
  MEMORY[0x2426960C4](v109);
  outlined destroy of String();
  if (!v109[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v44 = v110;
  outlined init with take of Any((uint64_t)v109, (uint64_t)v110);
  v49 = MEMORY[0x24BEE4AD8] + 8;
  v48 = MEMORY[0x24BEE0D00];
  swift_dynamicCast();
  v45 = v106;
  v46 = v107;
  v104 = v106;
  v105 = v107;
  v47 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v50 = &v101;
  v101 = v47;
  MEMORY[0x2426960C4](v102);
  outlined destroy of String();
  if (!v102[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v38 = v103;
  outlined init with take of Any((uint64_t)v102, (uint64_t)v103);
  v42 = MEMORY[0x24BEE4AD8] + 8;
  v41 = MEMORY[0x24BEE0D00];
  swift_dynamicCast();
  v39 = v100;
  v99 = v100;
  v40 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v43 = &v96;
  v96 = v40;
  MEMORY[0x2426960C4](v97);
  outlined destroy of String();
  if (!v97[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v33 = v98;
  outlined init with take of Any((uint64_t)v97, (uint64_t)v98);
  v36 = MEMORY[0x24BEE4AD8] + 8;
  swift_dynamicCast();
  v34 = v95;
  v94 = v95;
  v35 = *kMediaML_noise.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v37 = &v91;
  v91 = v35;
  MEMORY[0x2426960C4](v92);
  outlined destroy of String();
  if (!v92[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v28 = v93;
  outlined init with take of Any((uint64_t)v92, (uint64_t)v93);
  v31 = MEMORY[0x24BEE4AD8] + 8;
  swift_dynamicCast();
  v29 = v90;
  v89 = v90;
  v30 = *kMediaML_rxRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v32 = &v86;
  v86 = v30;
  MEMORY[0x2426960C4](v87);
  outlined destroy of String();
  if (!v87[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v23 = v88;
  outlined init with take of Any((uint64_t)v87, (uint64_t)v88);
  v26 = MEMORY[0x24BEE4AD8] + 8;
  swift_dynamicCast();
  v24 = v85;
  v84 = v85;
  v25 = *kMediaML_txRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v27 = &v81;
  v81 = v25;
  MEMORY[0x2426960C4](v82);
  outlined destroy of String();
  if (!v82[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v21 = v83;
  outlined init with take of Any((uint64_t)v82, (uint64_t)v83);
  swift_dynamicCast();
  v22 = v80;
  v79 = v80;
  if (v34 >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor())
  {
    if (v34 >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
      && v34 < *rssiBucket_medium_high_boundary.unsafeMutableAddressor())
    {
      v18 = *rssiBucket_medium.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v78 = v18;
    }
    else
    {
      v17 = *rssiBucket_high.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v78 = v17;
    }
  }
  else
  {
    v20 = *rssiBucket_low.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v78 = v20;
  }
  v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("_", 1uLL, 1);
  object = v6._object;
  v11 = MEMORY[0x242696154](v45, v46, v6._countAndFlagsBits);
  v13 = v7;
  swift_bridgeObjectRelease();
  v15 = &v78;
  v12 = v78;
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = MEMORY[0x242696154](v11, v13, v12._countAndFlagsBits, v12._object);
  v14._object = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v77 = v14;
  v16 = &v116;
  WiFiDataPointForPrediciton.init(appName:bucketedSSID:hour:dow:rssi:noise:txRate:rxRate:)(&v116, v39, v14, v64, v73, v34, v29, v22, v24);
  outlined destroy of String();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v66, v58);
  return memcpy(v51, v16, 0x50uLL);
}

uint64_t MediaML.validateCellDataForPrediction(data:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t *v26;
  uint64_t *v27;
  _BYTE **v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  uint32_t v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t *v47;
  uint64_t *v48;
  _BYTE **v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t *v55;
  uint32_t v56;
  int v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  Swift::String v66;
  Swift::String *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  unint64_t v77;
  char *v78;
  Swift::String v79;
  uint64_t v80;
  Swift::String *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE *v87;
  uint64_t v88;
  uint32_t v89;
  Swift::String v90;
  _QWORD v91[5];
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  uint64_t v95;
  uint32_t v96;
  Swift::String v97;
  _QWORD v98[4];
  uint64_t v99;
  uint64_t v100;

  v80 = a1;
  v100 = 0;
  v99 = 0;
  v72 = 0;
  v73 = type metadata accessor for Logger();
  v74 = *(_QWORD *)(v73 - 8);
  v75 = (*(_QWORD *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v80);
  v76 = (char *)&v18 - v75;
  v77 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v78 = (char *)&v18 - v77;
  v100 = v4;
  v99 = v1;
  v79 = *kMediaML_carrier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v81 = &v97;
  v97 = v79;
  MEMORY[0x2426960C4](v98);
  outlined destroy of String();
  if (v98[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
      v71 = v82;
    else
      v71 = 0;
    v70 = v71;
  }
  else
  {
    v39 = 0;
    outlined destroy of Any?((uint64_t)v98);
    v70 = v39;
  }
  v69 = v70;
  if (v70)
  {
    v68 = v69;
    swift_bridgeObjectRelease();
    v66 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v67 = &v90;
    v90 = v66;
    MEMORY[0x2426960C4](v91);
    outlined destroy of String();
    if (v91[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
        v65 = v83;
      else
        v65 = 0;
      v64 = v65;
    }
    else
    {
      v60 = 0;
      outlined destroy of Any?((uint64_t)v91);
      v64 = v60;
    }
    v63 = v64;
    if (v64)
    {
      v62 = v63;
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v5 = v78;
      v6 = MediaML.logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v5, v6, v73);
      v58 = Logger.logObject.getter();
      v57 = static os_log_type_t.error.getter();
      v55 = &v88;
      v88 = 2;
      v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v54 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v56 = v89;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v59 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v58, (os_log_type_t)v57))
      {
        v7 = v72;
        v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v42 = 0;
        v44 = createStorage<A>(capacity:type:)(0);
        v45 = createStorage<A>(capacity:type:)(v42);
        v49 = &v87;
        v87 = v43;
        v50 = &v86;
        v86 = v44;
        v47 = &v85;
        v85 = v45;
        v46 = 0;
        serialize(_:at:)(0, &v87);
        serialize(_:at:)(v46, v49);
        v84 = v59;
        v48 = &v18;
        MEMORY[0x24BDAC7A8](&v18);
        v8 = v50;
        v9 = &v18 - 6;
        v51 = &v18 - 6;
        v9[2] = (uint64_t)v49;
        v9[3] = (uint64_t)v8;
        v9[4] = v10;
        v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v7)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_241527000, v58, (os_log_type_t)v57, "appName in data dictionary is not of expected type String", v43, v56);
          v40 = 0;
          destroyStorage<A>(_:count:)(v44, 0, v41);
          destroyStorage<A>(_:count:)(v45, v40, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x242696394](v43, MEMORY[0x24BEE4260]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v74 + 8))(v78, v73);
      return 0;
    }
  }
  else
  {
    v11 = v76;
    v12 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v11, v12, v73);
    v37 = Logger.logObject.getter();
    v36 = static os_log_type_t.error.getter();
    v34 = &v95;
    v95 = 2;
    v32 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v33 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v35 = v96;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v38 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v37, (os_log_type_t)v36))
    {
      v13 = v72;
      v22 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v21 = 0;
      v23 = createStorage<A>(capacity:type:)(0);
      v24 = createStorage<A>(capacity:type:)(v21);
      v28 = &v94;
      v94 = v22;
      v29 = &v93;
      v93 = v23;
      v26 = &v92;
      v92 = v24;
      v25 = 0;
      serialize(_:at:)(0, &v94);
      serialize(_:at:)(v25, v28);
      v91[4] = v38;
      v27 = &v18;
      MEMORY[0x24BDAC7A8](&v18);
      v14 = v29;
      v15 = &v18 - 6;
      v30 = &v18 - 6;
      v15[2] = (uint64_t)v28;
      v15[3] = (uint64_t)v14;
      v15[4] = v16;
      v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v13)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_241527000, v37, (os_log_type_t)v36, "carrier in data dictionary is not of expected type String", v22, v35);
        v19 = 0;
        destroyStorage<A>(_:count:)(v23, 0, v20);
        destroyStorage<A>(_:count:)(v24, v19, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696394](v22, MEMORY[0x24BEE4260]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v74 + 8))(v76, v73);
    return 0;
  }
}

void *MediaML.prepareCellDataForPrediction(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  Swift::Int v3;
  Swift::Int v4;
  Swift::Int v5;
  Swift::Int v6;
  Swift::Int bars;
  Swift::Int v8;
  Swift::Int v9;
  char v10;
  Swift::Int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  Swift::String v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  Swift::String v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  Swift::String v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  Swift::String appName;
  Swift::String v43;
  Swift::String carrier;
  Swift::String v45;
  Swift::String v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  Swift::Int v53;
  _QWORD v54[4];
  Swift::Int v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  Swift::String v59;
  _QWORD v60[4];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  Swift::String v65;
  _QWORD v66[4];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  Swift::String v71;
  _QWORD v72[4];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  Swift::String v77;
  _QWORD v78[4];
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  Swift::String v83;
  _QWORD v84[4];
  uint64_t v85;
  Swift::String v86;
  Swift::String v87;
  Swift::String v88;
  _QWORD v89[4];
  char v90[32];
  Swift::String v91;
  Swift::String v92;
  Swift::String v93;
  _QWORD v94[4];
  char v95[32];
  uint64_t v96;
  uint64_t v97;
  MediaML::CellDataPointForPrediction v98;

  v96 = 0;
  v91 = (Swift::String)0;
  v86 = (Swift::String)0;
  v80 = 0;
  v74 = 0;
  v68 = 0;
  v62 = 0;
  v56 = 0;
  v97 = a1;
  v47 = *kMediaML_carrier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v93 = v47;
  MEMORY[0x2426960C4](v94);
  outlined destroy of String();
  if (!v94[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v94, (uint64_t)v95);
  swift_dynamicCast();
  carrier = v92;
  v91 = v92;
  v45 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v88 = v45;
  MEMORY[0x2426960C4](v89);
  outlined destroy of String();
  if (!v89[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v89, (uint64_t)v90);
  swift_dynamicCast();
  appName = v87;
  v86 = v87;
  v43 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v83 = v43;
  MEMORY[0x2426960C4](v84);
  outlined destroy of String();
  if (v84[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v40 = v48;
      v41 = 0;
    }
    else
    {
      v40 = 0;
      v41 = 1;
    }
    v38 = v40;
    v39 = v41;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v84);
    v38 = 0;
    v39 = 1;
  }
  v81 = v38;
  v82 = v39 & 1;
  if ((v39 & 1) != 0)
    v85 = 0;
  else
    v85 = v81;
  v36 = v85;
  v80 = v85;
  v37 = *kMediaML_rsrp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v77 = v37;
  MEMORY[0x2426960C4](v78);
  outlined destroy of String();
  if (v78[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v34 = v49;
      v35 = 0;
    }
    else
    {
      v34 = 0;
      v35 = 1;
    }
    v32 = v34;
    v33 = v35;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v78);
    v32 = 0;
    v33 = 1;
  }
  v75 = v32;
  v76 = v33 & 1;
  if ((v33 & 1) != 0)
    v79 = 0;
  else
    v79 = v75;
  v30 = v79;
  v74 = v79;
  v31 = *kMediaML_rsrq.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v71 = v31;
  MEMORY[0x2426960C4](v72);
  outlined destroy of String();
  if (v72[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v28 = v50;
      v29 = 0;
    }
    else
    {
      v28 = 0;
      v29 = 1;
    }
    v26 = v28;
    v27 = v29;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v72);
    v26 = 0;
    v27 = 1;
  }
  v69 = v26;
  v70 = v27 & 1;
  if ((v27 & 1) != 0)
    v73 = 0;
  else
    v73 = v69;
  v24 = v73;
  v68 = v73;
  v25 = *kMediaML_rscp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v65 = v25;
  MEMORY[0x2426960C4](v66);
  outlined destroy of String();
  if (v66[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v22 = v51;
      v23 = 0;
    }
    else
    {
      v22 = 0;
      v23 = 1;
    }
    v20 = v22;
    v21 = v23;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v66);
    v20 = 0;
    v21 = 1;
  }
  v63 = v20;
  v64 = v21 & 1;
  if ((v21 & 1) != 0)
    v67 = 0;
  else
    v67 = v63;
  v18 = v67;
  v62 = v67;
  v19 = *kMediaML_snr.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v59 = v19;
  MEMORY[0x2426960C4](v60);
  outlined destroy of String();
  if (v60[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v16 = v52;
      v17 = 0;
    }
    else
    {
      v16 = 0;
      v17 = 1;
    }
    v14 = v16;
    v15 = v17;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v60);
    v14 = 0;
    v15 = 1;
  }
  v57 = v14;
  v58 = v15 & 1;
  if ((v15 & 1) != 0)
    v61 = 0;
  else
    v61 = v57;
  v13 = v61;
  v56 = v61;
  kMediaML_bars.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x2426960C4](v54);
  outlined destroy of String();
  if (v54[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v11 = v53;
      v12 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 1;
    }
    v9 = v11;
    v10 = v12;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v54);
    v9 = 0;
    v10 = 1;
  }
  if ((v10 & 1) != 0)
    v55 = 0;
  else
    v55 = v9;
  bars = v55;
  v8 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v36 == 0x8000000000000000 && v8 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v6 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v6)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v30 == 0x8000000000000000 && v6 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v5 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v5)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v24 == 0x8000000000000000 && v5 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v4 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v4)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v18 == 0x8000000000000000 && v4 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v3 = *cell_snr_binsize.unsafeMutableAddressor();
  if (!v3)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v13 == 0x8000000000000000 && v3 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  CellDataPointForPrediction.init(appName:carrier:binnedRssi:binnedRsrp:binnedRscp:binnedRsrq:binnedSnr:bars:)(&v98, appName, carrier, v36 / v8, v30 / v6, v18 / v4, v24 / v5, v13 / v3, bars);
  return memcpy(a2, &v98, 0x50uLL);
}

uint64_t MediaML.getPredictionDictionary(data:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  *(_QWORD *)(v2 + 600) = v1;
  *(_QWORD *)(v2 + 592) = a1;
  *(_QWORD *)(v2 + 464) = v2;
  *(_QWORD *)(v2 + 472) = 0;
  *(_QWORD *)(v2 + 480) = 0;
  *(_QWORD *)(v2 + 384) = 0;
  *(_BYTE *)(v2 + 392) = 0;
  *(_QWORD *)(v2 + 488) = 0;
  *(_QWORD *)(v2 + 400) = 0;
  *(_BYTE *)(v2 + 408) = 0;
  *(_QWORD *)(v2 + 544) = 0;
  *(_QWORD *)(v2 + 552) = 0;
  *(_QWORD *)(v2 + 576) = 0;
  v3 = type metadata accessor for Logger();
  *(_QWORD *)(v2 + 608) = v3;
  *(_QWORD *)(v2 + 616) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 624) = swift_task_alloc();
  *(_QWORD *)(v2 + 632) = swift_task_alloc();
  *(_QWORD *)(v2 + 472) = a1;
  *(_QWORD *)(v2 + 480) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 640) = v4;
  *v4 = *(_QWORD *)(v6 + 464);
  v4[1] = MediaML.getPredictionDictionary(data:);
  return MediaML.getPrediction(data:)(a1);
}

_QWORD *MediaML.getPredictionDictionary(data:)(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v3;
  v7 = (_QWORD *)(*v3 + 464);
  *(_QWORD *)(v6 + 464) = *v3;
  *(_QWORD *)(v6 + 648) = v2;
  *(_QWORD *)(v6 + 656) = a1;
  *(_BYTE *)(v6 + 233) = a2;
  swift_task_dealloc();
  if (!v2)
    return (_QWORD *)swift_task_switch();
  swift_task_dealloc();
  v5 = swift_task_dealloc();
  return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v7 + 8))(v7, v5);
}

uint64_t MediaML.getPredictionDictionary(data:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  _QWORD *v3;
  Swift::String *v4;
  Swift::String *v5;
  char v6;
  _QWORD *v7;
  Swift::String *v8;
  _QWORD *v9;
  uint64_t result;
  Swift::String *v11;
  _QWORD *v12;
  Swift::String *v13;
  _QWORD *v14;
  Swift::String *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *buf;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint32_t size;
  os_log_type_t v31;
  NSObject *oslog;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  Swift::String v68;

  v1 = *(_BYTE *)(v0 + 233);
  v2 = *(_QWORD *)(v0 + 656);
  *(_QWORD *)(v0 + 464) = v0;
  *(_QWORD *)(v0 + 384) = v2;
  *(_BYTE *)(v0 + 392) = v1 & 1;
  *(_QWORD *)(v0 + 664) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
  _allocateUninitializedArray<A>(_:)();
  v66 = v3;
  v4 = kMediaML_throughputPrediction.unsafeMutableAddressor();
  outlined init with copy of String(v4, v66);
  v66[2] = 0;
  v5 = kMediaML_throughputStdDev.unsafeMutableAddressor();
  outlined init with copy of String(v5, v66 + 3);
  v66[5] = 0;
  _finalizeUninitializedArray<A>(_:)();
  v67 = Dictionary.init(dictionaryLiteral:)();
  *(_QWORD *)(v0 + 672) = v67;
  *(_QWORD *)(v0 + 488) = v67;
  v68 = *kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  *(Swift::String *)(v0 + 368) = v68;
  MEMORY[0x2426960C4]();
  outlined destroy of String();
  if (*(_QWORD *)(v0 + 200))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v63 = *(_QWORD *)(v65 + 584);
      v64 = 0;
    }
    else
    {
      v63 = 0;
      v64 = 1;
    }
    v61 = v63;
    v62 = v64;
  }
  else
  {
    outlined destroy of Any?(v65 + 176);
    v61 = 0;
    v62 = 1;
  }
  v6 = *(_BYTE *)(v65 + 233);
  *(_QWORD *)(v65 + 400) = v61;
  *(_BYTE *)(v65 + 408) = v62 & 1;
  *(_QWORD *)(v65 + 416) = 0;
  *(_BYTE *)(v65 + 424) = 1;
  if ((v6 & 1) != 0)
    return _assertionFailure(_:_:file:line:flags:)();
  if (*(double *)(v65 + 656) >= 0.0)
  {
    *(_QWORD *)(v65 + 208) = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
    *(_BYTE *)(v65 + 216) = 0;
    *(_QWORD *)(v65 + 224) = v61;
    *(_BYTE *)(v65 + 232) = v62 & 1;
    if ((*(_BYTE *)(v65 + 216) & 1) != 0)
    {
      if ((*(_BYTE *)(v65 + 232) & 1) == 0)
      {
LABEL_29:
        *(_QWORD *)(v65 + 240) = *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor();
        *(_BYTE *)(v65 + 248) = 0;
        *(_QWORD *)(v65 + 256) = v61;
        *(_BYTE *)(v65 + 264) = v62 & 1;
        if ((*(_BYTE *)(v65 + 248) & 1) != 0)
        {
          if ((*(_BYTE *)(v65 + 264) & 1) == 0)
          {
LABEL_48:
            swift_bridgeObjectRetain();
            v34 = _dictionaryUpCast<A, B, C, D>(_:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v49 = v34;
LABEL_56:
            swift_task_dealloc();
            swift_task_dealloc();
            return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v65 + 464) + 8))(v49);
          }
        }
        else
        {
          outlined init with copy of Int?(v65 + 240, v65 + 432);
          if ((*(_BYTE *)(v65 + 264) & 1) != 0 || *(_QWORD *)(v65 + 432) != *(_QWORD *)(v65 + 256))
            goto LABEL_48;
        }
        v46 = *(_QWORD *)(v65 + 600);
        MediaML.prepareCellDataForPrediction(data:)(*(_QWORD *)(v65 + 592), (void *)(v65 + 16));
        swift_beginAccess();
        v47 = *(_QWORD *)(v46 + 112);
        swift_retain();
        swift_endAccess();
        *(_QWORD *)(v65 + 536) = v47;
        if (!*(_QWORD *)(v65 + 536))
        {
          outlined destroy of DataWriter?();
          *(_QWORD *)(v65 + 416) = 0x3FF0000000000000;
          *(_BYTE *)(v65 + 424) = 0;
          v43 = *(_BYTE *)(v65 + 233);
          v42 = *(_QWORD *)(v65 + 656);
          _allocateUninitializedArray<A>(_:)();
          v41 = v12;
          v13 = kMediaML_throughputPrediction.unsafeMutableAddressor();
          outlined init with copy of String(v13, v41);
          if ((v43 & 1) != 0)
            v41[2] = 0;
          else
            v41[2] = v42;
          v15 = kMediaML_throughputStdDev.unsafeMutableAddressor();
          outlined init with copy of String(v15, v41 + 3);
          if ((*(_BYTE *)(v65 + 424) & 1) != 0)
            v41[5] = 0;
          else
            v41[5] = *(_QWORD *)(v65 + 416);
          _finalizeUninitializedArray<A>(_:)();
          *(_QWORD *)(v65 + 544) = Dictionary.init(dictionaryLiteral:)();
          swift_bridgeObjectRetain();
          v35 = _dictionaryUpCast<A, B, C, D>(_:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          outlined release of CellDataPointForPrediction(v65 + 16);
          swift_bridgeObjectRelease();
          v49 = v35;
          goto LABEL_56;
        }
        outlined destroy of DataWriter?();
        v44 = *(_QWORD *)(v65 + 600);
        swift_beginAccess();
        v45 = *(_QWORD *)(v44 + 112);
        *(_QWORD *)(v65 + 728) = v45;
        swift_retain();
        swift_endAccess();
        if (v45)
        {
          v40 = *(_QWORD *)(v65 + 16);
          v36 = *(_QWORD *)(v65 + 24);
          *(_QWORD *)(v65 + 736) = v36;
          swift_bridgeObjectRetain();
          v37 = *(_QWORD *)(v65 + 32);
          v38 = *(_QWORD *)(v65 + 40);
          *(_QWORD *)(v65 + 744) = v38;
          swift_bridgeObjectRetain();
          v39 = *(_QWORD *)(v65 + 88);
          v14 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v65 + 752) = v14;
          *v14 = *(_QWORD *)(v65 + 464);
          v14[1] = MediaML.getPredictionDictionary(data:);
          return DataWriter.readCellStdDev(appName:carrier:bars:)(v40, v36, v37, v38, v39);
        }
        return _assertionFailure(_:_:file:line:flags:)();
      }
    }
    else
    {
      outlined init with copy of Int?(v65 + 208, v65 + 448);
      if ((*(_BYTE *)(v65 + 232) & 1) != 0 || *(_QWORD *)(v65 + 448) != *(_QWORD *)(v65 + 224))
        goto LABEL_29;
    }
    v59 = *(_QWORD *)(v65 + 600);
    MediaML.prepareWifiDataForPrediction(data:)(*(_QWORD *)(v65 + 592), (void *)(v65 + 96));
    swift_beginAccess();
    v60 = *(_QWORD *)(v59 + 112);
    swift_retain();
    swift_endAccess();
    *(_QWORD *)(v65 + 568) = v60;
    if (!*(_QWORD *)(v65 + 568))
    {
      outlined destroy of DataWriter?();
      *(_QWORD *)(v65 + 416) = 0x3FF0000000000000;
      *(_BYTE *)(v65 + 424) = 0;
      v56 = *(_BYTE *)(v65 + 233);
      v55 = *(_QWORD *)(v65 + 656);
      _allocateUninitializedArray<A>(_:)();
      v54 = v7;
      v8 = kMediaML_throughputPrediction.unsafeMutableAddressor();
      outlined init with copy of String(v8, v54);
      if ((v56 & 1) != 0)
        v54[2] = 0;
      else
        v54[2] = v55;
      v11 = kMediaML_throughputStdDev.unsafeMutableAddressor();
      outlined init with copy of String(v11, v54 + 3);
      if ((*(_BYTE *)(v65 + 424) & 1) != 0)
        v54[5] = 0;
      else
        v54[5] = *(_QWORD *)(v65 + 416);
      _finalizeUninitializedArray<A>(_:)();
      *(_QWORD *)(v65 + 576) = Dictionary.init(dictionaryLiteral:)();
      swift_bridgeObjectRetain();
      v48 = _dictionaryUpCast<A, B, C, D>(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      outlined release of WiFiDataPointForPrediciton(v65 + 96);
      swift_bridgeObjectRelease();
      v49 = v48;
      goto LABEL_56;
    }
    outlined destroy of DataWriter?();
    v57 = *(_QWORD *)(v65 + 600);
    swift_beginAccess();
    v58 = *(_QWORD *)(v57 + 112);
    *(_QWORD *)(v65 + 680) = v58;
    swift_retain();
    swift_endAccess();
    if (v58)
    {
      v53 = *(_QWORD *)(v65 + 96);
      v50 = *(_QWORD *)(v65 + 104);
      *(_QWORD *)(v65 + 688) = v50;
      swift_bridgeObjectRetain();
      v51 = *(_QWORD *)(v65 + 112);
      v52 = *(_QWORD *)(v65 + 120);
      *(_QWORD *)(v65 + 696) = v52;
      swift_bridgeObjectRetain();
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v65 + 704) = v9;
      *v9 = *(_QWORD *)(v65 + 464);
      v9[1] = MediaML.getPredictionDictionary(data:);
      return DataWriter.readWiFiStdDev(appName:ssid:)(v53, v50, v51, v52);
    }
    return _assertionFailure(_:_:file:line:flags:)();
  }
  v16 = *(_QWORD *)(v65 + 632);
  v28 = *(_QWORD *)(v65 + 616);
  v29 = *(_QWORD *)(v65 + 608);
  v17 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v16, v17, v29);
  oslog = Logger.logObject.getter();
  v31 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v65 + 496) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v65 + 236);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v33 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(oslog, v31))
  {
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  v18 = *(_QWORD *)(v65 + 648);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v25 = createStorage<A>(capacity:type:)(0);
  v26 = createStorage<A>(capacity:type:)(0);
  *(_QWORD *)(v65 + 504) = buf;
  *(_QWORD *)(v65 + 512) = v25;
  *(_QWORD *)(v65 + 520) = v26;
  serialize(_:at:)(0, (_BYTE **)(v65 + 504));
  serialize(_:at:)(0, (_BYTE **)(v65 + 504));
  *(_QWORD *)(v65 + 528) = v33;
  v27 = (_QWORD *)swift_task_alloc();
  v27[2] = v65 + 504;
  v27[3] = v65 + 512;
  v27[4] = v65 + 520;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  result = Sequence.forEach(_:)();
  if (!v18)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_241527000, oslog, v31, "Failed to get prediction from model", buf, size);
    destroyStorage<A>(_:count:)(v25, 0, v23);
    destroyStorage<A>(_:count:)(v26, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
LABEL_54:
    v20 = *(_QWORD *)(v65 + 632);
    v19 = *(_QWORD *)(v65 + 616);
    v21 = *(_QWORD *)(v65 + 608);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    swift_bridgeObjectRetain();
    v22 = _dictionaryUpCast<A, B, C, D>(_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v49 = v22;
    goto LABEL_56;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  Swift::String *v3;
  Swift::String *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;

  v1 = *(_QWORD *)(v0 + 712);
  *(_QWORD *)(v0 + 464) = v0;
  *(_QWORD *)(v0 + 416) = v1;
  *(_BYTE *)(v0 + 424) = 0;
  v10 = *(_BYTE *)(v0 + 233);
  v9 = *(_QWORD *)(v0 + 656);
  _allocateUninitializedArray<A>(_:)();
  v8 = v2;
  v3 = kMediaML_throughputPrediction.unsafeMutableAddressor();
  outlined init with copy of String(v3, v8);
  if ((v10 & 1) != 0)
    v8[2] = 0;
  else
    v8[2] = v9;
  v4 = kMediaML_throughputStdDev.unsafeMutableAddressor();
  outlined init with copy of String(v4, v8 + 3);
  if ((*(_BYTE *)(v7 + 424) & 1) != 0)
    v8[5] = 0;
  else
    v8[5] = *(_QWORD *)(v7 + 416);
  _finalizeUninitializedArray<A>(_:)();
  *(_QWORD *)(v7 + 576) = Dictionary.init(dictionaryLiteral:)();
  swift_bridgeObjectRetain();
  v6 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined release of WiFiDataPointForPrediciton(v7 + 96);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 464) + 8))(v6);
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  Swift::String *v3;
  Swift::String *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;

  v1 = *(_QWORD *)(v0 + 760);
  *(_QWORD *)(v0 + 464) = v0;
  *(_QWORD *)(v0 + 416) = v1;
  *(_BYTE *)(v0 + 424) = 0;
  v10 = *(_BYTE *)(v0 + 233);
  v9 = *(_QWORD *)(v0 + 656);
  _allocateUninitializedArray<A>(_:)();
  v8 = v2;
  v3 = kMediaML_throughputPrediction.unsafeMutableAddressor();
  outlined init with copy of String(v3, v8);
  if ((v10 & 1) != 0)
    v8[2] = 0;
  else
    v8[2] = v9;
  v4 = kMediaML_throughputStdDev.unsafeMutableAddressor();
  outlined init with copy of String(v4, v8 + 3);
  if ((*(_BYTE *)(v7 + 424) & 1) != 0)
    v8[5] = 0;
  else
    v8[5] = *(_QWORD *)(v7 + 416);
  _finalizeUninitializedArray<A>(_:)();
  *(_QWORD *)(v7 + 544) = Dictionary.init(dictionaryLiteral:)();
  swift_bridgeObjectRetain();
  v6 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined release of CellDataPointForPrediction(v7 + 16);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 464) + 8))(v6);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint32_t size;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;

  *(_QWORD *)(v0 + 464) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of WiFiDataPointForPrediciton(v0 + 96);
  v18 = *(id *)(v0 + 720);
  v1 = *(_QWORD *)(v0 + 624);
  v16 = *(_QWORD *)(v0 + 616);
  v17 = *(_QWORD *)(v0 + 608);
  v2 = v18;
  *(_QWORD *)(v0 + 552) = v18;
  v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v3, v17);
  v4 = v18;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  v27 = Logger.logObject.getter();
  v28 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 560) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 268);
  v23 = swift_allocObject();
  *(_BYTE *)(v23 + 16) = 64;
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = 8;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = partial apply for implicit closure #5 in MediaML.getPredictionDictionary(data:);
  *(_QWORD *)(v21 + 24) = v20;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v22 + 24) = v21;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v25 + 24) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v26 = v5;
  swift_retain();
  *v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v27, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v13 = createStorage<A>(capacity:type:)(1);
    v14 = createStorage<A>(capacity:type:)(0);
    v29 = buf;
    v30 = v13;
    v31 = v14;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl(&dword_241527000, v27, v28, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v13, 1, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v8 = v15[78];
  v7 = v15[77];
  v9 = v15[76];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  swift_bridgeObjectRetain();
  v10 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v15[58] + 8))(v10);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint32_t size;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;

  *(_QWORD *)(v0 + 464) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of CellDataPointForPrediction(v0 + 16);
  v18 = *(id *)(v0 + 768);
  v1 = *(_QWORD *)(v0 + 624);
  v16 = *(_QWORD *)(v0 + 616);
  v17 = *(_QWORD *)(v0 + 608);
  v2 = v18;
  *(_QWORD *)(v0 + 552) = v18;
  v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v3, v17);
  v4 = v18;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  v27 = Logger.logObject.getter();
  v28 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 560) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 268);
  v23 = swift_allocObject();
  *(_BYTE *)(v23 + 16) = 64;
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = 8;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = partial apply for implicit closure #5 in MediaML.getPredictionDictionary(data:);
  *(_QWORD *)(v21 + 24) = v20;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v22 + 24) = v21;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v25 + 24) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v26 = v5;
  swift_retain();
  *v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v27, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v13 = createStorage<A>(capacity:type:)(1);
    v14 = createStorage<A>(capacity:type:)(0);
    v29 = buf;
    v30 = v13;
    v31 = v14;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl(&dword_241527000, v27, v28, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v13, 1, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v8 = v15[78];
  v7 = v15[77];
  v9 = v15[76];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  swift_bridgeObjectRetain();
  v10 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v15[58] + 8))(v10);
}

uint64_t MediaML.getPredictionDictionary(data:)(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 464) = *v2;
  *(double *)(v3 + 712) = a1;
  *(_QWORD *)(v3 + 720) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 464) = *v2;
  *(double *)(v3 + 760) = a1;
  *(_QWORD *)(v3 + 768) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t MediaML.getPrediction(data:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;

  v2[43] = v1;
  v2[42] = a1;
  v2[28] = v2;
  v2[29] = 0;
  v2[30] = 0;
  v2[36] = 0;
  v2[39] = 0;
  v3 = type metadata accessor for Logger();
  v2[44] = v3;
  v2[45] = *(_QWORD *)(v3 - 8);
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[29] = a1;
  v2[30] = v5;
  return swift_task_switch();
}

uint64_t MediaML.getPrediction(data:)()
{
  Swift::String *v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  _QWORD *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint32_t v26;
  os_log_type_t v27;
  NSObject *log;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint32_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  NSObject *oslog;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t *buf;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint32_t size;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  Swift::String v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t, uint64_t);
  uint64_t v99;
  uint8_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;

  v0[14]._countAndFlagsBits = (uint64_t)v0;
  v94 = *kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v0[13] = v94;
  MEMORY[0x2426960C4]();
  outlined destroy of String();
  if (v0[12]._object)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v91 = *(_QWORD *)(v93 + 328);
      v92 = 0;
    }
    else
    {
      v91 = 0;
      v92 = 1;
    }
    v89 = v91;
    v90 = v92;
  }
  else
  {
    outlined destroy of Any?(v93 + 176);
    v89 = 0;
    v90 = 1;
  }
  if ((v90 & 1) != 0)
  {
    v14 = *(_QWORD *)(v93 + 376);
    v24 = *(_QWORD *)(v93 + 360);
    v25 = *(_QWORD *)(v93 + 352);
    v15 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v14, v15, v25);
    log = Logger.logObject.getter();
    v27 = static os_log_type_t.error.getter();
    *(_QWORD *)(v93 + 248) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v26 = *(_DWORD *)(v93 + 544);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v29 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v27))
    {
      v20 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v21 = createStorage<A>(capacity:type:)(0);
      v22 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v93 + 256) = v20;
      *(_QWORD *)(v93 + 264) = v21;
      *(_QWORD *)(v93 + 272) = v22;
      serialize(_:at:)(0, (_BYTE **)(v93 + 256));
      serialize(_:at:)(0, (_BYTE **)(v93 + 256));
      *(_QWORD *)(v93 + 280) = v29;
      v23 = (_QWORD *)swift_task_alloc();
      v23[2] = v93 + 256;
      v23[3] = v93 + 264;
      v23[4] = v93 + 272;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_241527000, log, v27, "Wrong / No interface Type provided.", v20, v26);
      destroyStorage<A>(_:count:)(v21, 0, v19);
      destroyStorage<A>(_:count:)(v22, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v20, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(v93 + 376);
    v16 = *(_QWORD *)(v93 + 360);
    v18 = *(_QWORD *)(v93 + 352);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
    goto LABEL_41;
  }
  *(_QWORD *)(v93 + 288) = v89;
  if (v89 != *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
    && v89 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
    v11 = *(_QWORD *)(v93 + 384);
    v37 = *(_QWORD *)(v93 + 360);
    v38 = *(_QWORD *)(v93 + 352);
    v12 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v11, v12, v38);
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = v89;
    oslog = Logger.logObject.getter();
    v47 = static os_log_type_t.error.getter();
    *(_QWORD *)(v93 + 296) = 12;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v39 = *(_DWORD *)(v93 + 548);
    v42 = swift_allocObject();
    *(_BYTE *)(v42 + 16) = 0;
    v43 = swift_allocObject();
    *(_BYTE *)(v43 + 16) = 8;
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = partial apply for implicit closure #2 in MediaML.getPrediction(data:);
    *(_QWORD *)(v41 + 24) = v40;
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(_QWORD *)(v44 + 24) = v41;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    v45 = v13;
    swift_retain();
    *v45 = closure #1 in OSLogArguments.append(_:)partial apply;
    v45[1] = v42;
    swift_retain();
    v45[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v45[3] = v43;
    swift_retain();
    v45[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v45[5] = v44;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v47))
    {
      v34 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v35 = createStorage<A>(capacity:type:)(0);
      v36 = createStorage<A>(capacity:type:)(0);
      v95 = v34;
      v96 = v35;
      v97 = v36;
      serialize(_:at:)(0, &v95);
      serialize(_:at:)(1, &v95);
      v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v99 = v42;
      closure #1 in osLogInternal(_:log:type:)(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
      v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v99 = v43;
      closure #1 in osLogInternal(_:log:type:)(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
      v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v99 = v44;
      closure #1 in osLogInternal(_:log:type:)(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
      _os_log_impl(&dword_241527000, oslog, v47, "Expected interfaceType to be in (3,5) but got %ld", v34, v39);
      destroyStorage<A>(_:count:)(v35, 0, v33);
      destroyStorage<A>(_:count:)(v36, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v34, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    v31 = *(_QWORD *)(v93 + 384);
    v30 = *(_QWORD *)(v93 + 360);
    v32 = *(_QWORD *)(v93 + 352);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
    goto LABEL_41;
  }
  v1 = *(_QWORD *)(v93 + 392);
  v71 = *(_QWORD *)(v93 + 360);
  v72 = *(_QWORD *)(v93 + 352);
  v73 = *(_QWORD *)(v93 + 336);
  v2 = MediaML.logger.unsafeMutableAddressor();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 16);
  *(_QWORD *)(v93 + 400) = v3;
  v3(v1, v2, v72);
  v76 = swift_allocObject();
  *(_QWORD *)(v76 + 16) = v89;
  swift_bridgeObjectRetain();
  v74 = swift_allocObject();
  *(_QWORD *)(v74 + 16) = v73;
  swift_retain();
  v78 = swift_allocObject();
  *(_QWORD *)(v78 + 16) = partial apply for implicit closure #4 in MediaML.getPrediction(data:);
  *(_QWORD *)(v78 + 24) = v74;
  swift_release();
  v87 = Logger.logObject.getter();
  v88 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v93 + 304) = 22;
  *(_QWORD *)(v93 + 408) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v93 + 416) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v93 + 424) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v93 + 552);
  v80 = swift_allocObject();
  *(_BYTE *)(v80 + 16) = 0;
  v81 = swift_allocObject();
  *(_BYTE *)(v81 + 16) = 8;
  v77 = swift_allocObject();
  *(_QWORD *)(v77 + 16) = partial apply for implicit closure #3 in MediaML.getPrediction(data:);
  *(_QWORD *)(v77 + 24) = v76;
  v82 = swift_allocObject();
  *(_QWORD *)(v82 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(_QWORD *)(v82 + 24) = v77;
  v83 = swift_allocObject();
  *(_BYTE *)(v83 + 16) = 32;
  v84 = swift_allocObject();
  *(_BYTE *)(v84 + 16) = 8;
  v79 = swift_allocObject();
  *(_QWORD *)(v79 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(_QWORD *)(v79 + 24) = v78;
  v85 = swift_allocObject();
  *(_QWORD *)(v85 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(_QWORD *)(v85 + 24) = v79;
  *(_QWORD *)(v93 + 432) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v86 = v4;
  swift_retain();
  *v86 = closure #1 in OSLogArguments.append(_:)partial apply;
  v86[1] = v80;
  swift_retain();
  v86[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v86[3] = v81;
  swift_retain();
  v86[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v86[5] = v82;
  swift_retain();
  v86[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v86[7] = v83;
  swift_retain();
  v86[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v86[9] = v84;
  swift_retain();
  v86[10] = closure #1 in OSLogArguments.append(_:)partial apply;
  v86[11] = v85;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v87, v88))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v69 = createStorage<A>(capacity:type:)(0);
    v70 = createStorage<A>(capacity:type:)(1);
    v100 = buf;
    v101 = v69;
    v102 = v70;
    serialize(_:at:)(2, &v100);
    serialize(_:at:)(2, &v100);
    v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v104 = v80;
    closure #1 in osLogInternal(_:log:type:)(&v103, (uint64_t)&v100, (uint64_t)&v101, (uint64_t)&v102);
    v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v104 = v81;
    closure #1 in osLogInternal(_:log:type:)(&v103, (uint64_t)&v100, (uint64_t)&v101, (uint64_t)&v102);
    v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v104 = v82;
    closure #1 in osLogInternal(_:log:type:)(&v103, (uint64_t)&v100, (uint64_t)&v101, (uint64_t)&v102);
    v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v104 = v83;
    closure #1 in osLogInternal(_:log:type:)(&v103, (uint64_t)&v100, (uint64_t)&v101, (uint64_t)&v102);
    v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v104 = v84;
    closure #1 in osLogInternal(_:log:type:)(&v103, (uint64_t)&v100, (uint64_t)&v101, (uint64_t)&v102);
    v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v104 = v85;
    closure #1 in osLogInternal(_:log:type:)(&v103, (uint64_t)&v100, (uint64_t)&v101, (uint64_t)&v102);
    _os_log_impl(&dword_241527000, v87, v88, "Got data for prediction interface:%ld data:%s", buf, size);
    destroyStorage<A>(_:count:)(v69, 0, v67);
    destroyStorage<A>(_:count:)(v70, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v65 = *(_QWORD *)(v93 + 392);
  v64 = *(_QWORD *)(v93 + 360);
  v66 = *(_QWORD *)(v93 + 352);

  v5 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
  *(_QWORD *)(v93 + 440) = v5;
  v5(v65, v66);
  if (*kMediaML_InterfaceType_WiFi.unsafeMutableAddressor() != v89)
  {
    if (*kMediaML_InterfaceType_Cellular.unsafeMutableAddressor() != v89)
      goto LABEL_41;
    *(_BYTE *)(v93 + 560) = MediaML.validateCellDataForPrediction(data:)(*(_QWORD *)(v93 + 336));
    *(_BYTE *)(v93 + 561) = 1;
    if (*(_BYTE *)(v93 + 560) == 2)
    {
      if (*(_BYTE *)(v93 + 561) != 2)
        goto LABEL_41;
    }
    else
    {
      outlined init with copy of Bool?((_BYTE *)(v93 + 560), (_BYTE *)(v93 + 564));
      if (*(_BYTE *)(v93 + 561) == 2 || (*(_BYTE *)(v93 + 564) & 1) != (*(_BYTE *)(v93 + 561) & 1))
        goto LABEL_41;
    }
    v48 = *(_QWORD *)(v93 + 344);
    MediaML.prepareCellDataForPrediction(data:)(*(_QWORD *)(v93 + 336), (void *)(v93 + 16));
    v9 = *(_QWORD *)(v48 + 128);
    *(_QWORD *)(v93 + 496) = v9;
    swift_retain();
    *(_QWORD *)(v93 + 504) = *(_QWORD *)(v93 + 40);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v93 + 512) = *(_QWORD *)(v93 + 24);
    swift_bridgeObjectRetain();
    v49 = *(_QWORD *)(v93 + 80);
    v50 = *(_QWORD *)(v93 + 88);
    v51 = *(_QWORD *)(*(_QWORD *)v9 + 184) + **(int **)(*(_QWORD *)v9 + 184);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v93 + 520) = v10;
    *v10 = *(_QWORD *)(v93 + 224);
    v10[1] = MediaML.getPrediction(data:);
    v105 = v49;
    v106 = v50;
    __asm { BR              X8 }
  }
  *(_BYTE *)(v93 + 562) = MediaML.validateWifiDataForPrediction(data:)(*(_QWORD *)(v93 + 336));
  *(_BYTE *)(v93 + 563) = 1;
  if (*(_BYTE *)(v93 + 562) != 2)
  {
    outlined init with copy of Bool?((_BYTE *)(v93 + 562), (_BYTE *)(v93 + 565));
    if (*(_BYTE *)(v93 + 563) == 2 || (*(_BYTE *)(v93 + 565) & 1) != (*(_BYTE *)(v93 + 563) & 1))
      goto LABEL_41;
LABEL_21:
    v52 = *(_QWORD *)(v93 + 344);
    MediaML.prepareWifiDataForPrediction(data:)(*(_QWORD *)(v93 + 336), (void *)(v93 + 96));
    v6 = *(_QWORD *)(v52 + 120);
    *(_QWORD *)(v93 + 448) = v6;
    swift_retain();
    v63 = *(_QWORD *)(v93 + 112);
    v53 = *(_QWORD *)(v93 + 120);
    *(_QWORD *)(v93 + 456) = v53;
    swift_bridgeObjectRetain();
    v54 = *(_QWORD *)(v93 + 96);
    v55 = *(_QWORD *)(v93 + 104);
    *(_QWORD *)(v93 + 464) = v55;
    swift_bridgeObjectRetain();
    v56 = *(_QWORD *)(v93 + 128);
    v57 = *(_QWORD *)(v93 + 136);
    v58 = *(_QWORD *)(v93 + 144);
    v59 = *(_QWORD *)(v93 + 152);
    v60 = *(double *)(v93 + 160);
    v61 = *(double *)(v93 + 168);
    v62 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double))(*(_QWORD *)(*(_QWORD *)v6 + 184) + **(int **)(*(_QWORD *)v6 + 184));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v93 + 472) = v7;
    *v7 = *(_QWORD *)(v93 + 224);
    v7[1] = MediaML.getPrediction(data:);
    return v62(v63, v53, v54, v55, v56, v57, v58, v59, v60, v61);
  }
  if (*(_BYTE *)(v93 + 563) == 2)
    goto LABEL_21;
LABEL_41:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v93 + 224) + 8))(0, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  char v3;

  *(_QWORD *)(v0 + 224) = v0;
  outlined release of WiFiDataPointForPrediciton(v0 + 96);
  v3 = *(_BYTE *)(v0 + 566);
  v2 = *(_QWORD *)(v0 + 488);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(v2, v3 & 1);
}

{
  uint64_t v0;
  uint64_t v2;
  char v3;

  *(_QWORD *)(v0 + 224) = v0;
  outlined release of CellDataPointForPrediction(v0 + 16);
  v3 = *(_BYTE *)(v0 + 567);
  v2 = *(_QWORD *)(v0 + 536);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(v2, v3 & 1);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  id v17;
  uint32_t size;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;

  *(_QWORD *)(v0 + 224) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of WiFiDataPointForPrediciton(v0 + 96);
  v17 = *(id *)(v0 + 480);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  v1 = *(_QWORD *)(v0 + 368);
  v15 = *(_QWORD *)(v0 + 352);
  v2 = v17;
  *(_QWORD *)(v0 + 312) = v17;
  v3 = MediaML.logger.unsafeMutableAddressor();
  v16(v1, v3, v15);
  v4 = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 320) = 12;
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 556);
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = 64;
  v23 = swift_allocObject();
  *(_BYTE *)(v23 + 16) = 8;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = partial apply for implicit closure #5 in MediaML.getPrediction(data:);
  *(_QWORD *)(v20 + 24) = v19;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v21 + 24) = v20;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v24 + 24) = v21;
  _allocateUninitializedArray<A>(_:)();
  v25 = v5;
  swift_retain();
  *v25 = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[1] = v22;
  swift_retain();
  v25[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[3] = v23;
  swift_retain();
  v25[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[5] = v24;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v26, v27))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v12 = createStorage<A>(capacity:type:)(1);
    v13 = createStorage<A>(capacity:type:)(0);
    v28 = buf;
    v29 = v12;
    v30 = v13;
    serialize(_:at:)(2, &v28);
    serialize(_:at:)(1, &v28);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    _os_log_impl(&dword_241527000, v26, v27, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12, 1, v10);
    destroyStorage<A>(_:count:)(v13, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v9 = (void (*)(uint64_t, uint64_t))v14[55];
  v7 = v14[46];
  v8 = v14[44];

  v9(v7, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v14[28] + 8))(0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  id v17;
  uint32_t size;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;

  *(_QWORD *)(v0 + 224) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of CellDataPointForPrediction(v0 + 16);
  v17 = *(id *)(v0 + 528);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  v1 = *(_QWORD *)(v0 + 368);
  v15 = *(_QWORD *)(v0 + 352);
  v2 = v17;
  *(_QWORD *)(v0 + 312) = v17;
  v3 = MediaML.logger.unsafeMutableAddressor();
  v16(v1, v3, v15);
  v4 = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 320) = 12;
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 556);
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = 64;
  v23 = swift_allocObject();
  *(_BYTE *)(v23 + 16) = 8;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = partial apply for implicit closure #5 in MediaML.getPrediction(data:);
  *(_QWORD *)(v20 + 24) = v19;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v21 + 24) = v20;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(_QWORD *)(v24 + 24) = v21;
  _allocateUninitializedArray<A>(_:)();
  v25 = v5;
  swift_retain();
  *v25 = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[1] = v22;
  swift_retain();
  v25[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[3] = v23;
  swift_retain();
  v25[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[5] = v24;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v26, v27))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v12 = createStorage<A>(capacity:type:)(1);
    v13 = createStorage<A>(capacity:type:)(0);
    v28 = buf;
    v29 = v12;
    v30 = v13;
    serialize(_:at:)(2, &v28);
    serialize(_:at:)(1, &v28);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    _os_log_impl(&dword_241527000, v26, v27, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12, 1, v10);
    destroyStorage<A>(_:count:)(v13, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v9 = (void (*)(uint64_t, uint64_t))v14[55];
  v7 = v14[46];
  v8 = v14[44];

  v9(v7, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v14[28] + 8))(0, 0);
}

uint64_t MediaML.getPrediction(data:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 224) = *v3;
  v4 += 224;
  *(_QWORD *)(v4 + 256) = v2;
  *(_QWORD *)(v4 + 264) = a1;
  *(_BYTE *)(v4 + 342) = a2;
  swift_task_dealloc();
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 224) = *v3;
  v4 += 224;
  *(_QWORD *)(v4 + 304) = v2;
  *(_QWORD *)(v4 + 312) = a1;
  *(_BYTE *)(v4 + 343) = a2;
  swift_task_dealloc();
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

void *implicit closure #5 in MediaML.getPredictionDictionary(data:)(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t implicit closure #4 in MediaML.getPrediction(data:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = a1;
  *a2 = a1;
  return result;
}

void *implicit closure #5 in MediaML.getPrediction(data:)(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t MediaML.getModelStats()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v1[14] = v0;
  v1[8] = v1;
  v1[9] = 0;
  v1[11] = 0;
  v1[13] = 0;
  v2 = type metadata accessor for Logger();
  v1[15] = v2;
  v1[16] = *(_QWORD *)(v2 - 8);
  v1[17] = swift_task_alloc();
  v1[9] = v4;
  return swift_task_switch();
}

{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v6 = v0[14];
  v0[8] = v0;
  swift_beginAccess();
  v7 = *(_QWORD *)(v6 + 112);
  swift_retain();
  swift_endAccess();
  v0[10] = v7;
  if (v0[10])
  {
    outlined destroy of DataWriter?();
    v3 = v5[14];
    swift_beginAccess();
    v4 = *(_QWORD *)(v3 + 112);
    v5[18] = v4;
    swift_retain();
    swift_endAccess();
    if (v4)
    {
      v1 = (_QWORD *)swift_task_alloc();
      v5[19] = v1;
      *v1 = v5[8];
      v1[1] = MediaML.getModelStats();
      return DataWriter.readModelStatsFromDB()();
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
  else
  {
    outlined destroy of DataWriter?();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v5[8] + 8))(0);
  }
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = v0[20];
  v0[8] = v0;
  v0[13] = v1;
  v3 = v0[20];
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[8] + 8))(v3);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;

  v18 = *(id *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 136);
  v16 = *(_QWORD *)(v0 + 128);
  v17 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 64) = v0;
  swift_release();
  v2 = v18;
  *(_QWORD *)(v0 + 88) = v18;
  v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v3, v17);
  v4 = v18;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 96) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v19 = *(_DWORD *)(v0 + 176);
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = 32;
  v23 = swift_allocObject();
  *(_BYTE *)(v23 + 16) = 8;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = partial apply for implicit closure #1 in MediaML.getModelStats();
  *(_QWORD *)(v21 + 24) = v20;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(_QWORD *)(v24 + 24) = v21;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v25 = v5;
  swift_retain();
  *v25 = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[1] = v22;
  swift_retain();
  v25[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[3] = v23;
  swift_retain();
  v25[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v25[5] = v24;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v26, v27))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v13 = createStorage<A>(capacity:type:)(0);
    v14 = createStorage<A>(capacity:type:)(1);
    v28 = buf;
    v29 = v13;
    v30 = v14;
    serialize(_:at:)(2, &v28);
    serialize(_:at:)(1, &v28);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v32 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v31, (uint64_t)&v28, (uint64_t)&v29, (uint64_t)&v30);
    _os_log_impl(&dword_241527000, v26, v27, "Failed to get model stats with err=%s", buf, v19);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x242696394](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v10 = (id)v15[21];
  v8 = v15[17];
  v7 = v15[16];
  v9 = v15[15];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v15[8] + 8))(0);
}

uint64_t MediaML.getModelStats()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[8] = *v2;
  v3 += 8;
  v3[12] = a1;
  v3[13] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t implicit closure #1 in MediaML.getModelStats()()
{
  swift_getErrorValue();
  return Error.localizedDescription.getter();
}

uint64_t MediaML.__allocating_init()()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = v0;
  swift_allocObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = *(_QWORD *)(v0 + 16);
  v1[1] = MediaML.__allocating_init();
  return MediaML.init()();
}

_QWORD *MediaML.__allocating_init()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;

  v3 = *v2;
  *(_QWORD *)(v3 + 16) = *v2;
  v7 = (_QWORD *)(v3 + 16);
  v4 = swift_task_dealloc();
  if (v1)
    return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v7 + 8))(v7, v4);
  else
    return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v7 + 8))(v7, a1);
}

uint64_t MediaML.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  NSURL *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSURL *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSURL *v18;
  void *v19;
  id v20;
  _QWORD *v22;
  void *v23;
  id v24;
  id v25;
  unsigned __int8 v26;
  void *v27;
  id v28;
  id v29;
  unsigned __int8 v30;
  void (*v31)(uint64_t, uint64_t);
  void *v32;
  id v33;
  id v34;
  unsigned __int8 v35;
  BOOL v36;
  BOOL v37;
  char v38;
  char v39;
  BOOL v40;
  BOOL v41;
  char v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;

  *(_QWORD *)(v1 + 56) = v0;
  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 136) = 0;
  v58 = type metadata accessor for URL();
  v57 = *(_QWORD *)(v58 - 8);
  v50 = swift_task_alloc();
  *(_QWORD *)(v1 + 64) = v50;
  v51 = swift_task_alloc();
  *(_QWORD *)(v1 + 72) = v51;
  v52 = swift_task_alloc();
  *(_QWORD *)(v1 + 80) = v52;
  v53 = swift_task_alloc();
  *(_QWORD *)(v1 + 88) = v53;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URLResourceValues?);
  v54 = swift_task_alloc();
  *(_QWORD *)(v1 + 96) = v54;
  v55 = swift_task_alloc();
  *(_QWORD *)(v1 + 104) = v55;
  v60 = swift_task_alloc();
  *(_QWORD *)(v1 + 112) = v60;
  *(_QWORD *)(v1 + 24) = v56;
  swift_defaultActor_initialize();
  *(_QWORD *)(v56 + 112) = 0;
  v2 = mediaMLBaseDirectory.unsafeMutableAddressor();
  v59 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16);
  v59(v53, v2, v58);
  type metadata accessor for NSURLResourceKey();
  _allocateUninitializedArray<A>(_:)();
  outlined init with copy of NSURLResourceKey(MEMORY[0x24BDBCC60], v3);
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  Set.init(arrayLiteral:)();
  URL.resourceValues(forKeys:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v53, v58);
  v4 = type metadata accessor for URLResourceValues();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v60, 0, 1);
  v46 = type metadata accessor for URLResourceValues();
  v47 = *(_QWORD *)(v46 - 8);
  v48 = *(unsigned int (**)(uint64_t, uint64_t))(v47 + 48);
  if (v48(v60, 1) == 1)
  {
    outlined destroy of URLResourceValues?(v60);
    v45 = 2;
  }
  else
  {
    v44 = URLResourceValues.isDirectory.getter();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v60, v46);
    v45 = v44;
  }
  *(_BYTE *)(v49 + 137) = v45;
  *(_BYTE *)(v49 + 138) = 1;
  if (*(_BYTE *)(v49 + 137) != 2)
  {
    outlined init with copy of Bool?((_BYTE *)(v49 + 137), (_BYTE *)(v49 + 145));
    if (*(_BYTE *)(v49 + 138) == 2 || (*(_BYTE *)(v49 + 145) & 1) != (*(_BYTE *)(v49 + 138) & 1))
      goto LABEL_24;
LABEL_12:
    v5 = mediaMLModelDirectory.unsafeMutableAddressor();
    v59(v52, v5, v58);
    _allocateUninitializedArray<A>(_:)();
    outlined init with copy of NSURLResourceKey(MEMORY[0x24BDBCC60], v6);
    _finalizeUninitializedArray<A>(_:)();
    Set.init(arrayLiteral:)();
    URL.resourceValues(forKeys:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v52, v58);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56))(v55, 0, 1, v46);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v48)(v55, 1, v46) == 1)
    {
      outlined destroy of URLResourceValues?(v55);
      v43 = 2;
    }
    else
    {
      v42 = URLResourceValues.isDirectory.getter();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v55, v46);
      v43 = v42;
    }
    *(_BYTE *)(v49 + 141) = v43;
    *(_BYTE *)(v49 + 142) = 1;
    if (*(_BYTE *)(v49 + 141) == 2)
    {
      if (*(_BYTE *)(v49 + 142) == 2)
      {
        v41 = 1;
        goto LABEL_21;
      }
    }
    else
    {
      outlined init with copy of Bool?((_BYTE *)(v49 + 141), (_BYTE *)(v49 + 144));
      if (*(_BYTE *)(v49 + 142) != 2)
      {
        v41 = (*(_BYTE *)(v49 + 144) & 1) == (*(_BYTE *)(v49 + 142) & 1);
LABEL_21:
        v40 = v41;
        goto LABEL_25;
      }
    }
    v41 = 0;
    goto LABEL_21;
  }
  if (*(_BYTE *)(v49 + 138) == 2)
    goto LABEL_12;
LABEL_24:
  v40 = 0;
LABEL_25:
  if (v40)
  {
    v7 = mediaMLDataDirectory.unsafeMutableAddressor();
    v59(v51, v7, v58);
    _allocateUninitializedArray<A>(_:)();
    outlined init with copy of NSURLResourceKey(MEMORY[0x24BDBCC60], v8);
    _finalizeUninitializedArray<A>(_:)();
    Set.init(arrayLiteral:)();
    URL.resourceValues(forKeys:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v51, v58);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56))(v54, 0, 1, v46);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v48)(v54, 1, v46) == 1)
    {
      outlined destroy of URLResourceValues?(v54);
      v39 = 2;
    }
    else
    {
      v38 = URLResourceValues.isDirectory.getter();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v54, v46);
      v39 = v38;
    }
    *(_BYTE *)(v49 + 139) = v39;
    *(_BYTE *)(v49 + 140) = 1;
    if (*(_BYTE *)(v49 + 139) == 2)
    {
      if (*(_BYTE *)(v49 + 140) == 2)
      {
        v37 = 1;
        goto LABEL_35;
      }
    }
    else
    {
      outlined init with copy of Bool?((_BYTE *)(v49 + 139), (_BYTE *)(v49 + 143));
      if (*(_BYTE *)(v49 + 140) != 2)
      {
        v37 = (*(_BYTE *)(v49 + 143) & 1) == (*(_BYTE *)(v49 + 140) & 1);
LABEL_35:
        v36 = v37;
        goto LABEL_39;
      }
    }
    v37 = 0;
    goto LABEL_35;
  }
  v36 = 0;
LABEL_39:
  *(_BYTE *)(v49 + 136) = v36;
  if (v36)
  {
LABEL_43:
    type metadata accessor for WifiModel();
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v49 + 120) = v22;
    *v22 = *(_QWORD *)(v49 + 16);
    v22[1] = MediaML.init();
    return WifiModel.__allocating_init()();
  }
  v34 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v9 = mediaMLBaseDirectory.unsafeMutableAddressor();
  v59(v50, v9, v58);
  URL._bridgeToObjectiveC()(v10);
  v33 = v11;
  v31 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
  v31(v50, v58);
  *(_QWORD *)(v49 + 32) = 0;
  v35 = objc_msgSend(v34, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v33, 1, 0, v49 + 32);
  v32 = *(void **)(v49 + 32);
  v12 = v32;

  if ((v35 & 1) != 0)
  {
    v29 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v13 = mediaMLDataDirectory.unsafeMutableAddressor();
    v59(v50, v13, v58);
    URL._bridgeToObjectiveC()(v14);
    v28 = v15;
    v31(v50, v58);
    *(_QWORD *)(v49 + 40) = 0;
    v30 = objc_msgSend(v29, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v49 + 40);
    v27 = *(void **)(v49 + 40);
    v16 = v27;

    if ((v30 & 1) != 0)
    {
      v25 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
      v17 = mediaMLModelDirectory.unsafeMutableAddressor();
      v59(v50, v17, v58);
      URL._bridgeToObjectiveC()(v18);
      v24 = v19;
      v31(v50, v58);
      *(_QWORD *)(v49 + 48) = 0;
      v26 = objc_msgSend(v25, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v24, 1, 0, v49 + 48);
      v23 = *(void **)(v49 + 48);
      v20 = v23;

      if ((v26 & 1) != 0)
        goto LABEL_43;
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
    else
    {
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  outlined destroy of DataWriter?();
  swift_defaultActor_destroy();
  swift_deallocPartialClassInstance();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v49 + 16) + 8))();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(*(_QWORD *)(v0 + 56));
}

uint64_t MediaML.init()(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;

  v6 = *v1;
  v3 = *(_QWORD *)(*v1 + 56);
  *(_QWORD *)(v6 + 16) = *v1;
  swift_task_dealloc();
  *(_QWORD *)(v3 + 120) = a1;
  type metadata accessor for CellularModel();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 128) = v5;
  *v5 = *(_QWORD *)(v6 + 16);
  v5[1] = MediaML.init();
  return CellularModel.__allocating_init()();
}

{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 16) = *(_QWORD *)v1;
  swift_task_dealloc();
  *(_QWORD *)(v3 + 128) = a1;
  return swift_task_switch();
}

uint64_t MediaML.deinit()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t *v15;
  uint64_t *v16;
  _BYTE **v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint32_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint32_t v40;
  uint64_t v41;

  v41 = 0;
  v21 = 0;
  v31 = 0;
  v26 = type metadata accessor for Logger();
  v25 = *(_QWORD *)(v26 - 8);
  v23 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v26);
  v0 = (char *)&v8 - v23;
  v24 = (char *)&v8 - v23;
  v41 = v1;
  v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v0, v2, v26);
  v33 = Logger.logObject.getter();
  v32 = static os_log_type_t.info.getter();
  v29 = &v39;
  v39 = 2;
  v27 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v28 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v30 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v34 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v33, (os_log_type_t)v32))
  {
    v3 = v21;
    v11 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v10 = 0;
    v12 = createStorage<A>(capacity:type:)(0);
    v13 = createStorage<A>(capacity:type:)(v10);
    v17 = &v38;
    v38 = v11;
    v18 = &v37;
    v37 = v12;
    v15 = &v36;
    v36 = v13;
    v14 = 0;
    serialize(_:at:)(0, &v38);
    serialize(_:at:)(v14, v17);
    v35 = v34;
    v16 = &v8;
    MEMORY[0x24BDAC7A8](&v8);
    v4 = v18;
    v5 = &v8 - 6;
    v19 = &v8 - 6;
    v5[2] = (uint64_t)v17;
    v5[3] = (uint64_t)v4;
    v5[4] = v6;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_241527000, v33, (os_log_type_t)v32, "MediaML deinit successful!", v11, v30);
      v8 = 0;
      destroyStorage<A>(_:count:)(v12, 0, v9);
      destroyStorage<A>(_:count:)(v13, v8, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696394](v11, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v25 + 8))(v24, v26);
  outlined destroy of DataWriter?();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v22;
}

uint64_t MediaML.__deallocating_deinit()
{
  MediaML.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t MediaML.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance MediaML()
{
  return MediaML.unownedExecutor.getter();
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  lazy protocol witness table accessor for type String and conformance String();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  lazy protocol witness table accessor for type String and conformance String();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  lazy protocol witness table accessor for type String and conformance String();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)() & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  lazy protocol witness table accessor for type String and conformance String();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  return _SwiftNewtypeWrapper<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  return _SwiftNewtypeWrapper<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  return == infix<A>(_:_:)() & 1;
}

NSURLResourceKey protocol witness for RawRepresentable.init(rawValue:) in conformance NSURLResourceKey@<X0>(Swift::String *a1@<X0>, NSURLResourceKey *a2@<X8>)
{
  NSURLResourceKey result;

  result = NSURLResourceKey.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

NSURLResourceKey __swiftcall NSURLResourceKey.init(rawValue:)(Swift::String rawValue)
{
  id v1;
  void *v4;

  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x242696118](rawValue._countAndFlagsBits, rawValue._object);
  v1 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (NSURLResourceKey)v4;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSURLResourceKey@<X0>(uint64_t *a1@<X8>)
{
  void **v1;
  uint64_t result;
  uint64_t v3;

  result = NSURLResourceKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t NSURLResourceKey.rawValue.getter(void *a1)
{
  id v1;
  uint64_t v4;

  v1 = a1;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NSURLResourceKey()
{
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_241574504()
{
  return swift_deallocObject();
}

_BYTE **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_241574534()
{
  return swift_deallocObject();
}

uint64_t sub_241574564()
{
  swift_release();
  return swift_deallocObject();
}

void *_s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_2415745AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_2415745F4()
{
  swift_release();
  return swift_deallocObject();
}

void _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0(uint64_t *a1, _QWORD **a2, uint64_t a3)
{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t _s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcXEfU_TA_1(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_241574668()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in DataWriter.createTables()()
{
  uint64_t v0;

  return implicit closure #1 in DataWriter.createTables()(*(_QWORD *)(v0 + 16));
}

uint64_t partial apply for implicit closure #2 in DataWriter.createTables()()
{
  uint64_t v0;

  return implicit closure #2 in DataWriter.createTables()(v0);
}

uint64_t sub_2415746A0()
{
  return swift_deallocObject();
}

uint64_t sub_2415746D0()
{
  return swift_deallocObject();
}

uint64_t sub_241574700()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_2@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_241574748()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t sub_2415747E4()
{
  return swift_deallocObject();
}

uint64_t sub_241574814()
{
  return swift_deallocObject();
}

uint64_t sub_241574844()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24157488C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #4 in DataWriter.createTables()(uint64_t a1)
{
  uint64_t v1;

  return closure #4 in DataWriter.createTables()(a1, v1);
}

uint64_t partial apply for implicit closure #3 in DataWriter.createTables()()
{
  uint64_t v0;

  return implicit closure #3 in DataWriter.createTables()(v0);
}

uint64_t sub_241574950()
{
  return swift_deallocObject();
}

uint64_t sub_241574980()
{
  return swift_deallocObject();
}

uint64_t sub_2415749B0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415749F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined retain of WiFiDataPointForWriting(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t partial apply for closure #1 in DataWriter.writeRawDataForWiFi(data:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in DataWriter.writeRawDataForWiFi(data:)(a1, *(__int128 **)(v1 + 16));
}

uint64_t outlined release of WiFiDataPointForWriting(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined retain of CellDataPointForWriting(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t partial apply for closure #1 in DataWriter.writeRawDataForCell(data:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in DataWriter.writeRawDataForCell(data:)(a1, *(__int128 **)(v1 + 16));
}

uint64_t outlined release of CellDataPointForWriting(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DataWriter?()
{
  swift_release();
}

uint64_t type metadata accessor for DataWriter()
{
  return objc_opt_self();
}

uint64_t sub_241574CDC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in MediaML.ensureDataWriter()()
{
  uint64_t v0;

  return implicit closure #1 in MediaML.ensureDataWriter()(*(void **)(v0 + 16));
}

uint64_t sub_241574D20()
{
  return swift_deallocObject();
}

uint64_t sub_241574D50()
{
  return swift_deallocObject();
}

uint64_t sub_241574D80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241574DC8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241574E10()
{
  swift_release();
  return swift_deallocObject();
}

__n128 outlined init with take of Any(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_241574E74()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #11 in MediaML.writeWifiData(data:)()
{
  uint64_t v0;

  return implicit closure #11 in MediaML.writeWifiData(data:)(*(void **)(v0 + 16));
}

uint64_t sub_241574EB8()
{
  return swift_deallocObject();
}

uint64_t sub_241574EE8()
{
  return swift_deallocObject();
}

uint64_t sub_241574F18()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241574F60()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241574FA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24157501C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #10 in MediaML.writeCellData(data:)()
{
  uint64_t v0;

  return implicit closure #10 in MediaML.writeCellData(data:)(*(void **)(v0 + 16));
}

uint64_t sub_241575060()
{
  return swift_deallocObject();
}

uint64_t sub_241575090()
{
  return swift_deallocObject();
}

uint64_t sub_2415750C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575108()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575150()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415751C4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MediaML.writeData(data:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return implicit closure #1 in MediaML.writeData(data:)(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_241575208()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_241575300()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in MediaML.writeData(data:)()
{
  uint64_t v0;

  return implicit closure #2 in MediaML.writeData(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241575330()
{
  return swift_deallocObject();
}

uint64_t sub_241575360()
{
  return swift_deallocObject();
}

uint64_t sub_241575390()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_1()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_2415753D8()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_241575420()
{
  return swift_deallocObject();
}

uint64_t sub_241575450()
{
  return swift_deallocObject();
}

uint64_t sub_241575480()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415754C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined release of CellDataPointForPrediction(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24157572C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #5 in MediaML.getPredictionDictionary(data:)()
{
  uint64_t v0;

  return implicit closure #5 in MediaML.getPredictionDictionary(data:)(*(void **)(v0 + 16));
}

uint64_t sub_241575770()
{
  return swift_deallocObject();
}

uint64_t sub_2415757A0()
{
  return swift_deallocObject();
}

uint64_t sub_2415757D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575818()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575860()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined release of WiFiDataPointForPrediciton(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_241575910()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in MediaML.getPrediction(data:)()
{
  uint64_t v0;

  return implicit closure #2 in MediaML.getPrediction(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241575940()
{
  return swift_deallocObject();
}

uint64_t sub_241575970()
{
  return swift_deallocObject();
}

uint64_t sub_2415759A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415759E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575A84()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in MediaML.getPrediction(data:)()
{
  uint64_t v0;

  return implicit closure #3 in MediaML.getPrediction(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_241575AB4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in MediaML.getPrediction(data:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return implicit closure #4 in MediaML.getPrediction(data:)(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_241575AF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575B80()
{
  return swift_deallocObject();
}

uint64_t sub_241575BB0()
{
  return swift_deallocObject();
}

uint64_t sub_241575BE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575C28()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575CC4()
{
  return swift_deallocObject();
}

uint64_t sub_241575CF4()
{
  return swift_deallocObject();
}

uint64_t sub_241575D24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575D6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575DB4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #5 in MediaML.getPrediction(data:)()
{
  uint64_t v0;

  return implicit closure #5 in MediaML.getPrediction(data:)(*(void **)(v0 + 16));
}

uint64_t sub_241575DF8()
{
  return swift_deallocObject();
}

uint64_t sub_241575E28()
{
  return swift_deallocObject();
}

uint64_t sub_241575E58()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575EA0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241575EE8()
{
  swift_release();
  return swift_deallocObject();
}

_BYTE *outlined init with copy of Bool?(_BYTE *a1, _BYTE *a2)
{
  _BYTE *result;

  result = a2;
  *a2 = *a1;
  return result;
}

uint64_t sub_241575F44()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MediaML.getModelStats()()
{
  return implicit closure #1 in MediaML.getModelStats()();
}

uint64_t sub_241575F88()
{
  return swift_deallocObject();
}

uint64_t sub_241575FB8()
{
  return swift_deallocObject();
}

uint64_t sub_241575FE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241576030()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for NSURLResourceKey()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = lazy cache variable for type metadata for NSURLResourceKey;
  if (!lazy cache variable for type metadata for NSURLResourceKey)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSURLResourceKey);
      return v1;
    }
  }
  return v4;
}

_QWORD *outlined init with copy of NSURLResourceKey(id *a1, _QWORD *a2)
{
  id v2;
  _QWORD *result;
  id v4;

  v4 = *a1;
  v2 = *a1;
  result = a2;
  *a2 = v4;
  return result;
}

unint64_t lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    v0 = type metadata accessor for NSURLResourceKey();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSURLResourceKey, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    v0 = type metadata accessor for NSURLResourceKey();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSURLResourceKey, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    v0 = type metadata accessor for NSURLResourceKey();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSURLResourceKey, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    v0 = type metadata accessor for NSURLResourceKey();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSURLResourceKey, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    v0 = type metadata accessor for NSURLResourceKey();
    v1 = MEMORY[0x242696A30](&protocol conformance descriptor for NSURLResourceKey, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return v1;
  }
  return v3;
}

uint64_t outlined destroy of URLResourceValues?(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for URLResourceValues();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for WiFiDataPointForWriting(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for WiFiDataPointForWriting()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for WiFiDataPointForWriting(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  *a1 = *a2;
  v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = a2[4];
  swift_bridgeObjectRetain();
  a1[4] = v4;
  a1[5] = a2[5];
  v6 = a2[6];
  swift_bridgeObjectRetain();
  result = a1;
  a1[6] = v6;
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  return result;
}

double assignWithCopy for WiFiDataPointForWriting(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy128_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x80uLL);
}

double assignWithTake for WiFiDataPointForWriting(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WiFiDataPointForWriting(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 128))
    {
      v4 = *(_QWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (*(_QWORD *)(a1 + 8) < 0x100000000uLL)
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiFiDataPointForWriting(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 72) = 0;
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_QWORD *)(result + 96) = 0;
    *(_QWORD *)(result + 104) = 0;
    *(_QWORD *)(result + 112) = 0;
    *(_QWORD *)(result + 120) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 128) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 128) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2 - 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for WiFiDataPointForWriting()
{
  return &type metadata for WiFiDataPointForWriting;
}

uint64_t initializeBufferWithCopyOfBuffer for CellDataPointForWriting(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for CellDataPointForWriting()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CellDataPointForWriting(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  *a1 = *a2;
  v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = a2[4];
  swift_bridgeObjectRetain();
  a1[4] = v4;
  a1[5] = a2[5];
  v6 = a2[6];
  swift_bridgeObjectRetain();
  result = a1;
  a1[6] = v6;
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  return result;
}

double assignWithCopy for CellDataPointForWriting(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

double assignWithTake for CellDataPointForWriting(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CellDataPointForWriting(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 128))
    {
      v4 = *(_QWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (*(_QWORD *)(a1 + 8) < 0x100000000uLL)
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CellDataPointForWriting(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 72) = 0;
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_QWORD *)(result + 96) = 0;
    *(_QWORD *)(result + 104) = 0;
    *(_QWORD *)(result + 112) = 0;
    *(_QWORD *)(result + 120) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 128) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 128) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2 - 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CellDataPointForWriting()
{
  return &type metadata for CellDataPointForWriting;
}

uint64_t initializeBufferWithCopyOfBuffer for WiFiDataPointForPrediciton(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for WiFiDataPointForPrediciton()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for WiFiDataPointForPrediciton(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v5;

  *a1 = *a2;
  v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  result = a1;
  a1[3] = v5;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

double assignWithCopy for WiFiDataPointForPrediciton(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  result = *(double *)(a2 + 72);
  *(double *)(a1 + 72) = result;
  return result;
}

double assignWithTake for WiFiDataPointForPrediciton(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  result = *(double *)(a2 + 72);
  *(double *)(a1 + 72) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WiFiDataPointForPrediciton(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiFiDataPointForPrediciton(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 72) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 80) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 80) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2 - 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for WiFiDataPointForPrediciton()
{
  return &type metadata for WiFiDataPointForPrediciton;
}

uint64_t initializeBufferWithCopyOfBuffer for CellDataPointForPrediction(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for CellDataPointForPrediction()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CellDataPointForPrediction(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v5;

  *a1 = *a2;
  v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  result = a1;
  a1[3] = v5;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

_QWORD *assignWithCopy for CellDataPointForPrediction(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  swift_bridgeObjectRelease();
  result = a1;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

_QWORD *assignWithTake for CellDataPointForPrediction(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  result = a1;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

uint64_t getEnumTagSinglePayload for CellDataPointForPrediction(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CellDataPointForPrediction(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 72) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 80) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 80) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2 - 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CellDataPointForPrediction()
{
  return &type metadata for CellDataPointForPrediction;
}

uint64_t type metadata accessor for MediaML()
{
  return objc_opt_self();
}

unint64_t base witness table accessor for RawRepresentable in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
}

unint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
}

unint64_t base witness table accessor for Equatable in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
}

uint64_t partial apply for closure #1 in closure #1 in DataWriter.readModelStatsFromDB()(uint64_t a1)
{
  return closure #1 in closure #1 in DataWriter.readModelStatsFromDB()(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined retain of String()
{
  swift_bridgeObjectRetain();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t LocalizedError.failureReason.getter()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t URLResourceValues.isDirectory.getter()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x24BDCD870]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t URL.deletingLastPathComponent()()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t Date.init()()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t static Calendar.current.getter()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t Calendar.component(_:from:)()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t DataFrameProtocol.randomSplit(by:seed:)()
{
  return MEMORY[0x24BDF5C48]();
}

Swift::Bool __swiftcall DataFrame.containsColumn(_:)(Swift::String a1)
{
  return MEMORY[0x24BDF5CA0](a1._countAndFlagsBits, a1._object);
}

uint64_t DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)()
{
  return MEMORY[0x24BDF5CA8]();
}

uint64_t DataFrame.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BDF5CB0]();
}

uint64_t DataFrame.Rows.count.getter()
{
  return MEMORY[0x24BDF5D00]();
}

uint64_t type metadata accessor for DataFrame.Rows()
{
  return MEMORY[0x24BDF5D10]();
}

uint64_t DataFrame.Slice.rows.getter()
{
  return MEMORY[0x24BDF5D48]();
}

uint64_t DataFrame.Slice.shape.getter()
{
  return MEMORY[0x24BDF5D50]();
}

uint64_t type metadata accessor for DataFrame.Slice()
{
  return MEMORY[0x24BDF5D58]();
}

uint64_t DataFrame.Slice.subscript.getter()
{
  return MEMORY[0x24BDF5D70]();
}

uint64_t type metadata accessor for DataFrame()
{
  return MEMORY[0x24BDF5DF0]();
}

uint64_t DataFrame.init(_:)()
{
  return MEMORY[0x24BDF5E00]();
}

uint64_t DataFrame.subscript.getter()
{
  return MEMORY[0x24BDF5E08]();
}

uint64_t AnyColumnSlice.count.getter()
{
  return MEMORY[0x24BDF5E68]();
}

uint64_t AnyColumnSlice.distinct()()
{
  return MEMORY[0x24BDF5E70]();
}

uint64_t type metadata accessor for AnyColumnSlice()
{
  return MEMORY[0x24BDF5E78]();
}

uint64_t CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  return MEMORY[0x24BDF5E88]();
}

uint64_t type metadata accessor for CSVReadingOptions()
{
  return MEMORY[0x24BDF5E90]();
}

uint64_t Column.subscript.getter()
{
  return MEMORY[0x24BDF5FA8]();
}

uint64_t type metadata accessor for CSVType()
{
  return MEMORY[0x24BDF5FC8]();
}

uint64_t ColumnID.name.getter()
{
  return MEMORY[0x24BDF5FD8]();
}

uint64_t type metadata accessor for ColumnID()
{
  return MEMORY[0x24BDF5FE0]();
}

uint64_t ColumnID.init(_:_:)()
{
  return MEMORY[0x24BDF5FF0]();
}

uint64_t static MetricsKey.validationError.getter()
{
  return MEMORY[0x24BDC57F0]();
}

uint64_t type metadata accessor for MetricsKey()
{
  return MEMORY[0x24BDC5810]();
}

uint64_t OneHotEncoder.init()()
{
  return MEMORY[0x24BDC5960]();
}

uint64_t ColumnSelector.init(columns:estimator:)()
{
  return MEMORY[0x24BDC59A0]();
}

uint64_t TabularTransformer.callAsFunction(_:eventHandler:)()
{
  return MEMORY[0x24BDC5B10]();
}

uint64_t BoostedTreeRegressor.init(annotationColumnName:featureColumnNames:configuration:)()
{
  return MEMORY[0x24BDC5BE0]();
}

uint64_t BoostedTreeConfiguration.randomSeed.setter()
{
  return MEMORY[0x24BDC5D48]();
}

uint64_t BoostedTreeConfiguration.maximumDepth.setter()
{
  return MEMORY[0x24BDC5D68]();
}

uint64_t BoostedTreeConfiguration.maximumIterations.setter()
{
  return MEMORY[0x24BDC5D98]();
}

uint64_t BoostedTreeConfiguration.init()()
{
  return MEMORY[0x24BDC5DD0]();
}

uint64_t type metadata accessor for BoostedTreeConfiguration()
{
  return MEMORY[0x24BDC5DD8]();
}

uint64_t UpdatableTabularEstimator.appending<A>(_:)()
{
  return MEMORY[0x24BDC5E10]();
}

uint64_t dispatch thunk of SupervisedTabularEstimator.fitted(to:validateOn:eventHandler:)()
{
  return MEMORY[0x24BDC5E58]();
}

uint64_t SupervisedTabularEstimator.read(from:)()
{
  return MEMORY[0x24BDC5E68]();
}

uint64_t SupervisedTabularEstimator.write(_:to:overwrite:)()
{
  return MEMORY[0x24BDC5E70]();
}

uint64_t Event.metrics.getter()
{
  return MEMORY[0x24BDC60A0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return MEMORY[0x24BEE5558]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x24BEE04B0]();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE0630](seed);
}

Swift::String __swiftcall Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinExtendedGraphemeClusterLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x24BEE06D8](_builtinExtendedGraphemeClusterLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t MutableCollection.subscript.getter()
{
  return MEMORY[0x24BEE0850]();
}

uint64_t UnsafeBufferPointer.baseAddress.getter()
{
  return MEMORY[0x24BEE0990]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x24BEE0A08]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t String.init(stringInterpolation:)()
{
  return MEMORY[0x24BEE0AE0]();
}

uint64_t static String.+ infix(_:_:)()
{
  return MEMORY[0x24BEE0AF0]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x24BEE0AF8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x24BEE0B08]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x24BEE0BE8]();
}

{
  return MEMORY[0x24BEE0BF0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t Sequence.filter(_:)()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t Sequence.contains(where:)()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t Sequence<>.max()()
{
  return MEMORY[0x24BEE0F08]();
}

uint64_t Sequence<>.min()()
{
  return MEMORY[0x24BEE0F10]();
}

uint64_t Sequence<>.sorted()()
{
  return MEMORY[0x24BEE0F18]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x24BEE1108]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t specialized Array.count.getter()
{
  return MEMORY[0x24BEE5EE8]();
}

{
  return MEMORY[0x24BEE5EF0]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t specialized Array.append(_:)()
{
  return MEMORY[0x24BEE5F08]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t specialized Array.subscript.getter()
{
  return MEMORY[0x24BEE5F28]();
}

{
  return MEMORY[0x24BEE5F30]();
}

uint64_t UnownedSerialExecutor.init(_:)()
{
  return MEMORY[0x24BEE6B70]();
}

Swift::Double __swiftcall Double.init(_:)(Swift::Double a1)
{
  Swift::Double result;

  MEMORY[0x24BEE1450](a1);
  return result;
}

uint64_t Double.init<A>(_:)()
{
  return MEMORY[0x24BEE1470]();
}

uint64_t Set.init(arrayLiteral:)()
{
  return MEMORY[0x24BEE15B8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t Collection<>.makeIterator()()
{
  return MEMORY[0x24BEE1A10]();
}

uint64_t specialized Collection<>.makeIterator()()
{
  return MEMORY[0x24BEE5F38]();
}

{
  return MEMORY[0x24BEE5F40]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
  MEMORY[0x24BEE1BE0]();
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return MEMORY[0x24BEE2278]();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return MEMORY[0x24BEE2280]();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x24BEE2288]();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return MEMORY[0x24BEE2290]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x24BEE2298]();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return MEMORY[0x24BEE22A0]();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return MEMORY[0x24BEE22A8]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t _hashValue<A>(for:)()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2950](a1);
}

uint64_t ContiguousArray.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x24BEE2970]();
}

uint64_t ContiguousArray.count.getter()
{
  return MEMORY[0x24BEE2990]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t IndexingIterator.next()()
{
  return MEMORY[0x24BEE2BF8]();
}

uint64_t specialized IndexingIterator.next()()
{
  return MEMORY[0x24BEE5F48]();
}

{
  return MEMORY[0x24BEE5F50]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _assertionFailure(_:_:flags:)()
{
  return MEMORY[0x24BEE2F50]();
}

uint64_t _dictionaryUpCast<A, B, C, D>(_:)()
{
  return MEMORY[0x24BEE2F60]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t _SwiftNewtypeWrapper<>.hashValue.getter()
{
  return MEMORY[0x24BEE31C0]();
}

uint64_t _SwiftNewtypeWrapper<>._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE31C8]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t _SwiftNewtypeWrapper<>.hash(into:)()
{
  return MEMORY[0x24BEE31D8]();
}

uint64_t static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BEE31E0]();
}

uint64_t static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BEE31E8]();
}

uint64_t static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BEE31F0]();
}

uint64_t _SwiftNewtypeWrapper<>._bridgeToObjectiveC()()
{
  return MEMORY[0x24BEE31F8]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x24BEE3938]();
}

{
  return MEMORY[0x24BEE3940]();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
  MEMORY[0x24BEE3948](a1._countAndFlagsBits, a1._object);
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t specialized _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x24BEE5F58]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return MEMORY[0x24BEE3D30]();
}

uint64_t abs<A>(_:)()
{
  return MEMORY[0x24BEE3DE8]();
}

uint64_t max<A>(_:_:)()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t min<A>(_:_:)()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t zip<A, B>(_:_:)()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t Hasher.combine<A>(_:)()
{
  return MEMORY[0x24BEE42F0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t OptionSet<>.insert(_:)()
{
  return MEMORY[0x24BEE4A20]();
}

uint64_t OptionSet<>.remove(_:)()
{
  return MEMORY[0x24BEE4A28]();
}

uint64_t OptionSet<>.update(with:)()
{
  return MEMORY[0x24BEE4A30]();
}

uint64_t OptionSet<>.contains(_:)()
{
  return MEMORY[0x24BEE4A38]();
}

uint64_t OptionSet.intersection(_:)()
{
  return MEMORY[0x24BEE4A40]();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return MEMORY[0x24BEE4A48]();
}

uint64_t OptionSet.union(_:)()
{
  return MEMORY[0x24BEE4A50]();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return MEMORY[0x24BEE4A58]();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return MEMORY[0x24BEE4A60]();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return MEMORY[0x24BEE4A68]();
}

uint64_t OptionSet<>.init()()
{
  return MEMORY[0x24BEE4A70]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

sqlite3_int64 sqlite3_changes64(sqlite3 *a1)
{
  return MEMORY[0x24BEDE000](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x24BEDE120](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

