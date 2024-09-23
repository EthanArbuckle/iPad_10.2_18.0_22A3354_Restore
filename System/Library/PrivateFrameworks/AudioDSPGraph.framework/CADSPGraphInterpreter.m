@implementation CADSPGraphInterpreter

- (void).cxx_destruct
{
  AudioDSPGraph::Interpreter::~Interpreter((AudioDSPGraph::Interpreter *)&self->_interpreter);
}

- (id).cxx_construct
{
  NewBoxRegistry *p_mNewBoxRegistry;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
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
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  __int128 v67;
  int v68;
  void *__p[2];
  char v70;
  _QWORD v71[3];
  _QWORD *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  self->_interpreter.mNewBoxRegistry._vptr$Base = (void **)&off_250833EE0;
  p_mNewBoxRegistry = &self->_interpreter.mNewBoxRegistry;
  self->_interpreter._vptr$Interpreter = (void **)&off_250833EB0;
  self->_interpreter.mGraph.__ptr_.__value_ = 0;
  self->_interpreter.mNewBoxRegistry.mNewBoxMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_interpreter.mNewBoxRegistry.mNewBoxMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_interpreter.mNewBoxRegistry.mNewBoxMap.__table_.__p3_.__value_ = 1.0;
  self->_interpreter.mNewBoxRegistry.mNewBoxMapFromDesc.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_interpreter.mNewBoxRegistry.mNewBoxMapFromDesc.__table_.__p1_.__value_.__next_ = 0u;
  self->_interpreter.mNewBoxRegistry.mNewBoxMapFromDesc.__table_.__p3_.__value_ = 1.0;
  self->_interpreter.mNewBoxRegistry.mRegisteredBoxes.__begin_ = 0;
  self->_interpreter.mNewBoxRegistry.mRegisteredBoxes.__end_ = 0;
  self->_interpreter.mNewBoxRegistry.mRegisteredBoxes.__end_cap_.__value_ = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "gain");
  v67 = xmmword_236C78C80;
  v68 = 0;
  v71[0] = &off_250833F60;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v4 = v72;
  if (v72 == v71)
  {
    v5 = 4;
    v4 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "amul");
  v67 = xmmword_236C78C90;
  v68 = 0;
  v71[0] = &off_250833FA8;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v6 = v72;
  if (v72 == v71)
  {
    v7 = 4;
    v6 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_13;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_13:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "adiv");
  v67 = xmmword_236C78CA0;
  v68 = 0;
  v71[0] = &off_250834610;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v8 = v72;
  if (v72 == v71)
  {
    v9 = 4;
    v8 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_20;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_20:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "amin");
  v67 = xmmword_236C78CB0;
  v68 = 0;
  v71[0] = &off_250834C78;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v10 = v72;
  if (v72 == v71)
  {
    v11 = 4;
    v10 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_27;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_27:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "amax");
  v67 = xmmword_236C78CC0;
  v68 = 0;
  v71[0] = &off_250835220;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v12 = v72;
  if (v72 == v71)
  {
    v13 = 4;
    v12 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_34;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_34:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "adif");
  v67 = xmmword_236C78CD0;
  v68 = 0;
  v71[0] = &off_2508357C8;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v14 = v72;
  if (v72 == v71)
  {
    v15 = 4;
    v14 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_41;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_41:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "asum");
  v67 = xmmword_236C78CE0;
  v68 = 0;
  v71[0] = &off_250835E30;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v16 = v72;
  if (v72 == v71)
  {
    v17 = 4;
    v16 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_48;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_48:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "aabs");
  v67 = xmmword_236C78CF0;
  v68 = 0;
  v71[0] = &off_250836498;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v18 = v72;
  if (v72 == v71)
  {
    v19 = 4;
    v18 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_55;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_55:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "vcgn");
  v67 = xmmword_236C78D00;
  v68 = 0;
  v71[0] = &off_2508364E0;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v20 = v72;
  if (v72 == v71)
  {
    v21 = 4;
    v20 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_62;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_62:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "dbgn");
  v67 = xmmword_236C78D10;
  v68 = 0;
  v71[0] = &off_250836528;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v22 = v72;
  if (v72 == v71)
  {
    v23 = 4;
    v22 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_69;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_69:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "copy");
  v67 = xmmword_236C78D20;
  v68 = 0;
  v71[0] = &off_250836570;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v24 = v72;
  if (v72 == v71)
  {
    v25 = 4;
    v24 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_76;
    v25 = 5;
  }
  (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_76:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "sum");
  v67 = xmmword_236C78D30;
  v68 = 0;
  v71[0] = &off_2508365B8;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v26 = v72;
  if (v72 == v71)
  {
    v27 = 4;
    v26 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_83;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_83:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "mix");
  v67 = xmmword_236C78D40;
  v68 = 0;
  v71[0] = &off_250836600;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v28 = v72;
  if (v72 == v71)
  {
    v29 = 4;
    v28 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_90;
    v29 = 5;
  }
  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_90:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "average");
  v67 = xmmword_236C78D50;
  v68 = 0;
  v71[0] = &off_250836648;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v30 = v72;
  if (v72 == v71)
  {
    v31 = 4;
    v30 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_97;
    v31 = 5;
  }
  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_97:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "test");
  v67 = xmmword_236C78D60;
  v68 = 0;
  v71[0] = &off_250836690;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v32 = v72;
  if (v72 == v71)
  {
    v33 = 4;
    v32 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_104;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_104:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "src");
  v67 = xmmword_236C78D70;
  v68 = 0;
  v71[0] = &off_2508366D8;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v34 = v72;
  if (v72 == v71)
  {
    v35 = 4;
    v34 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_111;
    v35 = 5;
  }
  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_111:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "reblocker");
  v67 = xmmword_236C78D80;
  v68 = 0;
  v71[0] = &off_250836A00;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v36 = v72;
  if (v72 == v71)
  {
    v37 = 4;
    v36 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_118;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_118:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "freqsrc");
  v67 = xmmword_236C78D90;
  v68 = 0;
  v71[0] = &off_250836D28;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v38 = v72;
  if (v72 == v71)
  {
    v39 = 4;
    v38 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_125;
    v39 = 5;
  }
  (*(void (**)(void))(*v38 + 8 * v39))();
