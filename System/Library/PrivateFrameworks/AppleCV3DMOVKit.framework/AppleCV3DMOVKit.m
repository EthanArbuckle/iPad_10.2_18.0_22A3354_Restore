void sub_21062FC20()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EE48;
  qword_254A6EE48 = v2;

}

void sub_210630FD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21063158C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EE58;
  qword_254A6EE58 = v2;

}

void sub_210631E98(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x210631E68);
}

void sub_21063204C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EE68;
  qword_254A6EE68 = v2;

}

void sub_2106325E0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EE78;
  qword_254A6EE78 = v2;

}

void sub_210632B94()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EE88;
  qword_254A6EE88 = v2;

}

void sub_210633350()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EE98;
  qword_254A6EE98 = v2;

}

void sub_210633854()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EEA8;
  qword_254A6EEA8 = v2;

}

void sub_210633B78()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EEB8;
  qword_254A6EEB8 = v2;

}

void sub_210634C0C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EEC8;
  qword_254A6EEC8 = v2;

}

void sub_210634D0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210634E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210634E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210634EAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210634EC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210634EDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210634FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210635010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210635058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210635140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_210635160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210635178(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_210635290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_2106352B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106352D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106352EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210635304(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210635320(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210635338(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106353C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106353D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210635478(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210635488(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106354A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210635630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106356CC(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_2106357A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106357BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106357D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106359A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106359B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106359C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106359D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210635DEC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EED8;
  qword_254A6EED8 = v2;

}

void sub_210637690()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EEE8;
  qword_254A6EEE8 = v2;

}

void sub_2106380D0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EEF8;
  qword_254A6EEF8 = v2;

}

void sub_210638790()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EF08;
  qword_254A6EF08 = v2;

}

void sub_210639278()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EF18;
  qword_254A6EF18 = v2;

}

void sub_21063E6AC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21063E6BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21063E6CC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_210645F0C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  CMTime v8;
  CMTime time1;
  CMTime v10[2];

  v4 = a2;
  v5 = a3;
  memset(&v10[1], 0, sizeof(CMTime));
  if (v4)
    objc_msgSend(v4, "timestamp");
  memset(v10, 0, 24);
  if (v5)
    objc_msgSend(v5, "timestamp");
  time1 = v10[0];
  v8 = v10[1];
  v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

void sub_21064641C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = v11;
  if (a2 == 1)
  {
    v12 = objc_begin_catch(exception_object);
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Cannot add track to stream: %@"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "movWriterInterfaceErrorWithMessage:code:", v14, 2);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(v10 + v18);
    *(_QWORD *)(v10 + v18) = v15;

    objc_end_catch();
    JUMPOUT(0x2106463F8);
  }
  _Unwind_Resume(exception_object);
}

void sub_210646B7C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_210646B8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210646BA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210646BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_210646BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_210646C54(uint64_t a1, __CVBuffer *a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "arrayFrom3x3Matrix:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(a2, (CFStringRef)*MEMORY[0x24BDC0CD8], v5, kCVAttachmentMode_ShouldPropagate);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(a2, CFSTR("ExposureTime"), v4, kCVAttachmentMode_ShouldPropagate);

}

void sub_2106470D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2106470EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210647104(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210647118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21064712C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21064731C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2106474F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2106476B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2106478BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210647960(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648CB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648CC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648CD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648CEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648D00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648D14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648D28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648D3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648D64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648EA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648EB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648ECC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210648EE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2106491F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21064920C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210649220(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210649234(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210649248(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21064925C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210649270(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210649288(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21064929C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 600);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (v9)
  {
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 0;
    if (v10)
    {
      v11 = -1;
    }
    else if (v7 | v8)
    {
      v11 = objc_msgSend((id)v7, "compare:", v8);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

void sub_210649A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  nullsub_2(&a9);
  _Unwind_Resume(a1);
}

void sub_210649AB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_210649CEC()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.reality.kind.data.imu800");
  v2[1] = CFSTR("com.apple.reality.kind.data.accelerometer");
  v2[2] = CFSTR("com.apple.reality.kind.data.gyroscope");
  v2[3] = CFSTR("com.apple.reality.kind.data.motion");
  v2[4] = CFSTR("com.apple.reality.kind.data.als");
  v2[5] = CFSTR("com.apple.reality.kind.data.wifi");
  v2[6] = CFSTR("com.apple.reality.kind.data.compass");
  v2[7] = CFSTR("RawAccelerometer");
  v2[8] = CFSTR("RawGyroscope");
  v2[9] = CFSTR("ALS");
  v2[10] = CFSTR("WiFi");
  v2[11] = CFSTR("Compass");
  v2[12] = CFSTR("Motion");
  v2[13] = CFSTR("com.apple.reality.kind.data.devicemotion");
  v2[14] = CFSTR("Location");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_254A6EF38;
  qword_254A6EF38 = v0;

}

void sub_21064A374()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EF48;
  qword_254A6EF48 = v2;

}

id sub_21064B6F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1540], "appleCV3DMOVKitErrorWithDomain:message:code:", CFSTR("com.apple.AppleCV3DMOVKit.readererror"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("⛔️⛔️⛔️ ERROR [MOVReaderInterface]: %@ ⛔️⛔️⛔️"), v4);
  return v4;
}

id sub_21064B74C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1540], "appleCV3DMOVKitErrorWithDomain:message:code:", CFSTR("com.apple.AppleCV3DMOVKit.readerwarning"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("⚠️⚠️⚠️ WARNING [MOVReaderInterface]: %@ ⚠️⚠️⚠️"), v4);
  return v4;
}

id sub_21064B7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1540], "appleCV3DMOVKitErrorWithDomain:message:code:", CFSTR("com.apple.AppleCV3DMOVKit.writererror"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("⛔️⛔️⛔️ ERROR [MOVWriterInterface]: %@ ⛔️⛔️⛔️"), v4);
  return v4;
}