LABEL_125:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "fft");
  v67 = xmmword_236C78DA0;
  v68 = 0;
  v71[0] = &off_250837050;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v40 = v72;
  if (v72 == v71)
  {
    v41 = 4;
    v40 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_132;
    v41 = 5;
  }
  (*(void (**)(void))(*v40 + 8 * v41))();
LABEL_132:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "join");
  v67 = xmmword_236C78DB0;
  v68 = 0;
  v71[0] = &off_250837098;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v42 = v72;
  if (v72 == v71)
  {
    v43 = 4;
    v42 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_139;
    v43 = 5;
  }
  (*(void (**)(void))(*v42 + 8 * v43))();
LABEL_139:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "split");
  v67 = xmmword_236C78DC0;
  v68 = 0;
  v71[0] = &off_2508370E0;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v44 = v72;
  if (v72 == v71)
  {
    v45 = 4;
    v44 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_146;
    v45 = 5;
  }
  (*(void (**)(void))(*v44 + 8 * v45))();
LABEL_146:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "chancopy");
  v67 = xmmword_236C78DD0;
  v68 = 0;
  v71[0] = &off_250837128;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v46 = v72;
  if (v72 == v71)
  {
    v47 = 4;
    v46 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_153;
    v47 = 5;
  }
  (*(void (**)(void))(*v46 + 8 * v47))();
LABEL_153:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "delay");
  v67 = xmmword_236C78DE0;
  v68 = 0;
  v71[0] = &off_250837170;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v48 = v72;
  if (v72 == v71)
  {
    v49 = 4;
    v48 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_160;
    v49 = 5;
  }
  (*(void (**)(void))(*v48 + 8 * v49))();
LABEL_160:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "dead");
  v67 = xmmword_236C78DF0;
  v68 = 0;
  v71[0] = &off_2508371B8;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v50 = v72;
  if (v72 == v71)
  {
    v51 = 4;
    v50 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_167;
    v51 = 5;
  }
  (*(void (**)(void))(*v50 + 8 * v51))();
LABEL_167:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "constant");
  v67 = xmmword_236C78E00;
  v68 = 0;
  v71[0] = &off_250837200;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v52 = v72;
  if (v72 == v71)
  {
    v53 = 4;
    v52 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_174;
    v53 = 5;
  }
  (*(void (**)(void))(*v52 + 8 * v53))();
LABEL_174:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "dbcontrol");
  v67 = xmmword_236C78E10;
  v68 = 0;
  v71[0] = &off_250837248;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v54 = v72;
  if (v72 == v71)
  {
    v55 = 4;
    v54 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_181;
    v55 = 5;
  }
  (*(void (**)(void))(*v54 + 8 * v55))();
LABEL_181:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "denormalzero");
  v67 = xmmword_236C78E20;
  v68 = 0;
  v71[0] = &off_250837290;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v56 = v72;
  if (v72 == v71)
  {
    v57 = 4;
    v56 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_188;
    v57 = 5;
  }
  (*(void (**)(void))(*v56 + 8 * v57))();