id sub_21064B7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1540], "appleCV3DMOVKitErrorWithDomain:message:code:", CFSTR("com.apple.AppleCV3DMOVKit.writerwarning"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("⚠️⚠️⚠️ WARNING [MOVWriterInterface]: %@ ⚠️⚠️⚠️"), v4);
  return v4;
}

id sub_21064B854(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_21064B9C0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EF58;
  qword_254A6EF58 = v2;

}

void sub_21064C234()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254A6EF78;
  qword_254A6EF78 = v2;

}

void sub_21064C530()
{
  JUMPOUT(0x212BC878CLL);
}

void sub_21064C544(std::string *a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    v3 = v2;
    sub_21064D38C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21064C59C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21064C5B4(std::string *a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    v3 = v2;
    sub_21064D38C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21064C60C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21064C624(std::string *a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    v3 = v2;
    sub_21064D38C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21064C67C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21064C694(std::string *a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    v3 = v2;
    sub_21064D38C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21064C6EC(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21064C704(std::string *a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    v3 = v2;
    sub_21064D38C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21064C75C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21064C774(std::string *a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    v3 = v2;
    sub_21064D38C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21064C7CC(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21064C7E4(uint64_t a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;
  std::string::value_type v4;
  std::string::size_type v5;
  __int16 v6;
  char v7;
  std::string v8;
  std::string::value_type v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (const __CFString *)MGGetStringAnswer();
  v10 = v2;
  if (!v2)
  {
    v4 = 0;
    goto LABEL_5;
  }
  v3 = v2;
  sub_21064D38C(v2, &v8);
  CFRelease(v3);
  v4 = v9;
  if (!v9)
  {
LABEL_5:
    v7 = 10;
    v6 = 28271;
    v5 = 0x69746375646F7250;
    goto LABEL_6;
  }
  v5 = v8.__r_.__value_.__r.__words[0];
  v6 = v8.__r_.__value_.__r.__words[1];
  v4 = v8.__r_.__value_.__s.__data_[10];
  v10 = *(const __CFString **)((char *)&v8.__r_.__value_.__r.__words[1] + 3);
  v11 = *(_DWORD *)((char *)&v8.__r_.__value_.__r.__words[2] + 3);
  v7 = HIBYTE(v8.__r_.__value_.__r.__words[2]);
LABEL_6:
  *(_QWORD *)a1 = v5;
  *(_WORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 10) = v4;
  *(_QWORD *)(a1 + 11) = v10;
  *(_DWORD *)(a1 + 19) = v11;
  *(_BYTE *)(a1 + 23) = v7;
  *(_BYTE *)(a1 + 24) = 1;
}

void sub_21064C8CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2)
    sub_2106356CC(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21064C8F0()
{
  return MGGetSInt64Answer();
}

uint64_t sub_21064C914()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (!v0)
    return 0;
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x24BDBD270]) | 0x100u;
}

uint64_t sub_21064C980()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (!v0)
    return 0;
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x24BDBD270]) | 0x100u;
}

uint64_t sub_21064C9EC()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (!v0)
    return 0;
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x24BDBD270]) | 0x100u;
}

uint64_t sub_21064CA58()
{
  return MGGetSInt32Answer() | 0x100000000;
}

void sub_21064CA80(std::string *a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    v3 = v2;
    sub_21064D38C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21064CAD8(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21064CAF0(uint64_t a1@<X8>)
{
  const __CFString *v2;
  const __CFString *v3;
  std::string::size_type size;
  char *v5;
  std::string *p_p;
  std::string *v7;
  std::string *v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  std::string *v17;
  char *v18;
  _OWORD *v19;
  std::string::size_type *v20;
  unint64_t v21;
  __int128 v22;
  std::string::value_type v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  std::string *v28;
  char *v29;
  _OWORD *v30;
  std::string::size_type *v31;
  unint64_t v32;
  __int128 v33;
  std::string::value_type v34;
  char *v35;
  void **v36;
  __int128 v37;
  void **v38;
  char *v39;
  _BOOL4 v40;
  void **v41;
  void **v42;
  char *v43;
  std::string __p;
  char v45;
  const __CFString *v46;
  char *v47;
  char *v48;
  char *v49;
  char **v50;

  v2 = (const __CFString *)MGGetStringAnswer();
  v46 = v2;
  if (!v2 || (v3 = v2, sub_21064D38C(v2, &__p), CFRelease(v3), !v45))
  {
    *(_BYTE *)a1 = 0;
    *(_BYTE *)(a1 + 24) = 0;
    return;
  }
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  v5 = 0;
  if (size)
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v7 = (std::string *)((char *)p_p + size);
    while (1)
    {
      v8 = v7;
      if (p_p != v7)
      {
        v8 = p_p;
        while (v8->__r_.__value_.__s.__data_[0] != 58)
        {
          v8 = (std::string *)((char *)v8 + 1);
          if (v8 == v7)
          {
            v8 = v7;
            break;
          }
        }
      }
      v9 = (char *)v8 - (char *)p_p;
      if (v8 != p_p)
        break;
      v8 = p_p;
LABEL_11:
      p_p = (std::string *)((char *)&v8->__r_.__value_.__l.__data_ + 1);
      if (v8 == v7)
      {
        v39 = v43;
        v40 = v45 != 0;
        *(_QWORD *)a1 = v41;
        *(_QWORD *)(a1 + 8) = v5;
        *(_QWORD *)(a1 + 16) = v39;
        *(_BYTE *)(a1 + 24) = 1;
        if (!v40)
          return;
        goto LABEL_71;
      }
    }
    if (v5 >= v43)
    {
      v11 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (char *)v41) >> 3);
      v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_21064D174();
      if (0x5555555555555556 * ((v43 - (char *)v41) >> 3) > v12)
        v12 = 0x5555555555555556 * ((v43 - (char *)v41) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((v43 - (char *)v41) >> 3) >= 0x555555555555555)
        v13 = 0xAAAAAAAAAAAAAAALL;
      else
        v13 = v12;
      v50 = &v43;
      if (v13)
      {
        if (v13 > 0xAAAAAAAAAAAAAAALL)
          sub_21064D118();
        v14 = (const __CFString *)operator new(24 * v13);
      }
      else
      {
        v14 = 0;
      }
      v24 = (char *)v14 + 24 * v11;
      v46 = v14;
      v47 = v24;
      v48 = v24;
      v49 = (char *)v14 + 24 * v13;
      if (v9 > 0x7FFFFFFFFFFFFFF7)
        sub_21064D090();
      if (v9 <= 0x16)
      {
        v24[23] = v9;
        goto LABEL_54;
      }
      v25 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17)
        v25 = v9 | 7;
      v26 = v25 + 1;
      v27 = (char *)operator new(v25 + 1);
      *((_QWORD *)v24 + 1) = v9;
      *((_QWORD *)v24 + 2) = v26 | 0x8000000000000000;
      *(_QWORD *)v24 = v27;
      v24 = v27;
      if (v9 >= 0x20 && (unint64_t)(v27 - (char *)p_p) >= 0x20)
      {
        v28 = (std::string *)((char *)p_p + (v9 & 0xFFFFFFFFFFFFFFE0));
        v29 = &v27[v9 & 0xFFFFFFFFFFFFFFE0];
        v30 = v27 + 16;
        v31 = &p_p->__r_.__value_.__r.__words[2];
        v32 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v33 = *(_OWORD *)v31;
          *(v30 - 1) = *((_OWORD *)v31 - 1);
          *v30 = v33;
          v30 += 2;
          v31 += 4;
          v32 -= 32;
        }
        while (v32);
        if (v9 != (v9 & 0x7FFFFFFFFFFFFFE0))
        {
          do
          {
LABEL_55:
            v34 = v28->__r_.__value_.__s.__data_[0];
            v28 = (std::string *)((char *)v28 + 1);
            *v29++ = v34;
          }
          while (v28 != v8);
        }
        *v29 = 0;
        v35 = v47;
        v5 = v48 + 24;
        v36 = v42;
        if (v42 == v41)
        {
          v41 = (void **)v47;
          v43 = v49;
        }
        else
        {
          do
          {
            v37 = *(_OWORD *)(v36 - 3);
            *((_QWORD *)v35 - 1) = *(v36 - 1);
            *(_OWORD *)(v35 - 24) = v37;
            v35 -= 24;
            *(v36 - 2) = 0;
            *(v36 - 1) = 0;
            *(v36 - 3) = 0;
            v36 -= 3;
          }
          while (v36 != v41);
          v36 = v41;
          v38 = v42;
          v41 = (void **)v35;
          v43 = v49;
          while (v38 != v36)
          {
            if (*((char *)v38 - 1) < 0)
              operator delete(*(v38 - 3));
            v38 -= 3;
          }
        }
        if (v36)
          operator delete(v36);
        v42 = (void **)v5;
        goto LABEL_11;
      }