LABEL_188:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "mantissarandom");
  v67 = xmmword_236C78E30;
  v68 = 0;
  v71[0] = &off_2508372D8;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v58 = v72;
  if (v72 == v71)
  {
    v59 = 4;
    v58 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_195;
    v59 = 5;
  }
  (*(void (**)(void))(*v58 + 8 * v59))();
LABEL_195:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "volumecurve");
  v67 = xmmword_236C78E40;
  v68 = 0;
  v71[0] = &off_250837320;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v60 = v72;
  if (v72 == v71)
  {
    v61 = 4;
    v60 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_202;
    v61 = 5;
  }
  (*(void (**)(void))(*v60 + 8 * v61))();
LABEL_202:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "nfnp");
  v67 = xmmword_236C78E50;
  v68 = 0;
  v71[0] = &off_250837368;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v62 = v72;
  if (v72 == v71)
  {
    v63 = 4;
    v62 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_209;
    v63 = 5;
  }
  (*(void (**)(void))(*v62 + 8 * v63))();
LABEL_209:
  if (v70 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "srlconverter");
  v67 = xmmword_236C78E60;
  v68 = 0;
  v71[0] = &off_2508373B0;
  v72 = v71;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v67, v71);
  v64 = v72;
  if (v72 == v71)
  {
    v65 = 4;
    v64 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_216;
    v65 = 5;
  }
  (*(void (**)(void))(*v64 + 8 * v65))();
LABEL_216:
  if (v70 < 0)
    operator delete(__p[0]);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_add", 0x705F5F2Bu, 0, 0, 0);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_subtract", 0x705F5F2Du, 0, 0, 1);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_multiply", 0x705F5F2Au, 0, 0, 2);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_divide", 0x705F5F2Fu, 0, 0, 3);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_negate", 0x705F5F6Eu, 0, 0, 4);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_logical_and", 0x705F2626u, 0, 0, 5);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_logical_or", 0x705F7C7Cu, 0, 0, 6);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_logical_not", 0x705F5F21u, 0, 0, 7);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_equal", 0x705F3D3Du, 0, 0, 9);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_not_equal", 0x705F213Du, 0, 0, 10);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_greater_or_equal", 0x705F3E3Du, 0, 0, 11);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_greater", 0x705F5F3Eu, 0, 0, 12);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_less_or_equal", 0x705F3C3Du, 0, 0, 13);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_less", 0x705F5F3Cu, 0, 0, 14);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_min", 0x705F5F6Du, 0, 0, 15);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_max", 0x705F5F4Du, 0, 0, 16);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_cast", 0x705F3C2Du, 1, 0, 8);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_add", 0x765F5F2Bu, 1, 1, 0);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_subtract", 0x765F5F2Du, 1, 1, 1);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_multiply", 0x765F5F2Au, 1, 1, 2);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_divide", 0x765F5F2Fu, 1, 1, 3);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_negate", 0x765F5F6Eu, 1, 1, 4);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_logical_and", 0x765F2626u, 1, 1, 5);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_logical_or", 0x765F7C7Cu, 1, 1, 6);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_not", 0x765F5F21u, 1, 1, 7);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_logical_not", 0x765F5F21u, 1, 1, 7);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_equal", 0x765F3D3Du, 1, 1, 9);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_not_equal", 0x765F213Du, 1, 1, 10);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_greater_or_equal", 0x765F3E3Du, 1, 1, 11);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_greater", 0x765F5F3Eu, 1, 1, 12);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_less_or_equal", 0x765F3C3Du, 1, 1, 13);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_less", 0x765F5F3Cu, 1, 1, 14);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_min", 0x765F5F6Du, 1, 1, 15);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_max", 0x765F5F4Du, 1, 1, 16);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_cast", 0x765F3C2Du, 0, 1, 8);
  *(_QWORD *)&self->_interpreter.mPrevious.mFormat.mBitsPerChannel = 0;
  *(_OWORD *)&self->_interpreter.mPrevious.mFormat.mBytesPerPacket = 0u;
  *(_OWORD *)&self->_interpreter.mPrevious.mFormat.mSampleRate = 0u;
  self->_interpreter.mPrevious.mBlockSize = 1;
  self->_interpreter.mPreviousNamed = 0;
  self->_interpreter.mHavePreviousFormat = 0;
  self->_interpreter.mSubsetStack.__end_ = 0;
  self->_interpreter.mSubsetStack.__end_cap_.__value_ = 0;
  self->_interpreter.mSubsetStack.__begin_ = 0;
  return self;
}

@end