LABEL_54:
      v28 = p_p;
      v29 = v24;
      goto LABEL_55;
    }
    if (v9 > 0x7FFFFFFFFFFFFFF7)
      sub_21064D090();
    if (v9 > 0x16)
    {
      v15 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17)
        v15 = v9 | 7;
      v16 = v15 + 1;
      v10 = (char *)operator new(v15 + 1);
      *((_QWORD *)v5 + 1) = v9;
      *((_QWORD *)v5 + 2) = v16 | 0x8000000000000000;
      *(_QWORD *)v5 = v10;
      if (v9 >= 0x20 && (unint64_t)(v10 - (char *)p_p) >= 0x20)
      {
        v17 = (std::string *)((char *)p_p + (v9 & 0xFFFFFFFFFFFFFFE0));
        v18 = &v10[v9 & 0xFFFFFFFFFFFFFFE0];
        v19 = v10 + 16;
        v20 = &p_p->__r_.__value_.__r.__words[2];
        v21 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v22 = *(_OWORD *)v20;
          *(v19 - 1) = *((_OWORD *)v20 - 1);
          *v19 = v22;
          v19 += 2;
          v20 += 4;
          v21 -= 32;
        }
        while (v21);
        if (v9 == (v9 & 0x7FFFFFFFFFFFFFE0))
          goto LABEL_41;
        goto LABEL_40;
      }
    }
    else
    {
      v5[23] = v9;
      v10 = v5;
    }
    v17 = p_p;
    v18 = v10;
    do
    {
LABEL_40:
      v23 = v17->__r_.__value_.__s.__data_[0];
      v17 = (std::string *)((char *)v17 + 1);
      *v18++ = v23;
    }
    while (v17 != v8);
LABEL_41:
    *v18 = 0;
    v5 += 24;
    v42 = (void **)v5;
    goto LABEL_11;
  }
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
LABEL_71:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_21064CF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_21064D140((const void **)va);
  _Unwind_Resume(a1);
}

void sub_21064CF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, int a19, __int16 a20,char a21,char a22)
{
  sub_21064CFB4((void **)&a9);
  if (a18)
  {
    if (a17 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void **sub_21064CFB4(void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_21064D024()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (!v0)
    return 0;
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x24BDBD270]) | 0x100u;
}

void sub_21064D090()
{
  sub_21064D0A4("basic_string");
}

void sub_21064D0A4(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_21064D0F4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CA35B90, MEMORY[0x24BEDAAF0]);
}

void sub_21064D0E0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_21064D0F4(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_21064D118()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

const void **sub_21064D140(const void **a1)
{
  const void *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_21064D174()
{
  sub_21064D0A4("vector");
}

uint64_t sub_21064D188(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v5;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_21064D1EC(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  _BOOL4 v6;
  int v7;
  size_t v8;
  uint64_t v9;
  unint64_t v10;
  void **v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *__p[2];
  unsigned __int8 v17;
  char v18;

  (*(void (**)(void **__return_ptr))(*(_QWORD *)a1 + 32))(__p);
  if (!v18)
  {
    a2[23] = 7;
    strcpy(a2, "Unknown");
    return;
  }
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1);
  v6 = (v4 & 0xFF00000000) == 0 || (_DWORD)v4 != 1;
  v7 = (char)v17;
  if ((v17 & 0x80u) == 0)
    v8 = v17;
  else
    v8 = (size_t)__p[1];
  if (v6)
    v9 = 0;
  else
    v9 = 5;
  v10 = v8 + v9;
  if (v8 + v9 >= 0x7FFFFFFFFFFFFFF8)
    sub_21064D090();
  if (v10 > 0x16)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    v15 = (char *)operator new(v13 + 1);
    *((_QWORD *)a2 + 1) = v10;
    *((_QWORD *)a2 + 2) = v14 | 0x8000000000000000;
    *(_QWORD *)a2 = v15;
    a2 = v15;
    if (!v8)
      goto LABEL_21;
    goto LABEL_17;
  }
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  a2[23] = v10;
  if (v8)
  {
LABEL_17:
    if (v7 >= 0)
      v11 = __p;
    else
      v11 = (void **)__p[0];
    memmove(a2, v11, v8);
  }
LABEL_21:
  v12 = &a2[v8];
  if (!v6)
  {
    v12[4] = 77;
    *(_DWORD *)v12 = 1230196831;
  }
  v12[v9] = 0;
  if (v7 < 0)
  {
    if (v18)
      operator delete(__p[0]);
  }
}

void sub_21064D364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a15)
  {
    if (a14 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const __CFString *sub_21064D38C@<X0>(const __CFString *result@<X0>, std::string *a2@<X8>)
{
  const __CFString *v3;
  CFIndex v4;
  CFIndex v5;
  std::string *v6;
  std::string v7;
  CFIndex usedBufLen;
  CFRange v9;
  CFRange v10;

  if (!result)
    goto LABEL_8;
  v3 = result;
  result = (const __CFString *)CFStringGetLength(result);
  if (result)
  {
    v4 = (CFIndex)result;
    usedBufLen = 0;
    v9.location = 0;
    v9.length = (CFIndex)result;
    result = (const __CFString *)CFStringGetBytes(v3, v9, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    if ((uint64_t)result > 0)
    {
      memset(&v7, 0, sizeof(v7));
      if (usedBufLen)
      {
        std::string::append(&v7, usedBufLen, 0);
        v5 = usedBufLen;
        if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v6 = &v7;
        else
          v6 = (std::string *)v7.__r_.__value_.__r.__words[0];
      }
      else
      {
        v5 = 0;
        v6 = &v7;
      }
      v10.location = 0;
      v10.length = v4;
      result = (const __CFString *)CFStringGetBytes(v3, v10, 0x8000100u, 0, 0, (UInt8 *)v6, v5, 0);
      *a2 = v7;
      goto LABEL_12;
    }
LABEL_8:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
    return result;
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
LABEL_12:
  a2[1].__r_.__value_.__s.__data_[0] = 1;
  return result;
}

void sub_21064D4B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

uint64_t CFCopySystemVersionString()
{
  return MEMORY[0x24BDBBC78]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x24BDC0168](retstr, hostTime);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0638](allocator, *(_QWORD *)&codecType, *(_QWORD *)&width, *(_QWORD *)&height, extensions, formatDescriptionOut);
}

CFDictionaryRef CVBufferGetAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5150](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5250](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x24BED84A0]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CA35BA8(__p);
}

uint64_t operator delete()
{
  return off_24CA35BB0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA35BB8(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

